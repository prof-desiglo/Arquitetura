;-------------------------------
;     programa 1
;
;-------------------------------

;---------------------|
; inicio da pilha     |
;---------------------|
MyStack SEGMENT STACK
	DB 512 DUP (?)  ; 512 bytes na pilha
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
	; Usando a pilha (SP e BP)
	mov AX, 0Fh
	PUSH AX
	PUSHF
	mov AX, 1
	POPF
	POP AX
	;
	
	lea DX, Mundo1 ;carrega o endereço de memoria
	call Write
	
	lea DX, CRLF   ;carrega o endereço de memoria
	call Write
	
	mov AH, 4CH    ;Terminar
	mov AL, 0      ; retorno
	int 21H        ; chama o DOS
Main ENDP

Write PROC
	mov AH, 09H    ; print
	int 21H        ; chama o DOS
	ret
Write ENDP

MyProg ENDS
;---------------------------------|
; fim do segmento de codigo       |
;---------------------------------|

END Start
