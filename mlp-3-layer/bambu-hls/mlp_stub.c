#include <stdint.h>

/*
 * mlp_stub.c — Behavioral C model of mlp_wrapper_lo and mlp_wrapper_hi
 * for Bambu co-simulation. Logic is identical to the original stub,
 * split into two scalar-returning functions.
 */

static uint64_t mlp_compute_lo(uint64_t in_data);
static uint64_t mlp_compute_hi(uint64_t in_data);

/* Shared compute helper - returns full 128-bit result as two uint64_t via pointers */
static void mlp_compute(uint64_t in_data, uint64_t *lo, uint64_t *hi)
{
    int i;

    /* Unpack input: 8 x INT8 */
    int8_t x[8];
    for (i = 0; i < 8; i++)
        x[i] = (int8_t)((in_data >> (i * 8)) & 0xFF);

    /* Layer 1: W1 = identity -> a1[i] = x[i], ReLU + requant */
    int8_t a1[8];
    for (i = 0; i < 8; i++) {
        int16_t v = x[i] > 0 ? x[i] : 0;
        a1[i] = (int8_t)(v > 127 ? 127 : v);
    }

    /* Layer 2: W2 = identity -> a2[i] = a1[i], ReLU + requant */
    int8_t a2[8];
    for (i = 0; i < 8; i++) {
        int16_t v = a1[i] > 0 ? a1[i] : 0;
        a2[i] = (int8_t)(v > 127 ? 127 : v);
    }

    /* Layer 3: W3 = all-ones -> z3[i] = sum of all a2[j] */
    int16_t sum = 0;
    for (i = 0; i < 8; i++)
        sum += (int16_t)a2[i];

    /* Pack output: lower 4 x INT16 into lo, upper 4 x INT16 into hi */
    *lo = 0;
    *hi = 0;
    for (i = 0; i < 4; i++)
        *lo |= ((uint64_t)(uint16_t)sum) << (i * 16);
    for (i = 0; i < 4; i++)
        *hi |= ((uint64_t)(uint16_t)sum) << (i * 16);
}

uint64_t mlp_wrapper_lo(uint64_t in_data)
{
    uint64_t lo, hi;
    mlp_compute(in_data, &lo, &hi);
    return lo;
}

uint64_t mlp_wrapper_hi(uint64_t in_data)
{
    uint64_t lo, hi;
    mlp_compute(in_data, &lo, &hi);
    return hi;
}
