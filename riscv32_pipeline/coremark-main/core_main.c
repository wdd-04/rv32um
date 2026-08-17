/*
Copyright 2018 Embedded Microprocessor Benchmark Consortium (EEMBC)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Original Author: Shay Gal-on
*/

/* File: core_main.c
        This file contains the framework to acquire a block of memory, seed
   initial parameters, tun t he benchmark and report the results.
*/
#include "coremark.h"

#ifndef COREMARK_PROGRESS_LOG
#define COREMARK_PROGRESS_LOG 1
#endif

#if COREMARK_PROGRESS_LOG
#define CM_LOG(...) ee_printf(__VA_ARGS__)
#else
#define CM_LOG(...) do { } while (0)
#endif
#define CM_ALWAYS(...) ee_printf(__VA_ARGS__)

static int cm_log_progress_point(ee_u32 i, ee_u32 iterations)
{
    ee_u32 step;

    if (iterations <= 4)
        return 1;
    if ((i == 0) || (i + 1 == iterations))
        return 1;
    step = iterations / 4;
    if (step == 0)
        step = 1;
    return (((i + 1) % step) == 0);
}

static ee_u32 cm_score_x1000(ee_u32 contexts, ee_u32 iterations, CORE_TICKS ticks)
{
    unsigned long long work;

    if (ticks == 0)
        return 0;

    work = (unsigned long long)contexts
         * (unsigned long long)iterations
         * (unsigned long long)EE_TICKS_PER_SEC
         * 1000ull;
    return (ee_u32)(work / (unsigned long long)ticks);
}

static ee_u32 cm_score_per_mhz_x1000(ee_u32 score_x1000)
{
    ee_u32 mhz = (ee_u32)(EE_TICKS_PER_SEC / 1000000u);

    if (mhz == 0)
        return 0;

    return score_x1000 / mhz;
}

static void cm_print_fixed3(const char *name, ee_u32 value_x1000)
{
    ee_printf("%s: %lu.%03lu\n",
              name,
              (long unsigned)(value_x1000 / 1000u),
              (long unsigned)(value_x1000 % 1000u));
}

/* Function: iterate
        Run the benchmark for a specified number of iterations.

        Operation:
        For each type of benchmarked algorithm:
                a - Initialize the data block for the algorithm.
                b - Execute the algorithm N times.

        Returns:
        NULL.
*/
static ee_u16 list_known_crc[]   = { (ee_u16)0xd4b0,
                                   (ee_u16)0x3340,
                                   (ee_u16)0x6a79,
                                   (ee_u16)0xe714,
                                   (ee_u16)0xe3c1 };
static ee_u16 matrix_known_crc[] = { (ee_u16)0xbe52,
                                     (ee_u16)0x1199,
                                     (ee_u16)0x5608,
                                     (ee_u16)0x1fd7,
                                     (ee_u16)0x0747 };
static ee_u16 state_known_crc[]  = { (ee_u16)0x5e47,
                                    (ee_u16)0x39bf,
                                    (ee_u16)0xe5a4,
                                    (ee_u16)0x8e3a,
                                    (ee_u16)0x8d84 };
void *
iterate(void *pres)
{
    ee_u32        i;
    ee_u16        crc;
    core_results *res        = (core_results *)pres;
    ee_u32        iterations = res->iterations;
    res->crc                 = 0;
    res->crclist             = 0;
    res->crcmatrix           = 0;
    res->crcstate            = 0;

    CM_ALWAYS("[CM] ITERATE_BEGIN iterations=%lu\r\n", (long unsigned)iterations);
    for (i = 0; i < iterations; i++)
    {
        if (i == 0)
            CM_ALWAYS("[CM] ITER0_LIST_POS_BEGIN\r\n");
        crc      = core_bench_list(res, 1);
        if (i == 0)
            CM_ALWAYS("[CM] ITER0_LIST_POS_DONE crc=0x%04x\r\n", crc);
        res->crc = crcu16(crc, res->crc);
        if (i == 0)
            CM_ALWAYS("[CM] ITER0_LIST_NEG_BEGIN\r\n");
        crc      = core_bench_list(res, -1);
        if (i == 0)
            CM_ALWAYS("[CM] ITER0_LIST_NEG_DONE crc=0x%04x\r\n", crc);
        res->crc = crcu16(crc, res->crc);
        if (i == 0)
            res->crclist = res->crc;
        if (cm_log_progress_point(i, iterations))
            CM_LOG("[CM] ITER_PROGRESS %lu/%lu crc=0x%04x\r\n",
                   (long unsigned)(i + 1),
                   (long unsigned)iterations,
                   res->crc);
    }
    CM_ALWAYS("[CM] ITERATE_DONE crc=0x%04x\r\n", res->crc);
    return NULL;
}

#if (SEED_METHOD == SEED_ARG)
ee_s32 get_seed_args(int i, int argc, char *argv[]);
#define get_seed(x)    (ee_s16) get_seed_args(x, argc, argv)
#define get_seed_32(x) get_seed_args(x, argc, argv)
#else /* via function or volatile */
ee_s32 get_seed_32(int i);
#define get_seed(x) (ee_s16) get_seed_32(x)
#endif

#if (MEM_METHOD == MEM_STATIC)
ee_u8 static_memblk[TOTAL_DATA_SIZE];
#endif
char *mem_name[3] = { "Static", "Heap", "Stack" };
/* Function: main
        Main entry routine for the benchmark.
        This function is responsible for the following steps:

        1 - Initialize input seeds from a source that cannot be determined at
   compile time. 2 - Initialize memory block for use. 3 - Run and time the
   benchmark. 4 - Report results, testing the validity of the output if the
   seeds are known.

        Arguments:
        1 - first seed  : Any value
        2 - second seed : Must be identical to first for iterations to be
   identical 3 - third seed  : Any value, should be at least an order of
   magnitude less then the input size, but bigger then 32. 4 - Iterations  :
   Special, if set to 0, iterations will be automatically determined such that
   the benchmark will run between 10 to 100 secs

*/

#if MAIN_HAS_NOARGC
MAIN_RETURN_TYPE
main(void)
{
    int   argc = 0;
    char *argv[1];
#else
MAIN_RETURN_TYPE
main(int argc, char *argv[])
{
#endif
    ee_u16       i, j = 0, num_algorithms = 0;
    ee_s16       known_id = -1, total_errors = 0;
    ee_u16       seedcrc = 0;
    CORE_TICKS   total_time;
    core_results results[MULTITHREAD];
#if (MEM_METHOD == MEM_STACK)
    ee_u8 stack_memblock[TOTAL_DATA_SIZE * MULTITHREAD];
#endif
    /* first call any initializations needed */
    portable_init(&(results[0].port), &argc, argv);
    CM_ALWAYS("[CM] BUILD_TAG crc_probe_20260506_B\r\n");
    CM_ALWAYS("[CM] MAIN_AFTER_PORTABLE_INIT\r\n");
    /* First some checks to make sure benchmark will run ok */
    if (sizeof(struct list_head_s) > 128)
    {
        ee_printf("list_head structure too big for comparable data!\n");
        return MAIN_RETURN_VAL;
    }
    results[0].seed1      = get_seed(1);
    results[0].seed2      = get_seed(2);
    results[0].seed3      = get_seed(3);
    results[0].iterations = get_seed_32(4);
#if CORE_DEBUG
    results[0].iterations = 1;
#endif
    results[0].execs = get_seed_32(5);
    CM_LOG("[CM] SEEDS seed1=0x%04x seed2=0x%04x seed3=0x%04x iterations=%lu execs=0x%08lx\r\n",
           results[0].seed1,
           results[0].seed2,
           results[0].seed3,
           (long unsigned)results[0].iterations,
           (long unsigned)results[0].execs);
    if (results[0].execs == 0)
    { /* if not supplied, execute all algorithms */
        CM_LOG("[CM] EXECS_ZERO_USE_ALL mask=0x%08lx\r\n",
               (long unsigned)ALL_ALGORITHMS_MASK);
        results[0].execs = ALL_ALGORITHMS_MASK;
    }
    CM_LOG("[CM] EXECS_READY execs=0x%08lx\r\n",
           (long unsigned)results[0].execs);
    /* put in some default values based on one seed only for easy testing */
    if ((results[0].seed1 == 0) && (results[0].seed2 == 0)
        && (results[0].seed3 == 0))
    { /* performance run */
        results[0].seed1 = 0;
        results[0].seed2 = 0;
        results[0].seed3 = 0x66;
    }
    if ((results[0].seed1 == 1) && (results[0].seed2 == 0)
        && (results[0].seed3 == 0))
    { /* validation run */
        results[0].seed1 = 0x3415;
        results[0].seed2 = 0x3415;
        results[0].seed3 = 0x66;
    }
    CM_ALWAYS("[CM] SEEDS_READY seed1=0x%04x seed2=0x%04x seed3=0x%04x iterations=%lu execs=0x%08lx\r\n",
              results[0].seed1,
              results[0].seed2,
              results[0].seed3,
              (long unsigned)results[0].iterations,
              (long unsigned)results[0].execs);
    CM_LOG("[CM] SEEDS_READY seed1=0x%04x seed2=0x%04x seed3=0x%04x\r\n",
           results[0].seed1,
           results[0].seed2,
           results[0].seed3);
#if (MEM_METHOD == MEM_STATIC)
    CM_ALWAYS("[CM] MEM_STATIC_BEGIN static_memblk=0x%08lx total=%lu\r\n",
              (long unsigned)(ee_ptr_int)static_memblk,
              (long unsigned)TOTAL_DATA_SIZE);
    CM_LOG("[CM] MEM_STATIC_BEGIN static_memblk=0x%08lx total=%lu\r\n",
           (long unsigned)(ee_ptr_int)static_memblk,
           (long unsigned)TOTAL_DATA_SIZE);
    results[0].memblock[0] = (void *)static_memblk;
    results[0].size        = TOTAL_DATA_SIZE;
    results[0].err         = 0;
    CM_ALWAYS("[CM] MEM_STATIC_DONE memblock0=0x%08lx size=%lu err=%d\r\n",
              (long unsigned)(ee_ptr_int)results[0].memblock[0],
              (long unsigned)results[0].size,
              results[0].err);
    CM_LOG("[CM] MEM_STATIC_DONE memblock0=0x%08lx size=%lu err=%d\r\n",
           (long unsigned)(ee_ptr_int)results[0].memblock[0],
           (long unsigned)results[0].size,
           results[0].err);
#if (MULTITHREAD > 1)
#error "Cannot use a static data area with multiple contexts!"
#endif
#elif (MEM_METHOD == MEM_MALLOC)
    for (i = 0; i < MULTITHREAD; i++)
    {
        ee_s32 malloc_override = get_seed(7);
        if (malloc_override != 0)
            results[i].size = malloc_override;
        else
            results[i].size = TOTAL_DATA_SIZE;
        results[i].memblock[0] = portable_malloc(results[i].size);
        results[i].seed1       = results[0].seed1;
        results[i].seed2       = results[0].seed2;
        results[i].seed3       = results[0].seed3;
        results[i].err         = 0;
        results[i].execs       = results[0].execs;
    }
#elif (MEM_METHOD == MEM_STACK)
for (i = 0; i < MULTITHREAD; i++)
{
    results[i].memblock[0] = stack_memblock + i * TOTAL_DATA_SIZE;
    results[i].size        = TOTAL_DATA_SIZE;
    results[i].seed1       = results[0].seed1;
    results[i].seed2       = results[0].seed2;
    results[i].seed3       = results[0].seed3;
    results[i].err         = 0;
    results[i].execs       = results[0].execs;
}
#else
#error "Please define a way to initialize a memory block."
#endif
    /* Data init */
    /* Find out how space much we have based on number of algorithms */
    CM_LOG("[CM] COUNT_ALG_BEGIN execs=0x%08lx NUM_ALGORITHMS=%u\r\n",
           (long unsigned)results[0].execs,
           NUM_ALGORITHMS);
    for (i = 0; i < NUM_ALGORITHMS; i++)
    {
        ee_u32 alg_mask = (1 << (ee_u32)i);
        CM_LOG("[CM] COUNT_ALG_STEP i=%u mask=0x%08lx hit=%u before=%u\r\n",
               i,
               (long unsigned)alg_mask,
               ((alg_mask & results[0].execs) != 0),
               num_algorithms);
        if (alg_mask & results[0].execs)
            num_algorithms++;
    }
    CM_ALWAYS("[CM] COUNT_ALG_DONE num_algorithms=%u execs=0x%08lx\r\n",
              num_algorithms,
              (long unsigned)results[0].execs);
    CM_LOG("[CM] COUNT_ALG_DONE num_algorithms=%u\r\n", num_algorithms);
    if (num_algorithms == 0)
    {
        CM_LOG("[CM] ERROR_NUM_ALGORITHMS_ZERO execs=0x%08lx\r\n",
               (long unsigned)results[0].execs);
        return MAIN_RETURN_VAL;
    }
    CM_LOG("[CM] DIV_SIZE_BEGIN size0=%lu num_algorithms=%u contexts=%u\r\n",
           (long unsigned)results[0].size,
           num_algorithms,
           MULTITHREAD);
    for (i = 0; i < MULTITHREAD; i++)
    {
        CM_LOG("[CM] DIV_SIZE_CTX_BEGIN ctx=%u size_before=%lu\r\n",
               i,
               (long unsigned)results[i].size);
        results[i].size = results[i].size / num_algorithms;
        CM_LOG("[CM] DIV_SIZE_CTX_DONE ctx=%u size_after=%lu\r\n",
               i,
               (long unsigned)results[i].size);
    }
    CM_LOG("[CM] DATA_SPLIT algorithms=%u per_alg_size=%lu total_data=%lu\r\n",
           num_algorithms,
           (long unsigned)results[0].size,
           (long unsigned)TOTAL_DATA_SIZE);
    /* Assign pointers */
    CM_LOG("[CM] ASSIGN_PTR_BEGIN size=%lu\r\n", (long unsigned)results[0].size);
    for (i = 0; i < NUM_ALGORITHMS; i++)
    {
        ee_u32 ctx;
        ee_u32 alg_mask = (1 << (ee_u32)i);
        if (alg_mask & results[0].execs)
        {
            CM_LOG("[CM] ASSIGN_PTR_ALG i=%u j=%u mask=0x%08lx\r\n",
                   i,
                   j,
                   (long unsigned)alg_mask);
            for (ctx = 0; ctx < MULTITHREAD; ctx++)
            {
                results[ctx].memblock[i + 1]
                    = (char *)(results[ctx].memblock[0]) + results[0].size * j;
                CM_LOG("[CM] ASSIGN_PTR ctx=%lu alg=%u addr=0x%08lx\r\n",
                       (long unsigned)ctx,
                       i,
                       (long unsigned)(ee_ptr_int)results[ctx].memblock[i + 1]);
            }
            j++;
        }
    }
    CM_ALWAYS("[CM] ASSIGN_PTR_DONE j=%u per_alg_size=%lu\r\n",
              j,
              (long unsigned)results[0].size);
    CM_LOG("[CM] ASSIGN_PTR_DONE j=%u\r\n", j);
    /* call inits */
    for (i = 0; i < MULTITHREAD; i++)
    {
        if (results[i].execs & ID_LIST)
        {
            CM_ALWAYS("[CM] INIT_LIST_BEGIN ctx=%u mem=0x%08lx size=%lu\r\n",
                      i,
                      (long unsigned)(ee_ptr_int)results[i].memblock[1],
                      (long unsigned)results[0].size);
            CM_LOG("[CM] INIT_LIST_BEGIN ctx=%u\r\n", i);
            results[i].list = core_list_init(
                results[0].size, results[i].memblock[1], results[i].seed1);
            CM_ALWAYS("[CM] INIT_LIST_DONE ctx=%u list=0x%08lx\r\n",
                      i,
                      (long unsigned)(ee_ptr_int)results[i].list);
            CM_LOG("[CM] INIT_LIST_DONE ctx=%u\r\n", i);
        }
        if (results[i].execs & ID_MATRIX)
        {
            CM_ALWAYS("[CM] INIT_MATRIX_BEGIN ctx=%u mem=0x%08lx size=%lu\r\n",
                      i,
                      (long unsigned)(ee_ptr_int)results[i].memblock[2],
                      (long unsigned)results[0].size);
            CM_LOG("[CM] INIT_MATRIX_BEGIN ctx=%u\r\n", i);
            core_init_matrix(results[0].size,
                             results[i].memblock[2],
                             (ee_s32)results[i].seed1
                                 | (((ee_s32)results[i].seed2) << 16),
                             &(results[i].mat));
            CM_ALWAYS("[CM] INIT_MATRIX_DONE ctx=%u matN=%u\r\n",
                      i,
                      results[i].mat.N);
            CM_LOG("[CM] INIT_MATRIX_DONE ctx=%u\r\n", i);
        }
        if (results[i].execs & ID_STATE)
        {
            CM_ALWAYS("[CM] INIT_STATE_BEGIN ctx=%u mem=0x%08lx size=%lu\r\n",
                      i,
                      (long unsigned)(ee_ptr_int)results[i].memblock[3],
                      (long unsigned)results[0].size);
            CM_LOG("[CM] INIT_STATE_BEGIN ctx=%u\r\n", i);
            core_init_state(
                results[0].size, results[i].seed1, results[i].memblock[3]);
            CM_ALWAYS("[CM] INIT_STATE_DONE ctx=%u\r\n", i);
            CM_LOG("[CM] INIT_STATE_DONE ctx=%u\r\n", i);
        }
    }

    CM_ALWAYS("[CM] DATA_INIT_DONE\r\n");
    CM_LOG("[CM] DATA_INIT_DONE\r\n");

    /* automatically determine number of iterations if not set */
    if (results[0].iterations == 0)
    {
        secs_ret secs_passed = 0;
        CM_LOG("[CM] AUTO_ITER_BEGIN\r\n");
        ee_u32   divisor;
        results[0].iterations = 1;
        while (secs_passed < (secs_ret)1)
        {
            results[0].iterations *= 10;
            CM_LOG("[CM] AUTO_ITER_TRY iterations=%lu\r\n", (long unsigned)results[0].iterations);
            start_time();
            iterate(&results[0]);
            stop_time();
            secs_passed = time_in_secs(get_time());
            CM_LOG("[CM] AUTO_ITER_RESULT ticks=%lu secs=%lu\r\n",
                   (long unsigned)get_time(),
                   (long unsigned)secs_passed);
        }
        /* now we know it executes for at least 1 sec, set actual run time at
         * about 10 secs */
        divisor = (ee_u32)secs_passed;
        if (divisor == 0) /* some machines cast float to int as 0 since this
                             conversion is not defined by ANSI, but we know at
                             least one second passed */
            divisor = 1;
        results[0].iterations *= 1 + 10 / divisor;
        CM_LOG("[CM] AUTO_ITER_DONE final_iterations=%lu\r\n", (long unsigned)results[0].iterations);
    }
    else
    {
        CM_ALWAYS("[CM] FIXED_ITERATIONS iterations=%lu\r\n", (long unsigned)results[0].iterations);
        CM_LOG("[CM] FIXED_ITERATIONS iterations=%lu\r\n", (long unsigned)results[0].iterations);
    }
    /* perform actual benchmark */
    CM_ALWAYS("[CM] BENCH_START iterations=%lu\r\n", (long unsigned)results[0].iterations);
    CM_LOG("[CM] BENCH_START iterations=%lu\r\n", (long unsigned)results[0].iterations);
    start_time();
#if (MULTITHREAD > 1)
    if (default_num_contexts > MULTITHREAD)
    {
        default_num_contexts = MULTITHREAD;
    }
    for (i = 0; i < default_num_contexts; i++)
    {
        results[i].iterations = results[0].iterations;
        results[i].execs      = results[0].execs;
        core_start_parallel(&results[i]);
    }
    for (i = 0; i < default_num_contexts; i++)
    {
        core_stop_parallel(&results[i]);
    }
#else
    CM_ALWAYS("[CM] BENCH_CALL_ITERATE\r\n");
    iterate(&results[0]);
    CM_ALWAYS("[CM] BENCH_RETURN_ITERATE crc=0x%04x list=0x%04x matrix=0x%04x state=0x%04x\r\n",
              results[0].crc,
              results[0].crclist,
              results[0].crcmatrix,
              results[0].crcstate);
#endif
    stop_time();
    CM_ALWAYS("[CM] STOP_TIME_DONE\r\n");
    total_time = get_time();
    CM_ALWAYS("[CM] BENCH_DONE ticks=%lu\r\n", (long unsigned)total_time);
    CM_LOG("[CM] BENCH_DONE ticks=%lu\r\n", (long unsigned)total_time);
    {
        ee_u32 early_score_x1000 = cm_score_x1000((ee_u32)default_num_contexts,
                                                  results[0].iterations,
                                                  total_time);
        ee_u32 early_score_mhz_x1000 = cm_score_per_mhz_x1000(early_score_x1000);
        ee_printf("[CM] EARLY_RESULT iterations=%lu ticks=%lu\r\n",
                  (long unsigned)(default_num_contexts * results[0].iterations),
                  (long unsigned)total_time);
        cm_print_fixed3("[CM] EARLY_CoreMark/s  ", early_score_x1000);
        cm_print_fixed3("[CM] EARLY_CoreMark/MHz", early_score_mhz_x1000);
    }
    /* get a function of the input to report */
    CM_ALWAYS("[CM] SEEDCRC_BEGIN seed1=0x%04x seed2=0x%04x seed3=0x%04x size=%lu\r\n",
              results[0].seed1,
              results[0].seed2,
              results[0].seed3,
              (long unsigned)results[0].size);
    seedcrc = crc16(results[0].seed1, seedcrc);
    CM_ALWAYS("[CM] SEEDCRC_STEP1 value=0x%04x\r\n", seedcrc);
    seedcrc = crc16(results[0].seed2, seedcrc);
    CM_ALWAYS("[CM] SEEDCRC_STEP2 value=0x%04x\r\n", seedcrc);
    seedcrc = crc16(results[0].seed3, seedcrc);
    CM_ALWAYS("[CM] SEEDCRC_STEP3 value=0x%04x\r\n", seedcrc);
    seedcrc = crc16(results[0].size, seedcrc);

    CM_ALWAYS("[CM] SEEDCRC value=0x%04x size=%lu\r\n",
              seedcrc,
              (long unsigned)results[0].size);
    switch (seedcrc)
    {                /* test known output for common seeds */
        case 0x8a02: /* seed1=0, seed2=0, seed3=0x66, size 2000 per algorithm */
            known_id = 0;
            ee_printf("6k performance run parameters for coremark.\n");
            break;
        case 0x7b05: /*  seed1=0x3415, seed2=0x3415, seed3=0x66, size 2000 per
                        algorithm */
            known_id = 1;
            ee_printf("6k validation run parameters for coremark.\n");
            break;
        case 0x4eaf: /* seed1=0x8, seed2=0x8, seed3=0x8, size 400 per algorithm
                      */
            known_id = 2;
            ee_printf("Profile generation run parameters for coremark.\n");
            break;
        case 0xe9f5: /* seed1=0, seed2=0, seed3=0x66, size 666 per algorithm */
            known_id = 3;
            ee_printf("2K performance run parameters for coremark.\n");
            break;
        case 0x18f2: /*  seed1=0x3415, seed2=0x3415, seed3=0x66, size 666 per
                        algorithm */
            known_id = 4;
            ee_printf("2K validation run parameters for coremark.\n");
            break;
        default:
            total_errors = -1;
            break;
    }
    CM_ALWAYS("[CM] SEEDCRC_SWITCH_DONE seedcrc=0x%04x known_id=%d total_errors=%d\r\n",
              seedcrc,
              known_id,
              total_errors);
    if (known_id >= 0)
    {
        CM_ALWAYS("[CM] CRC_VALIDATE_BEGIN known_id=%d contexts=%d execs=0x%08lx\r\n",
                  known_id,
                  default_num_contexts,
                  (long unsigned)results[0].execs);
        CM_LOG("[CM] CRC_VALIDATE_BEGIN known_id=%d contexts=%d execs=0x%08lx\r\n",
               known_id,
               default_num_contexts,
               (long unsigned)results[0].execs);
        for (i = 0; i < default_num_contexts; i++)
        {
            results[i].err = 0;
            CM_ALWAYS("[CM] CRC_CTX_BEGIN i=%d execs=0x%08lx\r\n",
                      i,
                      (long unsigned)results[i].execs);
            CM_ALWAYS("[CM] CRC_CTX i=%d list=0x%04x exp=0x%04x matrix=0x%04x exp=0x%04x state=0x%04x exp=0x%04x final=0x%04x\r\n",
                      i,
                      results[i].crclist,
                      list_known_crc[known_id],
                      results[i].crcmatrix,
                      matrix_known_crc[known_id],
                      results[i].crcstate,
                      state_known_crc[known_id],
                      results[i].crc);
            CM_LOG("[CM] CRC_CTX i=%d list=0x%04x exp=0x%04x matrix=0x%04x exp=0x%04x state=0x%04x exp=0x%04x final=0x%04x\r\n",
                   i,
                   results[i].crclist,
                   list_known_crc[known_id],
                   results[i].crcmatrix,
                   matrix_known_crc[known_id],
                   results[i].crcstate,
                   state_known_crc[known_id],
                   results[i].crc);
            CM_ALWAYS("[CM] CRC_LIST_CHECK_BEGIN i=%d enabled=%d\r\n",
                      i,
                      ((results[i].execs & ID_LIST) != 0));
            if ((results[i].execs & ID_LIST)
                && (results[i].crclist != list_known_crc[known_id]))
            {
                ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",
                          i,
                          results[i].crclist,
                          list_known_crc[known_id]);
                results[i].err++;
            }
            CM_ALWAYS("[CM] CRC_LIST_CHECK_DONE i=%d err=%d\r\n",
                      i,
                      results[i].err);
            CM_ALWAYS("[CM] CRC_MATRIX_CHECK_BEGIN i=%d enabled=%d\r\n",
                      i,
                      ((results[i].execs & ID_MATRIX) != 0));
            if ((results[i].execs & ID_MATRIX)
                && (results[i].crcmatrix != matrix_known_crc[known_id]))
            {
                ee_printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n",
                          i,
                          results[i].crcmatrix,
                          matrix_known_crc[known_id]);
                results[i].err++;
            }
            CM_ALWAYS("[CM] CRC_MATRIX_CHECK_DONE i=%d err=%d\r\n",
                      i,
                      results[i].err);
            CM_ALWAYS("[CM] CRC_STATE_CHECK_BEGIN i=%d enabled=%d\r\n",
                      i,
                      ((results[i].execs & ID_STATE) != 0));
            if ((results[i].execs & ID_STATE)
                && (results[i].crcstate != state_known_crc[known_id]))
            {
                ee_printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n",
                          i,
                          results[i].crcstate,
                          state_known_crc[known_id]);
                results[i].err++;
            }
            CM_ALWAYS("[CM] CRC_STATE_CHECK_DONE i=%d err=%d\r\n",
                      i,
                      results[i].err);
            total_errors += results[i].err;
            CM_ALWAYS("[CM] CRC_CTX_DONE i=%d ctx_err=%d total_errors=%d\r\n",
                      i,
                      results[i].err,
                      total_errors);
        }
        CM_ALWAYS("[CM] CRC_VALIDATE_DONE total_errors=%d\r\n", total_errors);
        CM_LOG("[CM] CRC_VALIDATE_DONE total_errors=%d\r\n", total_errors);
    }
    else
    {
        CM_ALWAYS("[CM] CRC_VALIDATE_SKIP known_id=%d total_errors=%d\r\n",
                  known_id,
                  total_errors);
    }
    CM_ALWAYS("[CM] CHECK_TYPES_BEGIN\r\n");
    CM_LOG("[CM] CHECK_TYPES_BEGIN\r\n");
    total_errors += check_data_types();
    CM_ALWAYS("[CM] CHECK_TYPES_DONE total_errors=%d\r\n", total_errors);
    CM_LOG("[CM] CHECK_TYPES_DONE total_errors=%d\r\n", total_errors);
    /* and report results */
    CM_ALWAYS("[CM] REPORT_BEGIN total_errors=%d known_id=%d\r\n", total_errors, known_id);
    CM_LOG("[CM] REPORT_BEGIN total_errors=%d known_id=%d\r\n", total_errors, known_id);
    ee_printf("CoreMark Size    : %lu\n", (long unsigned)results[0].size);
    ee_printf("Total ticks      : %lu\n", (long unsigned)total_time);
#if HAS_FLOAT
    ee_printf("Total time (secs): %f\n", time_in_secs(total_time));
    if (time_in_secs(total_time) > 0)
        ee_printf("Iterations/Sec   : %f\n",
                  default_num_contexts * results[0].iterations
                      / time_in_secs(total_time));
#else
    ee_printf("Total time (secs): %d\n", time_in_secs(total_time));
    if (time_in_secs(total_time) > 0)
        ee_printf("Iterations/Sec   : %d\n",
                  default_num_contexts * results[0].iterations
                      / time_in_secs(total_time));
#endif
    {
        ee_u32 score_x1000 = cm_score_x1000((ee_u32)default_num_contexts,
                                            results[0].iterations,
                                            total_time);
        ee_u32 score_mhz_x1000 = cm_score_per_mhz_x1000(score_x1000);
        cm_print_fixed3("CoreMark/s       ", score_x1000);
        cm_print_fixed3("CoreMark/MHz     ", score_mhz_x1000);
    }
    if (time_in_secs(total_time) < 10)
    {
        ee_printf(
            "ERROR! Must execute for at least 10 secs for a valid result!\n");
        total_errors++;
    }

    ee_printf("Iterations       : %lu\n",
              (long unsigned)default_num_contexts * results[0].iterations);
    ee_printf("Compiler version : %s\n", COMPILER_VERSION);
    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
#if (MULTITHREAD > 1)
    ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts);
#endif
    ee_printf("Memory location  : %s\n", MEM_LOCATION);
    /* output for verification */
    ee_printf("seedcrc          : 0x%04x\n", seedcrc);
    if (results[0].execs & ID_LIST)
        for (i = 0; i < default_num_contexts; i++)
            ee_printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);
    if (results[0].execs & ID_MATRIX)
        for (i = 0; i < default_num_contexts; i++)
            ee_printf("[%d]crcmatrix     : 0x%04x\n", i, results[i].crcmatrix);
    if (results[0].execs & ID_STATE)
        for (i = 0; i < default_num_contexts; i++)
            ee_printf("[%d]crcstate      : 0x%04x\n", i, results[i].crcstate);
    for (i = 0; i < default_num_contexts; i++)
        ee_printf("[%d]crcfinal      : 0x%04x\n", i, results[i].crc);
    if (total_errors == 0)
    {
        ee_printf(
            "Correct operation validated. See README.md for run and reporting "
            "rules.\n");
#if HAS_FLOAT
        if (known_id == 3)
        {
            ee_printf("CoreMark 1.0 : %f / %s %s",
                      default_num_contexts * results[0].iterations
                          / time_in_secs(total_time),
                      COMPILER_VERSION,
                      COMPILER_FLAGS);
#if defined(MEM_LOCATION) && !defined(MEM_LOCATION_UNSPEC)
            ee_printf(" / %s", MEM_LOCATION);
#else
            ee_printf(" / %s", mem_name[MEM_METHOD]);
#endif

#if (MULTITHREAD > 1)
            ee_printf(" / %d:%s", default_num_contexts, PARALLEL_METHOD);
#endif
            ee_printf("\n");
        }
#else
        if (known_id == 3)
        {
            ee_u32 score_x1000 = cm_score_x1000((ee_u32)default_num_contexts,
                                                results[0].iterations,
                                                total_time);
            ee_printf("CoreMark 1.0 : %lu.%03lu / %s %s",
                      (long unsigned)(score_x1000 / 1000u),
                      (long unsigned)(score_x1000 % 1000u),
                      COMPILER_VERSION,
                      COMPILER_FLAGS);
#if defined(MEM_LOCATION) && !defined(MEM_LOCATION_UNSPEC)
            ee_printf(" / %s", MEM_LOCATION);
#else
            ee_printf(" / %s", mem_name[MEM_METHOD]);
#endif
            ee_printf("\n");
        }
#endif
    }
    if (total_errors > 0)
        ee_printf("Errors detected\n");
    if (total_errors < 0)
        ee_printf(
            "Cannot validate operation for these seed values, please compare "
            "with results on a known platform.\n");

#if (MEM_METHOD == MEM_MALLOC)
    for (i = 0; i < MULTITHREAD; i++)
        portable_free(results[i].memblock[0]);
#endif
    /* And last call any target specific code for finalizing */
    portable_fini(&(results[0].port));

    return MAIN_RETURN_VAL;
}
