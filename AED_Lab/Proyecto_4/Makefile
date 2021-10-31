CC = gcc
CFLAGS = -std=c99 -Wall -Wextra
EJS := $(wildcard **/*.c)
SEMIOUTPUT := $(patsubst /,-,$(EJS))
OUTPUT := $(patsubst %.c, %.output, $(SEMIOUTPUT))

all: clean $(OUTPUT) 

$(DIR)%.output: ;
	$(CC) -o $@ $(subst .output,"", $@)/%.c

clean:
	rm -f **.output

#para poder generar todos los ejecutables, correr el comando make
#make clean para borrar todos los ejecutables
#luego ejecutar con ./ y el nombre del ejercicio
#ej: ./ej1.output