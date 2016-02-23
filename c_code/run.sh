#!/bin/bash

mkdir -p ../data
ITERS=100000
for (( ARR_SIZE = 2**10; ARR_SIZE <= 2**24; ARR_SIZE *= 2))
do
    echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
	./a.out $ARR_SIZE $ITERS 1>> ../data/$ARR_SIZE-$ITERS.csv
    sleep 0.5
done


