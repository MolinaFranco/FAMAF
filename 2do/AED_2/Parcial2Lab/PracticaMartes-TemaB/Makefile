CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g
SOURCES = pstack.c main.c
OBJECTS = $(SOURCES:.c=.o)
TARGET = pstack_test
INPUTS = input/example_a.in
VALGRIND = valgrind --leak-check=full -s

.PHONY: clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

valgrind:
	$(VALGRIND) ./$(TARGET) $(INPUTS)

clean:
	$(RM) $(OBJECTS) $(TARGET)
