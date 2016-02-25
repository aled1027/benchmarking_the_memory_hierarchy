#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <time.h>
#include <inttypes.h>
#include "utils.h"
#define BILLION  1E9 
uint64_t const time_to_get_current_time_ns = 126;

void measure_cache()
{
    // modified from http://stackoverflow.com/questions/21369381/measuring-cache-latencies
    for (uint32_t i = 0; i < 4; i++) {

        uint32_t eax, ebx, ecx, edx; 
        eax = 4; // get cache info
        ecx = i; // cache id

        asm (
            "cpuid" // call i386 cpuid instruction
            : "+a" (eax) // contains the cpuid command code, 4 for cache query
            , "=b" (ebx)
            , "+c" (ecx) // contains the cache id
            , "=d" (edx)
        );
int32_t cache_type = eax & 0x1F; 
        int32_t cache_level = (eax >>= 5) & 0x7;
        uint32_t cache_sets = ecx + 1;
        uint32_t cache_coherency_line_size = (ebx & 0xFFF) + 1;
        uint32_t cache_physical_line_partitions = ((ebx >>= 12) & 0x3FF) + 1;
        uint32_t cache_ways_of_associativity = ((ebx >>= 10) & 0x3FF) + 1;

        size_t cache_total_size = cache_ways_of_associativity * cache_physical_line_partitions * 
            cache_coherency_line_size * cache_sets;

        printf("Cache ID: %u\n", i);
        printf("Level: %d\n", cache_level);
        printf("Sets: %d\n", cache_sets);
        printf("System Coherency Line Size: %u bytes\n", cache_coherency_line_size);
        printf("Physical Line partitions: %u\n", cache_physical_line_partitions);
        printf("Ways of associativity: %u\n", cache_ways_of_associativity);
        printf("Total Size: %zu bytes (%zu kb)\n", cache_total_size, cache_total_size >> 10);
        printf("\n");
    }
}

uint64_t time_read_random_element(uint64_t iters, uint32_t mod)
{
    uint64_t start = current_time_ns();
    for (uint32_t i = 0; i < iters; i++) {
        uint32_t a = rand() % mod;
    }
    uint64_t end = current_time_ns();
    return (end - start) / iters;
}

void go(uint64_t iters, uint64_t N) 
{
    uint64_t *arr = generate_random_array(N);

    uint32_t i = 0;
    uint64_t start = current_time_ns();
    for (; i < iters; ++i) {
        uint32_t idx = rand() % N;
        uint64_t element = arr[idx];
    }
    uint64_t end = current_time_ns();
    uint64_t elapsed_time = end - start;
    elapsed_time -= (iters * time_read_random_element(iters, N));

    printf("%" PRIu64 ", %" PRIu64 ", %lf\n",
            N, iters, (double) elapsed_time / (double) iters);

    free(arr);
}

int main(int argc, char *argv[]) 
{
    assert(argc == 2);
    uint64_t arr_size_lg2 = strtol(argv[1], NULL, 0);
    uint64_t arr_size = pow(2, arr_size_lg2);
    uint64_t iters = 10000000;

    srand(0);
    go(iters, arr_size);

    //time_current_time_ns();
    //time_read_random_element(iters, pow(2,22));
    //go_cpuid();

    return 0;
}
