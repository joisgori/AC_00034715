	org 	100h

section .text

        xor 	si, si 	;lo mimso que: mov si, 0000h
        xor     al, al
        xor     ah, ah
        xor     bl, bl
        xor     bh, bh
        xor     cl, cl
lupiU:	call 	kb
        cmp 	al, "$" ;Sí el caracter en ASCII (guardado en AL) es igual a $
        je      promedio ;Calculo el promedio
                ;Caso contrario:
        mov	    [300h+si], al ; CS:0300h en adelante
        SUB     al, 48d
        mov     ah, 0d
        ADD     bl, al
        inc 	si
        jmp 	lupiU


mostrar:mov	    byte [306h], "$"
	    call 	w_strng

        call 	kb	; solo detenemos la ejecución

        int 	20h

kb: 	mov	    ah, 1h
	    int 	21h
	    ret

w_strng:mov	    ah, 09h
	    mov 	dx, 300h
	    int 	    21h
	    ret

print:	mov	ah, 09h
	    int 	21h
	    ret

;Acá la función para la sumatoria
;Básicamente accedo a los números caputados y hago la operación del promedio
promedio:   mov     al, bl;entiendo yo que esto va a dividir a al (AL posee el resultado, que debería ser 4 con mis números de carnet)
            mov     cl, 5d
            div     cl
            SUB     al, 3d
            mov     [305h], al ;Acá estpa mi resultado de la división, que me da 4
            ;Ahora lo muestro
            ;call    mostrar

            mov 	dx, msg
            call 	print

            ret

msg	db 	"ME RECUPERO PRRAS$" ;Por ende acá está el mensaje