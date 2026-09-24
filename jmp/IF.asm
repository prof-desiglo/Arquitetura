org 100h

mov al, 5
mov bl, 5
          
; if al == bl
cmp al, bl
je  iguais

; aqui seria o "else"
mov dl, 'N'
jmp fim

iguais:
mov dl, 'S'

fim:
mov ah, 02h
int 21h

mov ah, 4Ch
int 21h
