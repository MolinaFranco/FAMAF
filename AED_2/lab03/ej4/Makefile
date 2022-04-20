CC=gcc
CFLAGS = -std=c99 -pedantic -Wall -Werror 

all: clean reader.output

%.output: ;
	$(CC) $(CFLAGS) -c proc1.c
	$(CC) $(CFLAGS) -o abs1 *.o main.c


clean:
	@rm -f *.o
	@rm -f *.out