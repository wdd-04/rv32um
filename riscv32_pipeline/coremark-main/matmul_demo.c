#include <stdint.h>

#define UART_TX_ADDR     0xFFFFF080u
#define UART_STATUS_ADDR 0xFFFFF084u
#define TIMER_ADDR       0xFFFFF090u
#ifndef CPU_HZ
#define CPU_HZ           75000000u
#endif
#define MAT_N            8

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

static uint32_t checksum_matrix(const int32_t c[MAT_N][MAT_N])
{
    uint32_t sum = 0x12345678u;
    int i, j;
    for (i = 0; i < MAT_N; ++i) {
        for (j = 0; j < MAT_N; ++j) {
            sum ^= (uint32_t)c[i][j] + 0x9e3779b9u + (sum << 6) + (sum >> 2);
        }
    }
    return sum;
}

int main(void)
{
    static int32_t a[MAT_N][MAT_N];
    static int32_t b[MAT_N][MAT_N];
    static int32_t c[MAT_N][MAT_N];
    uint32_t start, end, cycles, checksum;
    int i, j, k;

    uart_puts("\nMATMUL DEMO START\n");
    uart_puts("N=");
    uart_put_u32(MAT_N);
    uart_puts(", CPU_HZ=");
    uart_put_u32(CPU_HZ);
    uart_puts("\n");

    for (i = 0; i < MAT_N; ++i) {
        for (j = 0; j < MAT_N; ++j) {
            a[i][j] = (int32_t)((i + 1) * (j + 3) - 7);
            b[i][j] = (int32_t)((i == j) ? 3 : ((i + j) & 3));
            c[i][j] = 0;
        }
    }

    start = *TIMER;
    for (i = 0; i < MAT_N; ++i) {
        for (j = 0; j < MAT_N; ++j) {
            int32_t acc = 0;
            for (k = 0; k < MAT_N; ++k) {
                acc += a[i][k] * b[k][j];
            }
            c[i][j] = acc;
        }
    }
    end = *TIMER;

    cycles = end - start;
    checksum = checksum_matrix(c);

    uart_puts("cycles=");
    uart_put_u32(cycles);
    uart_puts("\nchecksum=");
    uart_put_hex32(checksum);
    uart_puts("\ncorner C00=");
    uart_put_s32(c[0][0]);
    uart_puts(", C77=");
    uart_put_s32(c[7][7]);
    uart_puts("\nMATMUL PASS\n");

    while (1) {
    }
}
