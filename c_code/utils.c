
#include <time.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <assert.h>

#define BILLION  1E9

#include "utils.h"

uint64_t current_time_ns()
{
    /* returns time in nanoseconds */
    struct timespec tp;
    clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
    //assert (res != -1 && "failure with clock_gettime");
    return BILLION * tp.tv_sec + tp.tv_nsec;
}

uint64_t* make_buffer(size_t size)
{
    uint64_t *arr = malloc(size * sizeof(uint64_t));
    //assert(arr && "memory failure");
    return arr;
}

void print_arr64(uint64_t *arr, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        printf("%lu\n", arr[i]);
    }
}

uint32_t random_uint32_t(uint32_t lower_bound, uint32_t upper_bound) 
{
    return (uint32_t) rand() % (upper_bound - lower_bound) + lower_bound;
}

void count_m_to_n(uint64_t *arr, uint64_t m, uint64_t n)
{
    uint64_t size = n - m;
    for (uint64_t i = 0; i < size; ++i, ++m) {
        arr[i] = m;
    }
}

uint64_t *generate_random_array(size_t size)
{
    uint64_t *arr = calloc(size, sizeof(uint64_t));
    assert(arr && "memory allocated?");
    for (uint32_t i = 0; i < size; i++) {
        arr[i] = rand() % size;
    }
    return arr;
}

