#include <stdio.h>
#include <stdbool.h>
#include "../auxiliar.c"

int main(void)
{
  int x, i, r;
  bool res;
  x = ingreseInt('x');
  i = ingreseInt('i');
  r = ingreseInt('r');
  res = r;
  i = 2;
  res = true;
  while(i < x && res){
    res = res && (x % i != 0 );
    i = i + 1;
    printf("Los valores son, x: %d i: %d res: %d \n", x, i, res);
  }
  
  return 0;
}