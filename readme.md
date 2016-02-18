
# Benchmarking the memory hierarchy

## Goal
The main goal of this exercise is to empirically determine the sizes of the different cache layers in a processor by building a micro-benchmark that measures memory performance for different request sizes. It turns out it's not so easy to expose gaps in memory performance because the compiler and CPU work hard to hide those from the developer, so that memory accesses are as fast as possible in most normal circumstances. We'll work hard in turn to trick the CPU to reveal its secrets to us.

## Part 1
### Prompt
During the first part, you'll write a C program that measures the latency of reading a byte from memory out of a buffer of N bytes, while varying N through different sizes. The output of your benchmark should look something like this:

Your program should iterate on different buffer sizes (say, from 2**10 to 2**26, whatever makes sense to get a meaningful range). For each size, it should loop many time to read a byte from a pre-allocated buffer of this size, and measure the latency (end-to-end time) of this copy, then print it out.

### Answer
asdf





