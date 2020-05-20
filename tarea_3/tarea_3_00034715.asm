	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
        call    fraseDos
        call    fraseTres
        call    fraseCuatro
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
        mov	al, 03h
        int 	10h
        ret

cursor: mov     ah, 01h
        mov 	ch, 00000000b
        mov 	cl, 00001110b
        int 	10h
        ret

w_char:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, [210h+si]
        mov 	cx, 1h
        int 	10h
        ret

kbwait: mov 	ax, 0000h
        int 	16h
        ret

m_cursr:mov 	ah, 02h
        mov 	dx, di  ; columna
        ;ADD     si, 1d
        ;mov     [205h], si
        ;mov 	dh, [si+200h]; fila que le asigné en cada rutina para cada frase
        mov     dh, [200h+si]
        mov 	bh, 0h
        int 	10h
        ret

phrase:	mov 	di, 0d
        mov     cl, 0d ;La fila donde quiero comenzar
        mov     si, 0d ;puntero que servirá para buscar el valor almacenado en una memoria de 200 y que mantendrá la escritura allí
        mov     [200h], cl ;Asigno la fila de inicio a esa celda
        ;Para darle color a cada frase la misma lógica:
        mov     cl, 00001001b   ;Agrego el color
        mov     [210h], cl      ;Lo mando a un espacio de memoria
lupi:	mov 	cl, [msg+di-0d]
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, len
        jb	lupi
        ret

fraseDos:	mov 	di, 15d
                mov     cl, 5d ;La fila donde quiero comenzar
                mov     si, 1d ;puntero que servirá para buscar el valor almacenado en una memoria de 200 y que mantendrá la escritura allí
                mov     [201h], cl ;Asigno la fila de inicio a esa celda
                ;Para darle color a cada frase la misma lógica:
                mov     cl, 00001100b   ;Agrego el color
                mov     [211h], cl      ;Lo mando a un espacio de memoria
lupiD:	mov 	cl, [msgD+di-15d]
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, lenD
        jb	lupiD
        ret

fraseTres:	mov 	di, 7d
                mov     cl, 11d ;La fila donde quiero comenzar
                mov     si, 2d ;puntero que servirá para buscar el valor almacenado en una memoria de 200 y que mantendrá la escritura allí
                mov     [202h], cl ;Asigno la fila de inicio a esa celda
                ;Para darle color a cada frase la misma lógica:
                mov     cl, 00001110b   ;Agrego el color
                mov     [212h], cl      ;Lo mando a un espacio de memoria
lupiT:	mov 	cl, [msgT+di-7d]
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, lenT
        jb	lupiT
        ret

fraseCuatro:	mov 	di, 11d
                mov     cl, 20d ;La fila donde quiero comenzar
                mov     si, 3d ;puntero que servirá para buscar el valor almacenado en una memoria de 200 y que mantendrá la escritura allí
                mov     [203h], cl ;Asigno la fila de inicio a esa celda
                ;Para darle color a cada frase la misma lógica:
                mov     cl, 00000011b   ;Agrego el color CIAN
                mov     [213h], cl      ;Lo mando a un espacio de memoria
lupiC:	mov 	cl, [msgC+di-11d]
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, lenC
        jb	lupiC
        ret

section .data
msg	db 	"Buenas buenaaas, quisiera una camiseta de un personaje inspirador" ;No sé porque no escribe todo el mensaje
                ;creo que ya es muy problema de dosbox
len 	equ	$-msg+0d

msgD	db 	"Gandhi?"
lenD 	equ	$-msgD+15d

msgT	db 	"No, Mediani :v"
lenT 	equ	$-msgT+7d

msgC	db 	"Merezco diez por intentarlo, heeey :c"
lenC 	equ	$-msgC+11d