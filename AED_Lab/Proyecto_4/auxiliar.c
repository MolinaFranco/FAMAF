const char* boolR(int x){
    if (x = 1){
        return "True";
    };
    return "False";  
};

int ingreseInt(char c) {
  int x;
  printf("Ingresar un valor para %c: ", c);
  scanf("%d", &x);
  return x;
};

void valorInt(int x, char c) {
  printf("El valor de %c es: %d\n", c, x); 
};