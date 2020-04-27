;Tarea 1: 3+4+7+1+5 = 20
;promedio: 20/5 = 4 --> "me recupero"

        org     100h

        mov     ax, 554Fh
        mov     [200h], ax;

        int     20h
