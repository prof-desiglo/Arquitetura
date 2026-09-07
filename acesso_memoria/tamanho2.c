#include <stdio.h>

int main() {
    int numeros[10];

    printf("Tamanho total: %zu bytes\n", sizeof(numeros));
    printf("Tamanho de um elemento: %zu bytes\n", sizeof(numeros[0]));
    printf("Quantidade de elementos: %zu\n",
       sizeof(numeros) / sizeof(numeros[0]));

    return 0;
}
