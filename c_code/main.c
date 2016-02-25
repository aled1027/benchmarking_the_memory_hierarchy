#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <time.h>
#include <inttypes.h>
#include "utils.h"

#define BILLION  1E9
#define DATA_TYPE uint64_t

uint64_t const time_to_get_current_time_ns = 126;
uint64_t const time_to_gen_random_element = 12;

void go(uint64_t iters, uint64_t N) 
{
    DATA_TYPE *arr = malloc(N * sizeof(DATA_TYPE));
    assert(arr && "memory allocated?");

    uint64_t start = current_time_ns();
    for (uint32_t j = 0; j < iters; ++j) {
        uint32_t idx = random_uint32_t(0, N);

        uint64_t element = arr[idx];
        //uint64_t element = arr[0];
    }

    uint64_t end = current_time_ns();
    uint64_t actual_time = end - start - time_to_get_current_time_ns - (iters * time_to_gen_random_element);

    printf("%lu, %lu, %lf\n", N, iters, (double) actual_time / (double) iters);
    free(arr);
}

void time_current_time_ns() 
{
    uint64_t len = 1000000;
    uint64_t start = current_time_ns();
    for (uint32_t i = 0; i < len; i++) {
        uint64_t _start = current_time_ns();
        uint64_t _end = current_time_ns();
    }
    uint64_t end = current_time_ns();
    printf("%lu\n", (end - start) / len);
}

void time_read_random_element()
{
    uint64_t len = 1000000;
    uint64_t start = current_time_ns();
    for (uint32_t i = 0; i < len; i++) {
        uint32_t idx = random_uint32_t(0, len);
        assert(idx + 1); // so that element is "used"
    }
    uint64_t end = current_time_ns();
    printf("%lu\n", (end - start) / len);

}

int main(int argc, char *argv[]) 
{
    assert(argc && argv);
    assert(argc == 3);
    uint64_t arr_size = strtol(argv[1], NULL, 0);
    uint64_t iters = strtol(argv[2], NULL, 0);

    go(iters, arr_size);
    //time_current_time_ns();
    //time_read_random_element();

    return 0;
}
