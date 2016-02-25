#!/bin/bash

ITERS=1000000
#for (( ARR_SIZE = 2**10; ARR_SIZE <= 2**24; ARR_SIZE *= 2))
#do
#    echo $ARR_SIZE
#    echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
#    for ((k = 0; k < 1000; k++))
#    do
#	    ./a.out $ARR_SIZE $ITERS >> ../data/$ARR_SIZE-$ITERS.csv
#    done
#done

#ARR_SIZE=16777216
#echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
#for (( k = 0; k < 100; k++))
#do
#    ./a.out $ARR_SIZE $ITERS >> ../data/$ARR_SIZE-$ITERS.csv
#done

ITERS=1000
for ARR_SIZE in 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 16777216
do
    echo $ARR_SIZE
    echo "arr_size, iters, time" > ../data/$ARR_SIZE-$ITERS.csv
    for (( k = 0; k < 100; k++))
    do
        ./a.out $ARR_SIZE $ITERS >> ../data/$ARR_SIZE-$ITERS.csv
    done
done
