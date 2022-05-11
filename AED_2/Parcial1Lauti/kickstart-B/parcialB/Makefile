CC=gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

all: clean reader.output

%.output: ;
	$(CC) $(CFLAGS) -c *.c
	$(CC) $(CFLAGS) *.o -o delivery 


clean:
	@rm -f *.o
	@rm -f delivery
	@rm -f *.out