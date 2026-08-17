#include <stdint.h>

#define UART_TX_ADDR     0xFFFFF080u
#define UART_STATUS_ADDR 0xFFFFF084u
#define TIMER_ADDR       0xFFFFF090u
#ifndef CPU_HZ
#define CPU_HZ           75000000u
#endif
#define SORT_N           128

static volatile uint32_t *const UART_TX     = (volatile uint32_t *)UART_TX_ADDR;
static volatile uint32_t *const UART_STATUS = (volatile uint32_t *)UART_STATUS_ADDR;
static volatile uint32_t *const TIMER       = (volatile uint32_t *)TIMER_ADDR;

static void uart_putc(char c)
{
    while ((*UART_STATUS & 1u) != 0u) {
    }
    *UART_TX = (uint32_t)(uint8_t)c;
}

static void uart_puts(const char *s)
{
    while (*s) {
        if (*s == '\n') uart_putc('\r');
        uart_putc(*s++);
    }
}

static void uart_put_u32(uint32_t v)
{
    char buf[11];
    int i = 0;
    if (v == 0) {
        uart_putc('0');
        return;
    }
    while (v != 0) {
        buf[i++] = (char)('0' + (v % 10u));
        v /= 10u;
    }
    while (i > 0) uart_putc(buf[--i]);
}

static void uart_put_s32(int32_t v)
{
    if (v < 0) {
        uart_putc('-');
        uart_put_u32((uint32_t)(-v));
    } else {
        uart_put_u32((uint32_t)v);
    }
}

static void uart_put_hex32(uint32_t v)
{
    static const char hex[] = "0123456789ABCDEF";
    int i;
    uart_puts("0x");
    for (i = 7; i >= 0; --i) {
        uart_putc(hex[(v >> (i * 4)) & 0xFu]);
    }
}

static uint32_t next_lcg(uint32_t x)
{
    return x * 1664525u + 1013904223u;
}

static void quick_sort(int32_t *a, int left, int right)
{
    int i = left;
    int j = right;
    int32_t pivot = a[(left + right) >> 1];

    while (i <= j) {
        while (a[i] < pivot) ++i;
        while (a[j] > pivot) --j;
        if (i <= j) {
            int32_t tmp = a[i];
            a[i] = a[j];
            a[j] = tmp;
            ++i;
            --j;
        }
    }

    if (left < j) quick_sort(a, left, j);
    if (i < right) quick_sort(a, i, right);
}

static uint32_t checksum_array(const int32_t *a)
{
    uint32_t sum = 0x89abcdefu;
    int i;
    for (i = 0; i < SORT_N; ++i) {
        sum ^= (uint32_t)a[i] + 0x9e3779b9u + (sum << 6) + (sum >> 2);
    }
    return sum;
}

static int is_sorted(const int32_t *a)
{
    int i;
    for (i = 1; i < SORT_N; ++i) {
        if (a[i - 1] > a[i]) return 0;
    }
    return 1;
}

int main(void)
{
    static int32_t data[SORT_N];
    uint32_t seed = 0x31415926u;
    uint32_t start, end, cycles, checksum;
    int i;

    uart_puts("\nQSORT DEMO START\n");
    uart_puts("N=");
    uart_put_u32(SORT_N);
    uart_puts(", CPU_HZ=");
    uart_put_u32(CPU_HZ);
    uart_puts("\n");

    for (i = 0; i < SORT_N; ++i) {
        seed = next_lcg(seed);
        data[i] = (int32_t)(seed & 0x7fffu) - 0x4000;
    }

    start = *TIMER;
    quick_sort(data, 0, SORT_N - 1);
    end = *TIMER;

    cycles = end - start;
    checksum = checksum_array(data);

    uart_puts("cycles=");
    uart_put_u32(cycles);
    uart_puts("\nchecksum=");
    uart_put_hex32(checksum);
    uart_puts("\nmin=");
    uart_put_s32(data[0]);
    uart_puts(", max=");
    uart_put_s32(data[SORT_N - 1]);
    uart_puts("\n");

    if (is_sorted(data)) {
        uart_puts("QSORT PASS\n");
    } else {
        uart_puts("QSORT FAIL\n");
    }

    while (1) {
    }
}
