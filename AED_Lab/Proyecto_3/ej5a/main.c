#include <stdio.h>
#include "../auxiliar.c"

//1.h
int P1(void)
{
    int i;
    i =  ingreseInt('i');
    while(i!=0){
        i = i-1;
    };
    valorInt(i,'i');

    return 0;
}

//1.i
int P2(void)
{
    int i;
    i =  ingreseInt('i');
    while(i!=0){
        i = 0;
    };
    valorInt(i,'i');

    return 0;
}


int main(void)
{
    P1();
    P2();

    return 0;
}