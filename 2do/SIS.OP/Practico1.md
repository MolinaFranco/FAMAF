
## 1

#### a)
    2 nucleos: al ser 2 instancias, tienen el mismo tiempo
    al tirar 4 instancias salen los 4 con el doble de timepo (context switch) 

#### b)
    culpa del contextswitch y todos los 

#### c)
    en los que se tardan mas es simplemente ruido por que los cputime dan mas o menos iguales

## 2
    walltime<cputime

    priceso paralelizable, sumo el tiempo que utilizo en dos nucleos distinto
    gold muticore

## 3
    user=real un core sin ruido
    user<real ruido, contextswitch
    user>real multicore

## 4
    x -> registros o stack

#### a)
    x=100

#### b)
    cambian independientemente
    a menos que tenga una redefinicion

#### c)
    no pasa nada, funcionan de igual manera (el contextswitch maneja los registros igual que el stack)

## 5
    10 prints de a, mentira no es lineal, el hijo y el padre van a tener un hijo cada uno en el siguiente fork

    1+2+4+8 = 15

    es exponencial

## 6
    0 por que se ejecuta el execv y nunca vuelve xd

## 7
    se ejecuta a si mismo con un argumento menos
    se llama a si mismo
    ```c
    execv(argv[0],argv)

    por que argv[0] nombre del programa que se esta ejecutando si o si
    argc >= 1
    ```

## 8
    el open puede fallar tranquilamente, en este caso el dup saltaria con error 
    en el ejemplo 1 en caso de que falle el open, se romperia el printf

## 12
    v
    f
    v xzr?
    f necesit el os
    v si tiene un solo proceso, el so no cuenta como cambio de contexto
    f el 0 siempre lo tiene el init asi que siempre esta ocupado, pero si te sirve para distinguirlo
    v
    f del hijo al padre si se puede



pipes

int fd[2];
pipe(fd);

if((id = fork()) == 0){
    if((id = fork()) == 0){
        int x = 1;
        write(fd[1], x, sizeof(int)*2)
        # write(fd[1], x, sizeof(int))
    }else{
        int b;
        wait(pid)
        read(fd[0], b, sizeof(int))
        printf(%d, b)
    }
}else{
    int a;
    wait(pid)
    read(fd[0], a, sizeof(int)) 
    printf(%d, a)
}

return 0