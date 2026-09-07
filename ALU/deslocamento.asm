org 100h

; NOT
mov al, 5          ; 00000101
not al             ; 11111010

; SHL  - Deslocamento para esquerda
mov al, 5          ; 00000101
shl al, 1          ; 00001010 = 10
shl al, 1          ; 00010100 = 20

; SHR  - Deslocamento para direita
mov al, 20         ; 00010100
shr al, 1          ; 00001010 = 10
shr al, 1          ; 00000101 = 5

; SAL   - Deslocamento aritimetico para esquerda
mov al, 5          ; 00000101
sal al, 1          ; 00001010 = 10

; SAR   - Deslocamento aritimetico para direita
mov al, -10        ; 11110110
sar al, 1          ; 11111011 = -5

mov ah, 4Ch
int 21h
