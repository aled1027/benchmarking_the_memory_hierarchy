# TODO
- generate random element: 12
- time current time quantiles: 127 127 129 for 25%, 50%, 75% respectively
- http://stackoverflow.com/questions/21369381/measuring-cache-latencies
- I googled "measuring l1 cache time"

# Benchmarking the Memory Heirarchy

## My experiment. 
My experiment had the following steps:

1. Take as input `num_objects` and `iters`.
2. Initialize a `uint64_t` array with `num_objects` elements.
3. Time how long the following loop takes. Call the time `t`.
```
for i = 0 to iters:
    r = rand(0, num_objects - 1)
    fetch arr[r]
```
4. Normalize `t`. (See below for discussions of the constants)
```
t = t - time_to_get_current_time_ns - (iters * time_to_gen_random_element)
```
5. Report `t`
6. Repeat steps 1 through 5 `num_trials` times. 

## Justification of decisions
### Iters
I ran all of my experiments with `iters = 1,000,000`. 
1,000,000 is large enough that initializing code can take effect, and if possible, values of the array are cached. 
1,000,000 was small enough that I could run all of the experiments in less than a minute. 

### Number of Objects
I ran experiments with `num_objects = 2**i` where `i = 10, 11, ..., 24`.
Having `i` in this range ensured that array was sufficiently large, and the range from `2**10` to `2**24` ensured that I was testing a very different sized arrays. 

### Timing Constants 
In order to find the amount of time it takes to access the cache, I wanted to remove the amount of time it takes to perform extraneous steps. 
In my experiment these steps were generating a random value, and finding the current time. 
I setup two experiments to determine these values. 
The generate-random experiment found the average amount of time to generate a random value. 
The current-time experiment found the average amount of time to do the following: 
```
uint64_t start = current_time_ns();
uint64_t end = current_time_ns();
```

The output of these experiments is plotted below. 
I ran each experiment 10,000 times, so the boxplots you are looking have 10,000 data points, where each point is the average of 100,000 operations. 
As you can see, the interquartile ranges are quite small, so we there is little variance in the performance of these operations (althought there are some outliers). 
I elected to use 12ns as the time to generate a random value and to use 126ns as the time to time something. 
![Full boxplot](https://raw.githubusercontent.com/aled1027/benchmarking_the_memory_hierarchy/master/images/generate_random_boxplot.png)
![Full boxplot](https://raw.githubusercontent.com/aled1027/benchmarking_the_memory_hierarchy/master/images/current_time_boxplot.png)
(p.s. do you know how to make these images smaller on github?)

## Graphs
First, let's look at the overall results. 
In the plot below I show the boxplot for each `num_objects` where y-axis the amount of time in nanoseconds required to fetch a single random element. 
Most of the medians are approximately 1.75ns, with `22` and `24` a little higher. 
From this, I hypothesisze that it takes about 1.75ns to access the L1 cache.

![Boxplot zoomed in](https://raw.githubusercontent.com/aled1027/benchmarking_the_memory_hierarchy/master/images/boxplot.png)
