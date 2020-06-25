org 	100h

section .text

        call 	grafico	; Llamada a iniciar modo grafico 13h

        ;Línea horizontal superior
	    xor 	di, di   ; mov di, 0h
LHS:	mov 	cx, 2d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 1d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 100d
        jne 	LHS

        ;Línea horizontal superior duplicada
        xor 	di, di   ; mov di, 0h
LHSD:	mov 	cx, 2d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 3d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 100d
        jne 	LHSD

        ;Línea vertical jota
        xor 	di, di   ; mov di, 0h
LVJ:	mov 	cx, 48d ; Columna 
        mov	    dx, 3d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 75d
        jne 	LVJ

        ;Línea vertical jota duplicada
        xor 	di, di   ;PONER EN CERO DI
LVJD:	mov 	cx, 50d ; Columna 
        mov	    dx, 3d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 78d
        jne 	LVJD

;Las horizontales inferiores
        ;Línea horizontal inferior
        xor 	di, di   ;PONER EN CERO DI
LHI:	mov 	cx, 18d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 77d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 30d
        jne 	LHI

        ;Línea horizontal inferior duplicada
        xor 	di, di   ;PONER EN CERO DI
LHID:	mov 	cx, 16d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 80d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 34d
        jne 	LHID

;Tres últimas líneas, gancho de la jota
        ;Verticales de gancho

        xor 	di, di   ;PONER EN CERO DI
LVG:	mov 	cx, 16d ; Columna 
        mov	    dx, 70d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 10d
        jne 	LVG

        xor 	di, di   ;PONER EN CERO DI
LVGD:	mov 	cx, 18d ; Columna 
        mov	    dx, 70d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 8d
        jne 	LVGD

        ;Línea horizontal de gancho, cierre

        xor 	di, di   ;PONER EN CERO DI
LHG:	mov 	cx, 16d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 70d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 2d
        jne 	LHG

        call 	kb		; Utilizamos espera de alguna tecla

        int 	20h

grafico:mov	    ah, 00h
        mov	    al, 13h
        int 	10h
        ret

pixel:	mov	    ah, 0Ch
        mov	    al, 1010b
        int 	10h
        ret

kb: 	mov	    ah, 00h
        int 	16h
        ret

section .data