.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5       ; contador
    mov dl, '1'     ; primeiro caractere

inicio:
    mov ah, 02h     ; funcao DOS: imprimir caractere
    int 21h

    inc dl          ; proximo caractere
    loop inicio     ; CX-- e, se CX != 0, volta para inicio

    mov ah, 4Ch     ; encerra o programa
    int 21h

main endp
end main