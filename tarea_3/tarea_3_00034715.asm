	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
        call    fraseDos
        call    fraseTres
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
        mov	al, 03h
        int 	10h
        ret

cursor: mov     ah, 01h
        mov 	ch, 00000000b
        mov 	cl, 00001111b
        int 	10h
        ret

w_char:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, 00001111b
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
lupiT:	mov 	cl, [msgT+di-7d]
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, lenT
        jb	lupiT
        ret

section .data
msg	db 	"Seteo en primera columna y fila uno"
len 	equ	$-msg+0d

msgD	db 	"Segundo Mensaje"
lenD 	equ	$-msgD+15d

msgT	db 	"Tercer mensaje"
lenT 	equ	$-msgT+7d