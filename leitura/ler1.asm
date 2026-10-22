org 100h

.data
buffer db 20        ; tamanho máximo
       db ?         ; nº de caracteres lidos (preenchido pelo DOS)
       db 20 dup(?) ; texto digitado

msg db 13,10,'Voce digitou: $'

.code
    mov ax, @data
    mov ds, ax

    mov dx, offset buffer
    mov ah, 0Ah
    int 21h

    ; coloca '$' no fim do texto para poder imprimir
    mov bl, buffer[1]
    mov bh, 0
    mov buffer[bx+2], '$'

    ; mostra mensagem
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; mostra o texto lido
    mov dx, offset buffer+2
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
