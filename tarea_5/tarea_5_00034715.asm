org 	100h

section .text

        call 	grafico	; Llamada a iniciar modo grafico 13h

        ;Línea horizontal superior
	    xor 	di, di   ; mov di, 0h
LHS:	mov 	cx, 46d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 1d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 61d
        jne 	LHS

        ;Línea horizontal superior duplicada uno
        xor 	di, di   ; mov di, 0h
LHSDu:	mov 	cx, 46d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 8d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 27d
        jne 	LHSDu

        ;Línea horizontal superior duplicada dos
        xor 	di, di   ; mov di, 0h
LHSDd:	mov 	cx, 80d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 8d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 28d
        jne 	LHSDd

;Línea vertical cierre de ---
        xor 	di, di   ; mov di, 0h
LupiV:	mov 	cx, 46d ; Columna 
        mov	    dx, 1d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 7d
        jne 	LupiV

;Línea vertical cierre de DUPLI---
        xor 	di, di   ; mov di, 0h
LupiVD:	mov 	cx, 107d ; Columna 
        mov	    dx, 1d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 7d
        jne 	LupiVD

;Inicio del cuerpo de la letra J
        ;Línea vertical jota
        xor 	di, di   ; mov di, 0h
LVJ:	mov 	cx, 73d ; Columna 
        mov	    dx, 8d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 70d
        jne 	LVJ

        ;Línea vertical jota duplicada
        xor 	di, di   ;PONER EN CERO DI
LVJD:	mov 	cx, 80d ; Columna 
        mov	    dx, 8d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 78d
        jne 	LVJD

;Las horizontales inferiores
        ;Línea horizontal inferior
        xor 	di, di   ;PONER EN CERO DI
LHI:	mov 	cx, 43d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 77d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 30d
        jne 	LHI

        ;Línea horizontal inferior duplicada
        xor 	di, di   ;PONER EN CERO DI
LHID:	mov 	cx, 36d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 85d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 44d
        jne 	LHID

;Tres últimas líneas, gancho de la jota
        ;Verticales de gancho

        xor 	di, di   ;PONER EN CERO DI
LVG:	mov 	cx, 36d ; Columna 
        mov	    dx, 70d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 15d
        jne 	LVG

        xor 	di, di   ;PONER EN CERO DI
LVGD:	mov 	cx, 43d ; Columna 
        mov	    dx, 70d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 8d
        jne 	LVGD

        ;Línea horizontal de gancho, cierre

        xor 	di, di   ;PONER EN CERO DI
LHG:	mov 	cx, 36d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 70d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 7d
        jne 	LHG

        call 	kb		; Utilizamos espera de alguna tecla

        int 	20h

grafico:mov	    ah, 00h
        mov	    al, 13h
        int 	10h
        ret

pixel:	mov	    ah, 0Ch
        mov	    al, 1100b
        int 	10h
        ret

kb: 	mov	    ah, 00h
        int 	16h
        ret

section .data