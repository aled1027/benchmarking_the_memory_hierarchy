#!/bin/bash

#ITERS=100000
#ARR_SIZE=8
#echo "arr_size, iters, time"
#for (( k = 0; k < 1000; k++))
#do
#    ./a.out $ARR_SIZE $ITERS
#done

# 8388608 16777216

for ((ARR_SIZE=24; ARR_SIZE>=3; ARR_SIZE--));
do
    echo $ARR_SIZE
    echo "arr_size, iters, time" > ../data/$ARR_SIZE.csv
    for ((k=0; k<10; k++));
    do
        ./a.out $ARR_SIZE >> ../data/$ARR_SIZE.csv
    done
done
