;-------------------------------
;     programa 3
;
;-------------------------------

;---------------------|
; inicio da pilha     |
;---------------------|
MyStack SEGMENT STACK
    DB 512 DUP (?)       ; 512 bytes na pilha
MyStack ENDS
;---------------------|
; fim da pilha        |
;---------------------|

;---------------------------------|
; inicio do segmento de dados     |
;---------------------------------|
MyData SEGMENT
    Mundo1   DB "ola mundo","$"
    CRLF     DB 0DH,0AH, "$"
MyData ENDS
;---------------------------------|
; fim do segmento de dados        |
;---------------------------------|

;---------------------------------|
; inicio do segmento de codigo    |
;---------------------------------|
MyProg SEGMENT
    assume CS:MyProg,DS:MyData

Main PROC
Start:
    mov AX, MyData
    mov DS, AX

    ;--------------------------------
    ; LOOP
    ; CX funciona como contador
    ;--------------------------------
    mov CX, 5

InicioLoop:

    lea DX, Mundo1
    call Write

    lea DX, CRLF
    call Write

	;----------------------------
    ;; Loop é equivalente a:
	; DEC CX
    ;JNZ InicioLoop
	;----------------------------
    loop InicioLoop

    ;--------------------------------
    ; Terminar programa
    ;--------------------------------
    mov AH, 4CH
    mov AL, 0
    int 21H

Main ENDP


Write PROC
    mov AH, 09H
    int 21H
    ret
Write ENDP

MyProg ENDS

END Start