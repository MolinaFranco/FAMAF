CC = gcc
CFLAGS = -std=c99 -Wall -Wextra
DIR = ej
DIRS := $(wildcard $(DIR)*[!output]) 
OUTPUT := $(patsubst $(DIR)%, $(DIR)%.output, $(DIRS)) 

all: clean $(OUTPUT) 

$(DIR)%.output: ;
	$(CC) -o $@ $(subst .output,"", $@)/main.c

clean:
	rm -f **.output

#para poder generar todos los ejecutables, correr el comando make
#make clean para borrar todos los ejecutables
#luego ejecutar con ./ y el numero del ejercicio
#ej: ./ej1.output