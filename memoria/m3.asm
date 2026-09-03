org 100h

mov al, 10
mov bl, 3

add al, bl       ; AL = 13
sub al, bl       ; AL = 10
inc al           ; AL = 11
dec al           ; AL = 10 (0000 1010)
not al           ; AL = Inverte os bits
not al
neg al           ; AL = -10 1111 0110
neg al           ; AL = 10
div bl            ; AX / BL
                  ; AL = 3  (quociente)
                  ; AH = 1  (resto)
                  


mov ah, 4Ch
int 21h