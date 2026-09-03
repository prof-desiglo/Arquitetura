org 100h

; DS aponta para o segmento de dados
;mov ax, cs
;mov ds, ax

; Vetor comecando no endereco 0200h
mov byte ptr [0200h], 11h
mov byte ptr [0201h], 22h
mov byte ptr [0202h], 33h
mov byte ptr [0203h], 44h
mov byte ptr [0204h], 55h

; SI recebe o endereco inicial
mov si, 0200h

; Le cada posicao
mov al, [si]
mov bl, [si+1]
mov cl, [si+2]
mov dl, [si+3]
mov ah, [si+4]

mov ah, 4Ch
int 21h