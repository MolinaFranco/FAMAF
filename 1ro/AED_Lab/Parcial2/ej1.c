#include <stdio.h>
#include <assert.h>

int ingreseInt(char c) {
  int x;
  printf("Ingresar un valor para %c: ", c);
  scanf("%d", &x);
  return x;
};

void valorInt(int x, char c) {
  printf("El valor de %c es: %d\n", c, x); 
};



int main()
{  
    int x,y,z;
    x = ingreseInt('x');
    y = ingreseInt('y');
    z = ingreseInt('z');

    assert((z-y != 0) && (x -y != 0));

    int tmpx = x;
    int tmpy = y;
    int tmpz = z;

    x = (tmpz - tmpy) / (tmpx - tmpy);
    y = (tmpz % tmpx);

    assert(x==((z - tmpy) / (tmpx - tmpy)) && y==z%tmpx);

    valorInt(x,'x');
    valorInt(y,'y');
    valorInt(z,'z');

    return 0;
}




