#!/bin/bash

#mkdir -p ../data
#ITERS=100000
#for (( ARR_SIZE = 2**10; ARR_SIZE <= 2**24; ARR_SIZE *= 2))
#do
#    echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
#    sleep 0.5
#	./a.out $ARR_SIZE $ITERS 1>> ../data/$ARR_SIZE-$ITERS.csv
#done
iters=1000000
for (( k = 0; ARR_SIZE < 500; ARR_SIZE++))
do
    ./a.out 2048 $iters
done


