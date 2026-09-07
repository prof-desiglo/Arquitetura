#include <stdio.h>

int soma(int *vetor, int tamanho) {
    int resultado = 0;

    while (tamanho > 0) {
        resultado += *vetor;
        vetor++;
        tamanho--;
    }

    return resultado;
}

int main() {
    int vetor[] = {10, 20, 30, 40, 50};

    printf("%d\n", soma(vetor, 5));

    return 0;
}
