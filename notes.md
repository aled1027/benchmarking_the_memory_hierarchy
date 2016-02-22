# Benchmarking the Memory Heirarchy
# My experiment. 
For my experiment, I did the following:
1. Take as input `num_objects` and `iters`
2. Initialize an `uint8_t` array with `num_objects` elements
3. Query a random value `r` that is between `0` and `num_objects - 1`
4. Time how long it takes to fetch the rth value of the array
5. Repeat steps 4 and 5 `iters` times. 
6. 
I ran all of my experiments with `iters = 10,000`. 
10,000 is large enough that initializing code can take effect, and if possible, values of the array are cached. 
10,000 was small enough that I could run all of the experiments in less than a minute. 

I ran experiments with `num_objects = 2**i` where `i = 10, 11, ..., 24`.
Having `i` in this range ensured that array was sufficiently large, and the range from `2**10` to `2**24` ensured that I was testing a very different sized arrays. 

This experiment should test how large a particular cache area is. 
Since the experiment is selecting random elements, there is limited spatial and temporal locality. 
If an element is fetched, then the probability that a neighboring element is selected is `cache block size / num_objects` - representing the probability of a spatial cache hit (not sure if that's a real term).

If an element is fetched, then suppose that it will leave the L1 cache, if untouched, after `k` more fetches. 
The probability that the element is randomly fetched again is 
```
1 - ((num_objects - 1)/ num_objects)^k
```
(acquired from geometric distribution), representing the probability of a temporal cache hit, assuming the value is not kept in the cache because it's part of the cache block of a different fetched value. 

# Graphs
(insert boxplot graph)
In this plot I show the boxplot for each `num_objects` where y-axis the amount of time required to fetch a single random element. 
You'll notice that `num_objects = 10` has a smaller interquartile region and a lower median. 
The interquartile regions of the other plots appear basically the same in terms of position and height.
The median random-fetch-time is the same, with three exceptions: i = 10, 17 and 23. 
I'm not sure why 17 and 23 have a lower median than the other plots.
My hypthesis is that some caching feature is available at those array sizes, but at others, but I have no specific ideas. 

(insert full bloxplot)
This is the same graph as above with y-axis longer to show more of the outliers.
You can see that there are quite a few outliers, and notice that at this scale, the different object sizes (except i = 10) have similar random-fetch-times. 

(insert aggregate scatter plot)
This graph is a monstrosity. 
It is a scatter plot of all of the data I collected. 
Each point represents (iteration number, time to fetch random element), and the color of the point corresponds to array size (see legend).
I show this plot because of the strange rectangular structures.

First, there is the light blue rectangle sitting at (0,230) to (1500,238). 
This rectangle corresponds to an object size of 17, and may explain why 17 has a lower median than the other values. 
But, I do not know how to explain the behavior - yet.

Second, there are two big pink-purple rectangles that are offset.
After about 5000 iterations, a number of object sizes suddently drop and take less time. 
I don't know how to explain this.

Third, The orange points, correspond to an object size of 10, is very consistent at the bottom. 
The rectangles do not shift around like any of the other object sizes. 
This suggests, to me, that the size of some cache is between `2**10 and 2**11`, such that the entire 10 array could fit in the same cache (say the L1 cache), and could be accessed efficiently and consistently after compulsory cache misses. 

