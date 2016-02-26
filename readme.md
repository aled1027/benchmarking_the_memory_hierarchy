# Benchmarking the Memory Hierarchy

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
I analyze the plot in the analysis section.

![Boxplot zoomed in](https://raw.githubusercontent.com/aled1027/benchmarking_the_memory_hierarchy/master/images/boxplot.png)

## Analysis
### My plot analysis
This plot is strange, because it shows that approximately the same amount of time is spent fetching a random element regardless of the size of the array. 
We would expect that larger arrays would not fit into L1 cache, such that there would be a higher latency to grab a random element. 
My hypothesis was that the way I was normalizing, averaging or amortizing my timings was distorting the timings of large object arrays.
This hypothesis is backed by a number of observations. 
Two include: (1) the miniumums of the large-array timings are unrealistically low, suggesting that math is making them artificially lower, and (2) the code appears to be correct - as far as I can tell.
To test this hypothesis, I plotted unnormalized, raw timings for each object size: I simply plot the time elapsed: `end - start` (plot below).
You'll notice that all of the timings are pretty close for all array sizes (note the magnitude of the y-axis). 
This suggests that it's not my normalization procedure that is causing the strange timings, but something else. 
At this point, I have been able to formulate a good hypothesis as to why, but my guess is that it has something to do with the code. 
Some ideas are: (1) the hardware is prefetching really well, or (2) the compiler is optimizing some important part of the operation out.

![Boxplot zoomed in](https://raw.githubusercontent.com/aled1027/benchmarking_the_memory_hierarchy/master/images/raw_boxplot.png)

(Caveat: the graphs for each of my plots is based on different data samples, so the numbers between the two plots do not match up perfectly. However, they show the same trends, which appear to be robust based on my visuatlizations.)

### My guess on cache size (based on my data)
If I had to guess the size of my cache based on my data, I would have to guess that my L1 cache can hold at least 134217kb (`2^24 * 8 / 1000`), and takes around 0.76ns to access.
I estimate that size for the cache size because of the speed of accessing a random element in the a 2^24 array as fast as accessing a random element in any other sized array, suggesting that random elements being accessed are in the same cache: the L1 cache. 

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

### Comparing my numbers to actual numbers
I did get pretty close numbers for the L1 cache.
The actual latency for the L1 cache according to the link provided is 0.5ns, and I got approximatley 0.75ns. 
However, my data supports a preposterously wrong size of the L1 cache.
If the entire L1 cache (with size indicated by CPUID) were devoted to holding an array, then it would only be able to hold an array of size `2^11`. 
So we should see that arrays of size at least `2^15` and greater having much greater latency, but for some reason we don't. 
See my discussion above analyzing my plot for my analysis on this problem.
