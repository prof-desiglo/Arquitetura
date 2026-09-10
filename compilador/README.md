# Compilação

gcc -O0 c_complexo.c -S -o complexo_0.s
gcc -O2 c_complexo.c -S -o complexo_2.s

as complexo_0.s -o complexo_0.o
as complexo_2.s -o complexo_2.o

ld complexo_0.o -o complexo_0 -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2

objdump -d complexo_0.o

------
gcc -g c_complexo.c -o complexo

# Padrão de exibição é usando a sintaxe da AT&T
objdump -D complexo | grep -A20 soma
objdump -M intel -D complexo | grep -A20 soma

