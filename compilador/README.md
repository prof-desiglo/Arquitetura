# Compilação

gcc -O0 c_complexo.c -S -o complexo_0.s
gcc -O2 c_complexo.c -S -o complexo_2.s

as complexo_0.s -o complexo_0.o
as complexo_2.s -o complexo_2.o

ld complexo_0.o -o complexo_0 -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2

objdump -d complexo_0.o
