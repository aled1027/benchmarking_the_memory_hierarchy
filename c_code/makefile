
#CFLAGS = -O3 -Wall -Wextra -pedantic -Werror -std=gnu11
CFLAGS = -O3 -std=gnu11
LIBS = -lm -lrt

default:
	gcc $(CFLAGS) utils.c main.c  $(LIBS)

run:
	./a.out 22

r10:
	./a.out 10

gdb:
	gdb --args ./a.out

valg:
	valgrind ./a.out

rs:
	./run.sh
