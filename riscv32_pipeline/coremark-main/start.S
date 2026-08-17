.section .init
.global _start

_start:
    # 1. 初始化堆栈指针 (Stack Pointer)
    # 根据你的 BRAM 配置：16384深度 * 4字节 = 64KB (0x10000)
    # 将栈顶设置在内存的最高地址，向下生长
    la sp, __stack_top
    
    # (可选) 初始化 gp (Global Pointer) 以支持 small data 优化
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # Clear .bss so uninitialized globals start from zero on bare metal.
    la t0, __bss_start
    la t1, __bss_end
clear_bss_loop:
    bgeu t0, t1, clear_bss_done
    sw zero, 0(t0)
    addi t0, t0, 4
    j clear_bss_loop
clear_bss_done:

    # 2. 跳转到 CoreMark 的 main 函数
    call main

    # 3. 正常情况下 main 不会返回，如果返回了就进入死循环
end_loop:
    j end_loop
