#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>

#include "utils.h"

uint64_t time_read_random_element(uint8_t *arr, size_t n) 
{
    uint32_t idx = random_uint32_t(0, n);

    uint64_t start = current_time_ns();
    uint64_t element = arr[idx];
    uint64_t dist = current_time_ns() - start;

    assert(element + 1); // so that element is "used"
    return dist;
} 

void go(uint32_t iters, uint64_t N) 
{
    uint8_t *arr = malloc(N * sizeof(uint8_t));
    assert(arr && "memory allocated?");
    for (uint32_t j = 0; j < iters; ++j) {
        uint64_t t = time_read_random_element(arr, N);
        printf("%lu, %u, %lu\n", N, iters, t);
    }
    free(arr);
}

int main(int argc, char *argv[]) 
{
    assert(argc == 3);
    uint64_t arr_size = strtol(argv[1], NULL, 0);
    uint32_t iters = strtol(argv[2], NULL, 0);

    go(iters, arr_size);

    return 0;
}
