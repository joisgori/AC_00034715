;Tarea 1: 3+4+7+1+5 = 20
;promedio: 20/5 = 4 --> "me recupero"

        org     100h

        mov     ax, 3d
        mov     bx, 4d
        ADD     ax, bx
        mov     bx, 7d
        ADD     ax, bx
        mov     bx, 1d
        ADD     ax, bx
        mov     bx, 5d
        ADD     ax, bx
        mov     bx, 5d
        div     bx ;entiendo yo que esto va a dividir a al

        mov     [200h], al ;entiendo que debe poner 4 en la celda esa
        mov     cl, "m"
        mov     [202h], cl
        mov     cl, "e"
        mov     [203h], cl

        mov     cl, "r"
        mov     [205h], cl
        mov     cl, "e"
        mov     [206h], cl
        mov     cl, "c"
        mov     [207h], cl
        mov     cl, "u"
        mov     [208h], cl
        mov     cl, "p"
        mov     [209h], cl
        mov     cl, "e"
        mov     [20Ah], cl
        mov     cl, "r"
        mov     [20Bh], cl
        mov     cl, "o"
        mov     [20Ch], cl

        int     20h
