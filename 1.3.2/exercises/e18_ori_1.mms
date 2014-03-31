    PREFIX :Saddle:
t   IS      $255
a00 IS      $0
a10 IS      $1
ij  IS      $2
j   GREG    0
k   GREG    0
x   GREG    0
y   GREG    0

:Saddle     SET     ij,9*8
RowMin      SET     j,8
            LDB     x,a10,ij
2H          SET     k,0
4H          INCL    k,1
            STB     j,a00,k
1H          SUB     ij,ij,1
            SUB     j,j,1
            BZ      j,ColMax
3H          LDB     y,a10,ij
            SUB     t,x,y
            PBN     t,1B
            SET     x,y
            PBP     t,2B
            JMP     4B
ColMax      LDB     $3,a00,k
            ADD     j,$3,9*8-8
1H          LDB     y,a10,j
            CMP     t,x,y
            PBN     t,No
            SUB     j,j,8
            PBP     j,1B
Yes         ADD     ij,ij,$3
            ADD     ij,a10,ij
            SET     $0,ij
            POP     1,0
No          SUB     k,k,1
            BP      k,ColMax
            PBP     ij,RowMin
            SET     $0,ij
            POP     1,0
    PREFIX :
