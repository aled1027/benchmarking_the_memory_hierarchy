# Benchmarking the Memory Heirarchy

## My experiment. 
My experiment had the following steps:

1. Take as input `num_objects`. `iters` is fixed in the .c file to 10,000,000.
2. Initialize a `uint64_t` array with `num_objects` elements.
3. Time how long the following loop takes. Call the time `t`.
    ``` 
    for i = 0 to iters:
        r = rand(0, num_objects - 1)
        fetch arr[r]
    ```
4. Normalize `t`. (See below for discussions of the constants)
    ```
        t = t - (iters * time_gen_random_element(iters, num_objects))`
    ```
where `time_genrandom_element` computes how long it takes the generate a random element via `rand() % num_objects`.
5. Report `t`
6. Repeat steps 1 through 5 10 times. 

I ran my experiment by executing `c_code/run.sh`, and all of the code is in `c_code/main.c`.

## Justification of decisions
### Iters
I ran all of my experiments with `iters = 10,000,000`. 
10,000,000 is large enough that initializing code can take effect, compulsory cache misses are ignored, and if possible, all values of the array are cached.
Moreover, 10,000,000 is large enough that the time spent on taking the current time, which isn't a trivial amount of time this scale is essentially amortized out.
10,000,000 is small enough that I could run my tests in around 30 seconds. 

### Number of Objects
I ran experiments with `num_objects = 2**i` where `i = 3, 4, ..., 24`.
Having `i` in this range ensured that array is sufficiently large, and the range from `2**10` to `2**24` ensured that I am testing a very different sized arrays. 

## Graphs
First, let's look at the overall results. 
In the plot below I show the boxplot for each `num_objects` on the x-axis and time (in nanoseconds) to fetch a random element is on the y-axis.
Each boxplot has 10 data points, and each datapoint is the average of 10,000,000 fetches (see experimental design above).
This plot is strange, because it shows that approximatley the same amount of time is spent fetching a random element regardless of the size of the array. 
We would expect that larger arrays would not fit into L1 cache, such that there would be a higher latency to grab a random element. 

![Boxplot zoomed in](https://raw.githubusercontent.com/aled1027/benchmarking_the_memory_hierarchy/master/images/boxplot.png)

## Analysis

### My guess on cache size
If I had to guess the size of my cache based on my data, I would have to guess that my L1 cache can hold at least 134217kb (`2^24 * 8 / 1000`), and takes around 0.76ns to access.

### CPUID
I used inline assembly and CPUID to find infomration abouy my machine's cache system, giving the following information:
```
Cache ID: 0
Level: 1
Sets: 64
System Coherency Line Size: 64 bytes
Physical Line partitions: 1
Ways of associativity: 8
Total Size: 32768 bytes (32 kb)

Cache ID: 1
Level: 1
Sets: 64
System Coherency Line Size: 64 bytes
Physical Line partitions: 1
Ways of associativity: 8
Total Size: 32768 bytes (32 kb)

Cache ID: 2
Level: 2
Sets: 512
System Coherency Line Size: 64 bytes
Physical Line partitions: 1
Ways of associativity: 8
Total Size: 262144 bytes (256 kb)

Cache ID: 3
Level: 3
Sets: 4096
System Coherency Line Size: 64 bytes
Physical Line partitions: 1
Ways of associativity: 12
Total Size: 3145728 bytes (3072 kb)
```
So the L1 cache is of size 32kb. 
If the entire L1 cache were devoted to holding an array, then it would only be able to hold an array of size `2^11`. 
So we should see that arrays of size `2^15` and greater having much larger latency, but for some reason we don't. 
My hypothesis is that my procedure for measuring latency is somehow amortizing/dividing out the effect accessing a lower cache. 

### Comparing my numbers to actual numbers
I did get pretty close numbers for the L1 cache.
The actual latency for the L1 cache according to the link provided is 0.5ns, and I got approximatley 0.75ns. 
However, my data supports a preposterously wrong size of the L1 cache.
My guess, as I mentioned above, as to why I did not get these numbers is that I somehow amortized out the time required to access L2 cache; however, after spending many hours experimenting with small changes to my code and analysis, I was unable to uncover the source of the discrepancy.



