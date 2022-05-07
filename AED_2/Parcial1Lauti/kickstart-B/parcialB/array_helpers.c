/*
@file array_helpers.c
@brief Array Helpers method implementation
*/
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "array_helpers.h"

/**
* @brief returns true when reach last entry in flight table
* @return True when is the last entre of the flight table, False otherwise
*/
static bool is_last_line(unsigned int hour, unsigned int type) {
  return  hour == HOURS - 1u && type == TYPE - 1u;
}

void array_dump(DeliveryTable a) {
  for (unsigned int type = 0u; type < TYPE; ++type) {
    for (unsigned int hour = 0u; hour < HOURS; ++hour) {
      Flight f = a[type][hour];
      fprintf(stdout, "%c: flight with %u %s arrived at %u:00", f.code, f.items_amount, f.type == 0 ? "boxes" : "letters", f.hour - 1);
      if (!is_last_line(hour, type))
      {
        fprintf(stdout, "\n");
      }
    }
  }
}

unsigned int penalty_calc(unsigned int tB,unsigned int tL){
  unsigned int r = 0;
  if(tB>MAX_ALLOWED_BOXES){
      r += (tB-MAX_ALLOWED_BOXES) * BOX_PENALTY;
    }
  if(tL>MAX_ALLOWED_LETTERS){
      r += (tL - MAX_ALLOWED_LETTERS) * LETTER_PENALTY;
    }

  return r;
}

unsigned int extra_space_fee_cost (DeliveryTable a) {
  /* COMPLETAR */
  unsigned int totalBoxes = 0;
  unsigned int totalLeters = 0;

  for (unsigned int type = 0u; type < TYPE; ++type) {
    for (unsigned int hour = 0u; hour <= FEE_CLOSE_HOUR; ++hour) {

      Flight f = a[type][hour];

      if ((f.type)==boxes){
        totalBoxes += f.items_amount;
      }else{
        totalLeters += f.items_amount;
      }     
    }
  }

  printf("%u - %u", totalBoxes,totalLeters);

  return penalty_calc(totalBoxes,totalLeters);
}

int real_hour(Flight x){
    int h;
    if(x.hour==0){
      h=24;
    }else{
      h=x.hour-1;
    }
    return h;
  }

void array_from_file(DeliveryTable array, const char *filepath) {
  FILE *file = NULL;

  file = fopen(filepath, "r");
  if (file == NULL) {
    fprintf(stderr, "File does not exist.\n");
    exit(EXIT_FAILURE);
  }

  char code;
  // int i = 0;
  while (!feof(file)) { /* COMPLETAR: lectura completa de todos los datos */
    int res = fscanf(file,"_%c_",&code); /* COMPLETAR: lectura de codigo de vuelo */
    // fprintf(res,code);
    if (res != 1) {
      fprintf(stderr, "Invalid file.\n");
      exit(EXIT_FAILURE);
    }
    /* COMPLETAR: Generar y guardar ambos Flight en el array multidimensional */
    Flight flight_boxes = flight_from_file(file, code, 0);/* completar... */
    Flight flight_letters = flight_from_file(file, code, 1);/* completar... */

    array[flight_boxes.type][real_hour(flight_boxes)]=flight_boxes;
    array[flight_letters.type][real_hour(flight_letters)]=flight_letters;

  }
}




