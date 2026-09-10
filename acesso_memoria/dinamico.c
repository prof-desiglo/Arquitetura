#include <stdlib.h>

int global = 10;
int global2;

void funcao(int x){
    int y = 20;
    int *p = malloc(sizeof(int));
    *p = 30;
    free(p);
}

int main(void){
    int a = 1;
    funcao(a);
    return 0;
}
