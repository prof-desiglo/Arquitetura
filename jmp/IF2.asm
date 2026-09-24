org 100h

mov al, 5
mov bl, 3

cmp al, bl
jg maior ; Jump if Greater (ZF = 0  E  SF = OF)

mov dl, 'N'
jmp fim

maior:
mov dl, 'S'

fim:
mov ah, 02h
int 21h

mov ah, 4Ch
int 21h
