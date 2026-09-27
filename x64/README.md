# x86-64

x86-64 Compatible code

# exec
nasm -felf64 olaMundo.asm -o ola.o
ld -o ola ola.o
chmod u+x ola