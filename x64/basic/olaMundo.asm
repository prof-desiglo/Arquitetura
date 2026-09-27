global _start

section .data
message: db 'ola mundo!', 10

section .text
_start:
	mov rax, 1 ; chamada de sistema
	mov rdi, 1 ; onde escrever
	mov rsi, message ; onde começa a string
	mov rdx, 10 ; bytes a serem escritos
	syscall
