org 100h

jmp inicio

buffer db 6          ; máx. 5 dígitos (+ Enter)
       db ?          ; qtd. lida
       db 6 dup(?)   ; texto
msg    db 13,10,'Digite um numero: $'
msgok  db 13,10,'Voce digitou: $'
msgerr db 13,10,'Erro: valor invalido!$'
msgpar db 13,10,'O numero e PAR$'
msgimp db 13,10,'O numero e IMPAR$'
numero dw ?

inicio:
    mov dx, offset msg
    mov ah, 09h
    int 21h

    call ler_texto
    call ascii_para_num     ; CF=1 se inválido
    jc erro

    mov numero, ax

    mov dx, offset msgok
    mov ah, 09h
    int 21h

    mov ax, numero
    call imprimir_num

    mov ax, numero
    call verifica           ; informa se é par ou ímpar
    jmp sair

erro:
    mov dx, offset msgerr
    mov ah, 09h
    int 21h

sair:
    mov ah, 4Ch
    int 21h

; ---------------------------------
ler_texto proc
    mov dx, offset buffer
    mov ah, 0Ah
    int 21h
    ret
ler_texto endp

; ---------------------------------------------
; Saída: AX = valor, CF=0 se ok / CF=1 se inválido
; ---------------------------------------------
ascii_para_num proc
    mov si, offset buffer + 2
    mov cl, buffer[1]
    mov ch, 0
    cmp cx, 0
    je invalido             ; nada digitado
    xor ax, ax
    mov bx, 10
proximo:
    mul bx                  ; AX = AX*10 (destrói DX)
    jc invalido             ; passou de 65535
    mov dl, [si]
    cmp dl, '0'
    jb invalido
    cmp dl, '9'
    ja invalido
    sub dl, '0'
    mov dh, 0
    add ax, dx
    jc invalido             ; passou de 65535
    inc si
    loop proximo
    clc                     ; sucesso
    ret
invalido:
    stc                     ; erro
    ret
ascii_para_num endp

; ---------------------------------
; imprimir_num: imprime AX em decimal
; ---------------------------------
imprimir_num proc
    mov bx, 10
    xor cx, cx
divide:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz divide
imprime:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop imprime
    ret
imprimir_num endp

; ---------------------------------------------
; verifica: olha o último bit (bit 0) de AX
; bit 0 = 0 -> par / bit 0 = 1 -> ímpar
; ---------------------------------------------
verifica proc
    test ax, 1              ; testa o bit 0 (ZF=1 se for 0)
    jnz impar
    mov dx, offset msgpar
    jmp mostra
impar:
    mov dx, offset msgimp
mostra:
    mov ah, 09h
    int 21h
    ret
verifica endp
