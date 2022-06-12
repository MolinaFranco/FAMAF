CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g
SOURCES = pqueue.c main.c
OBJECTS = $(SOURCES:.c=.o)
TARGET = dispatch_patients
VALGRIND = valgrind --leak-check=full -s
INPUTS = input/hospital_c.in

.PHONY: clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

valgrind:
	$(VALGRIND) ./$(TARGET) $(INPUTS)

run:
	./$(TARGET) $(INPUTS)

clean:
	$(RM) $(OBJECTS) $(TARGET)