#include "weather.h"
#include "array_helpers.h"

int min_temp_min (WeatherTable a){
    int min = a[0][0][0]._min_temp;
    for (unsigned int year = 0u; year < YEARS; year++) {
        for (unsigned int month = 0u; month < MONTHS; month++){
            for (unsigned int day = 0u; day < LST_DAY; day++){
                if (a[year][month][day]._min_temp < min){
                    min = a[year][month][day]._min_temp;
                }
            }
        }
    }
    return min;
}


void max_temp_for_year(WeatherTable a, int output[YEARS]) {
    for (unsigned int year = 0u; year < YEARS; year++) {
        for (unsigned int month = 0u; month < MONTHS; month++){
            for (unsigned int day = 0u; day < LST_DAY; day++){
                if(month==0 && day==0){
                    output[year] = a[year][month][day]._max_temp;
                } else {
                    if(output[year] < a[year][month][day]._max_temp){
                        output[year] = a[year][month][day]._max_temp;
                    }
                }
            }   
        }
    }
}

unsigned int total_rainfall_for_month(WeatherTable a, int year, month_t month) {
    unsigned int sum = 0u;
    for(unsigned int day=0; day<DAYS; ++day){
        sum += a[year][month][day]._rainfall;
    }
    return sum;
}

void max_month_prep(WeatherTable a, month_t output[YEARS]) {
    for (unsigned int year = 0u; year < YEARS; year++) {
        for (month_t month = january; month <= december; ++month){
            if(month == january){
                output[year] = month;
            }else{
                if(total_rainfall_for_month(a, year, month) > total_rainfall_for_month(a, year, output[year])){
                    output[year] = month;
                }
            }
        }
    }
}
