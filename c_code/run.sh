#!/bin/bash

#ITERS=1000000
#for (( ARR_SIZE = 2**10; ARR_SIZE <= 2**24; ARR_SIZE *= 2))
#do
#    echo $ARR_SIZE
#    echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
#    for ((k = 0; k < 1000; k++))
#    do
#	    ./a.out $ARR_SIZE $ITERS >> ../data/$ARR_SIZE-$ITERS.csv
#    done
#done

ARR_SIZE=512
ITERS=1000000

echo "arr_size, iters, time" > ../new_data/$ARR_SIZE-$ITERS.csv
for (( k = 0; k < 100; k++))
do
    ./a.out $ARR_SIZE $ITERS >> ../new_data/$ARR_SIZE-$ITERS.csv
done


