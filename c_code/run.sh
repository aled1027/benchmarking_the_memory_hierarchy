#!/bin/bash

#mkdir -p ../data
ITERS=100000
for (( ARR_SIZE = 2**10; ARR_SIZE <= 2**24; ARR_SIZE *= 2))
do
    echo $ARR_SIZE
    echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
    for ((k = 0; k < 1000; k++))
    do
	    ./a.out $ARR_SIZE $ITERS >> ../data/$ARR_SIZE-$ITERS.csv
    done
done

#iters=1000000
#for (( k = 0; ARR_SIZE < 500; ARR_SIZE++))
#do
#    ./a.out 2048 $iters
#done


