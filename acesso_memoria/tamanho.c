#include <stdio.h>

int main() {
    int idade = 25;
    float altura = 1.75;
    char letra = 'A';
    double salario = 5000.50;

    printf("int: %zu bytes\n", sizeof(idade));
    printf("float: %zu bytes\n", sizeof(altura));
    printf("char: %zu bytes\n", sizeof(letra));
    printf("double: %zu bytes\n", sizeof(salario));

    return 0;
}
