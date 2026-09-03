org 100h 

mov al, 5       ; AL = 00000101
mov bl, 3       ; BL = 00000011
        
; OR bit-bit
or  al, bl      ; AL = AL OR BL
                ; AL = 00000111 = 7

mov ah, 4Ch
int 21h
