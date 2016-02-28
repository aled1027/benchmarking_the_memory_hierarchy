#!/bin/bash

#ITERS=100000
#ARR_SIZE=8
#echo "arr_size, iters, time"
#for (( k = 0; k < 1000; k++))
#do
#    ./a.out $ARR_SIZE $ITERS
#done

# 8388608 16777216

for ((ARR_SIZE=10; ARR_SIZE<=24; ARR_SIZE++));
do
    echo "arr_size, iters, time" > ../new_data/$ARR_SIZE.csv
done

for ((i=0; i<10; i++));
do
    for ((ARR_SIZE=10; ARR_SIZE<=24; ARR_SIZE++));
    do
        echo $ARR_SIZE
        for ((k=0; k<5; k++));
        do
            ./a.out $ARR_SIZE >> ../new_data/$ARR_SIZE.csv
        done
    done
done

