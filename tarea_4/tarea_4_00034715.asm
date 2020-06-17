	org 	100h

section .text

	    call 	texto  	;inicio el modo texto
        ;call 	cursor
        ;call 	phrase
        xor 	si, si 	;lo mimso que: mov si, 0000h
lupiU:	call 	kb
        cmp 	al, "$" ;Sí el caracter en ASCII (guardado en AL) es igual a $
        je      mostrar ;para y muestra el texto...
                ;Caso contrario:
        mov	    [300h+si], al ; CS:0300h en adelante
        inc 	si
        jmp 	lupiU

        ;Ahora va la lógica del promedio para posteriormente hacer la impresión del texto
        call    promedio

mostrar:call 	w_strng

        call 	kb	; solo detenemos la ejecución

        int 	20h

texto:	mov 	ah, 00h
        mov	    al, 03h
        int 	10h
        ret

kb:	    mov	    ah, 00h ;subrutina que detiene la ejecución hasta recibir
        int 	16h	;algun carácter en el buffer del teclado
        ret		;este carácter lo guarda en el registro AL

w_strng:mov	    ah, 13h
        mov 	al, 01h ; asigna a todos los caracteres el atributo de BL,
                ; actualiza la posición del cursor
        mov 	bh, 00h ; número de página
        mov	    bl, 00001111b ; atributo de caracter
        mov	    cx, si ; tamaño del string (SI, porque todavía guarda la última posición)
        mov	    dl, 10h ; columna inicial
        mov	    dh, 7h	; fila inicial
                ; Como esta interrupción saca el string de ES:BP, tenemos que poner los valores correcpondientes
        push 	cs ; Segmento actual en el que está guardado nuestro string
        pop	    es ; Puntero al segmento que queremos 
        mov	    bp, 300h ; Dirección inicial de nuestra cadena de texto
            ; ES:BP equals CS:300h 
        int     10h
        ret

;Acá la función para la sumatoria
;Básicamente accedo a los números caputados y hago la operación del promedio
promedio:   mov     ax, [300h]
            mov     bx, [301h]
            ADD     ax, bx
            mov     bx, [302h]
            ADD     ax, bx
            mov     bx, [303h]
            ADD     ax, bx
            mov     bx, [304h]
            ADD     ax, bx
            mov     bx, 5d
            div     bx ;entiendo yo que esto va a dividir a al (AL posee el resultado, que debería ser 4 con mis números de carnet)
            ;La guardo en 305
            mov     [305h], AL
            ret