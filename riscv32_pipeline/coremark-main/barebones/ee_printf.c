#include <coremark.h>
#include <stdarg.h>

#define ZEROPAD   (1 << 0) 
#define SIGN      (1 << 1) 
#define PLUS      (1 << 2) 
#define SPACE     (1 << 3) 
#define LEFT      (1 << 4) 
#define HEX_PREP  (1 << 5) 
#define UPPERCASE (1 << 6) 

#define is_digit(c) ((c) >= '0' && (c) <= '9')

static char *    digits       = "0123456789abcdefghijklmnopqrstuvwxyz";
static char *    upper_digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

static ee_size_t strnlen(const char *s, ee_size_t count)
{
    const char *sc;
    for (sc = s; *sc != '\0' && count--; ++sc);
    return sc - s;
}

static int skip_atoi(const char **s)
{
    int i = 0;
    while (is_digit(**s))
        i = i * 10 + *((*s)++) - '0';
    return i;
}

static char * number(char *str, long num, int base, int size, int precision, int type)
{
    char  c, sign, tmp[66];
    char *dig = digits;
    int   i;

    if (type & UPPERCASE) dig = upper_digits;
    if (type & LEFT) type &= ~ZEROPAD;
    if (base < 2 || base > 36) return 0;

    c    = (type & ZEROPAD) ? '0' : ' ';
    sign = 0;
    if (type & SIGN) {
        if (num < 0) {
            sign = '-'; num  = -num; size--;
        } else if (type & PLUS) {
            sign = '+'; size--;
        } else if (type & SPACE) {
            sign = ' '; size--;
        }
    }

    if (type & HEX_PREP) {
        if (base == 16) size -= 2;
        else if (base == 8) size--;
    }

    i = 0;
    if (num == 0) tmp[i++] = '0';
    else {
        while (num != 0) {
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
            num      = ((unsigned long)num) / (unsigned)base;
        }
    }

    if (i > precision) precision = i;
    size -= precision;
    if (!(type & (ZEROPAD | LEFT))) while (size-- > 0) *str++ = ' ';
    if (sign) *str++ = sign;

    if (type & HEX_PREP) {
        if (base == 8) *str++ = '0';
        else if (base == 16) {
            *str++ = '0'; *str++ = digits[33];
        }
    }

    if (!(type & LEFT)) while (size-- > 0) *str++ = c;
    while (i < precision--) *str++ = '0';
    while (i-- > 0) *str++ = tmp[i];
    while (size-- > 0) *str++ = ' ';

    return str;
}

static char * eaddr(char *str, unsigned char *addr, int size, int precision, int type)
{
    char  tmp[24];
    char *dig = digits;
    int   i, len;

    if (type & UPPERCASE) dig = upper_digits;
    len = 0;
    for (i = 0; i < 6; i++) {
        if (i != 0) tmp[len++] = ':';
        tmp[len++] = dig[addr[i] >> 4];
        tmp[len++] = dig[addr[i] & 0x0F];
    }
    if (!(type & LEFT)) while (len < size--) *str++ = ' ';
    for (i = 0; i < len; ++i) *str++ = tmp[i];
    while (len < size--) *str++ = ' ';
    return str;
}

static char * iaddr(char *str, unsigned char *addr, int size, int precision, int type)
{
    char tmp[24];
    int  i, n, len;

    len = 0;
    for (i = 0; i < 4; i++) {
        if (i != 0) tmp[len++] = '.';
        n = addr[i];
        if (n == 0) tmp[len++] = digits[0];
        else {
            if (n >= 100) {
                tmp[len++] = digits[n / 100]; n = n % 100;
                tmp[len++] = digits[n / 10]; n = n % 10;
            } else if (n >= 10) {
                tmp[len++] = digits[n / 10]; n = n % 10;
            }
            tmp[len++] = digits[n];
        }
    }
    if (!(type & LEFT)) while (len < size--) *str++ = ' ';
    for (i = 0; i < len; ++i) *str++ = tmp[i];
    while (len < size--) *str++ = ' ';
    return str;
}

static int ee_vsprintf(char *buf, const char *fmt, va_list args)
{
    int len; unsigned long num; int i, base; char *str; char *s;
    int flags, field_width, precision, qualifier;

    for (str = buf; *fmt; fmt++) {
        if (*fmt != '%') { *str++ = *fmt; continue; }
        flags = 0;
    repeat:
        fmt++;
        switch (*fmt) {
            case '-': flags |= LEFT; goto repeat;
            case '+': flags |= PLUS; goto repeat;
            case ' ': flags |= SPACE; goto repeat;
            case '#': flags |= HEX_PREP; goto repeat;
            case '0': flags |= ZEROPAD; goto repeat;
        }

        field_width = -1;
        if (is_digit(*fmt)) field_width = skip_atoi(&fmt);
        else if (*fmt == '*') {
            fmt++; field_width = va_arg(args, int);
            if (field_width < 0) { field_width = -field_width; flags |= LEFT; }
        }

        precision = -1;
        if (*fmt == '.') {
            ++fmt;
            if (is_digit(*fmt)) precision = skip_atoi(&fmt);
            else if (*fmt == '*') { ++fmt; precision = va_arg(args, int); }
            if (precision < 0) precision = 0;
        }

        qualifier = -1;
        if (*fmt == 'l' || *fmt == 'L') { qualifier = *fmt; fmt++; }

        base = 10;
        switch (*fmt) {
            case 'c':
                if (!(flags & LEFT)) while (--field_width > 0) *str++ = ' ';
                *str++ = (unsigned char)va_arg(args, int);
                while (--field_width > 0) *str++ = ' ';
                continue;
            case 's':
                s = va_arg(args, char *);
                if (!s) s = "<NULL>";
                len = strnlen(s, precision);
                if (!(flags & LEFT)) while (len < field_width--) *str++ = ' ';
                for (i = 0; i < len; ++i) *str++ = *s++;
                while (len < field_width--) *str++ = ' ';
                continue;
            case 'p':
                if (field_width == -1) { field_width = 2 * sizeof(void *); flags |= ZEROPAD; }
                str = number(str, (unsigned long)va_arg(args, void *), 16, field_width, precision, flags);
                continue;
            case 'A': flags |= UPPERCASE;
            case 'a':
                if (qualifier == 'l') str = eaddr(str, va_arg(args, unsigned char *), field_width, precision, flags);
                else str = iaddr(str, va_arg(args, unsigned char *), field_width, precision, flags);
                continue;
            case 'o': base = 8; break;
            case 'X': flags |= UPPERCASE;
            case 'x': base = 16; break;
            case 'd': case 'i': flags |= SIGN;
            case 'u': break;
            default:
                if (*fmt != '%') *str++ = '%';
                if (*fmt) *str++ = *fmt; else --fmt;
                continue;
        }
        if (qualifier == 'l') num = va_arg(args, unsigned long);
        else if (flags & SIGN) num = va_arg(args, int);
        else num = va_arg(args, unsigned int);
        str = number(str, num, base, field_width, precision, flags);
    }
    *str = '\0';
    return str - buf;
}

/* UART output registers used by the soft CPU platform. */
#define UART_TX_DATA_REG   (*(volatile unsigned int *)0xFFFFF080)
#define UART_TX_STATUS_REG (*(volatile unsigned int *)0xFFFFF084)

static void uart_wait_tx_ready(void)
{
    while ((UART_TX_STATUS_REG & 1u) != 0u) {
    }
}

void uart_send_char(char c)
{
    if (c == '\n') {
        uart_send_char('\r');
    }

    uart_wait_tx_ready();
    UART_TX_DATA_REG = (unsigned int)((unsigned char)c);
}

int ee_printf(const char *fmt, ...)
{
    char printbuffer[1024];
    va_list args;
    int len;
    int i;

    va_start(args, fmt);
    len = ee_vsprintf(printbuffer, fmt, args);
    va_end(args);

    for (i = 0; i < len; i++) {
        uart_send_char(printbuffer[i]);
    }

    return len;
}
