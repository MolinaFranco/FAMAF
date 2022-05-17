#ifndef WEATHER_UTILS1
#define WEATHER_UTILS1
#include "weather.h"
#include "array_helpers.h"


// Menor temperatura minima 
int min_temp_min(WeatherTable a);

// Mayor temperatura máxima
void max_temp_for_year(WeatherTable a, int output[YEARS]);

// Mayor cantidad mensual de precipitaciones
void max_month_prep(WeatherTable a, month_t output[YEARS]);

#endif