org 100h

        mov ax, 0B800h
        mov es, ax              ; ES aponta para a memória de vídeo
        cld

        ; --- limpa a tela (espaço com atributo 07h) ---
        xor di, di
        mov cx, 80*25
        mov ax, 0720h           ; AH=07h (cinza s/ preto), AL=20h (espaço)
        rep stosw

        ; --- escreve texto na linha 10, coluna 30 ---
        ; offset = (10*80 + 30) * 2 = 1660
        mov di, 1660
        mov si, offset texto
        mov ah, 1Eh             ; amarelo sobre azul
escreve:
        lodsb                   ; AL = próximo caractere
        cmp al, 0
        je  barra
        stosw                   ; grava AL (char) e AH (cor) em ES:[DI]
        jmp escreve

        ; --- barra colorida na linha 12 (16 cores de fundo) ---
barra:
        mov di, (12*80 + 32)*2
        mov bl, 0               ; cor de fundo atual
        mov cx, 16
cores:
        mov al, ' '
        mov ah, bl
        shl ah, 4               ; move a cor para o nibble do fundo
        stosw
        stosw                   ; 2 espaços por cor
        inc bl
        loop cores

        hlt

texto db " Escrevendo no video! ", 0