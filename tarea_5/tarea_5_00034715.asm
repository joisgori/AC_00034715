org 	100h

section .text

        call 	grafico	; Llamada a iniciar modo grafico 13h

	    xor 	di, di   ; mov di, 0h
lupi:	mov 	cx, 2d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 1d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 100d
        jne 	lupi

        xor 	di, di   ; mov di, 0h
lupi2:	mov 	cx, 2d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 3d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 100d
        jne 	lupi2

        xor 	di, di   ; mov di, 0h
lupi3:	mov 	cx, 48d ; Columna 
        mov	    dx, 3d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 75d
        jne 	lupi3

        xor 	di, di   ;PONER EN CERO DI
lupi4:	mov 	cx, 50d ; Columna 
        mov	    dx, 3d ; Fila
        add	    dx, di	 ; Offset
        call 	pixel
        inc 	di
        cmp 	di, 80d
        jne 	lupi4

;OTRAS DOS HORIZONTALES
        xor 	di, di   ;PONER EN CERO DI
lupi5:	mov 	cx, 18d ; Columna 
        add	    cx, di	 ; Offset
        mov	    dx, 77d ; Fila
        call 	pixel
        inc 	di
        cmp 	di, 30d
        jne 	lupi5


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