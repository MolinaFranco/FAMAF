CC=gcc
CFLAGS = -std=c99 -pedantic -Wall -Werror -Wextra -g -no-pie

all: clean reader.output

%.output: ;
	$(CC) $(CFLAGS) -c *.c
	$(CC) $(CFLAGS) *.o -o main 


clean:
	@rm -f *.o
	@rm -f main
	@rm -f *.out