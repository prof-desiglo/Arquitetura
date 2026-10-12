#start=printer.exe#
name "impr"

PORTA_DADOS equ 130          ; Porta da impressora

        mov si, offset texto
proximo:
        mov al, [si]
        cmp al, 0
        je  fim
        out PORTA_DADOS, al
        inc si
        jmp proximo
fim:
        ret

texto db "Ola, impressora virtual!", 13, 10, 0

