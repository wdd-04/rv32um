OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY {
    /* 
     * 你的 BRAM: 起始地址 0x00000000，长度 64KB (0x10000)
     */
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 0x10000
}

PROVIDE(__stack_top = ORIGIN(RAM) + LENGTH(RAM));

SECTIONS {
    .text : {
        /* 强行把 start.S 中的 .init 段放在最开头 (地址 0x00000000) */
        *(.init)    
        
        /* 剩下的所有 C 语言程序指令 */
        *(.text*)   
        
        /* 只读数据，比如 printf 里的那些字符串常量 */
        *(.rodata*) 
        *(.srodata*)
        . = ALIGN(4);
    } > RAM

    .data : {
        /* 已初始化的全局变量 */
        *(.data*)
        *(.sdata*)
        
        /* 提供给 gp 寄存器使用的全局指针锚点 */
        PROVIDE( __global_pointer$ = . + 0x800 );
        . = ALIGN(4);
    } > RAM

    .bss : {
        /* 未初始化的全局变量，通常启动代码会把这里清零(目前我们省去了清零步骤) */
        __bss_start = .;
        *(.bss*)
        *(.sbss*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end = .;
    } > RAM
}
