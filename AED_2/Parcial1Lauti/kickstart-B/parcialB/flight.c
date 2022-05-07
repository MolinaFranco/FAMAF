/*
  @file layover.c
  @brief Implements flight structure and methods
*/
#include <stdlib.h>
#include "flight.h"

static const int AMOUNT_OF_FLIGHT_VARS = 2;

Flight flight_from_file(FILE* file, char code, item_t type)
  {
    Flight flight;
    flight.code = code;
    flight.type = type;

    /* COMPLETAR */

    unsigned int h,a;
    int res;

    res = fscanf(file, EXPECTED_FLIGHT_FILE_FORMAT, &h, &a);
    if (res != AMOUNT_OF_FLIGHT_VARS) {
      fprintf(stderr, "Invalid file.\n");
      exit(EXIT_FAILURE);
    }

    flight.hour = h;
    flight.items_amount = a;        

    return flight;
  
  }
