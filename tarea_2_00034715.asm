;Tarea 1: 3+4+7+1+5 = 20
;promedio: 20/5 = 4 --> "me recupero"

        org     100h

        mov     al, 3h
        mov     bl, 4h
        ADD     al, bl
        mov     bl, 7h
        ADD     al, bl
        mov     bl, 1h
        ADD     al, bl
        mov     bl, 5h
        ADD     al, bl

        ;mov     [200h], ax;

        int     20h
