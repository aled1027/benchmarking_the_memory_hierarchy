#!/bin/bash

#ITERS=100000
#ARR_SIZE=8
#echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
#for (( k = 0; k < 1000; k++))
#do
#    ./a.out $ARR_SIZE $ITERS >> ../data/$ARR_SIZE-$ITERS.csv
#done
# 8388608 16777216

ITERS=10000
for ARR_SIZE in 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 
do
    echo $ARR_SIZE
    echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
    for (( k = 0; k < 1000; k++))
    do
        ./a.out $ARR_SIZE $ITERS >> ../data/$ARR_SIZE-$ITERS.csv
    done
done
