    PREFIX :saddle:
t   IS      $255
a00 IS      $0
a10 IS      $1
a20 IS      $2
ij  GREG    0
ii  GREG    0
j   GREG    0
x   GREG    0
y   GREG    0
z   GREG    0
ans IS      $3

:Saddle SET     j,8
        SET     z,1000
3H      ADD     ij,j,9*8-2*8
        LDB     x,a20,ij
1H      LDB     y,a10,ij
        CMP     t,x,y
        CSN     x,t,y
2H      SUB     ij,ij,8
        PBP     ij,1B
        STB     x,a10,ij
        CMP     t,x,z
        CSN     z,t,x
        SUB     j,j,1
        PBP     j,3B
Phase2  SET     ii,9*8-8
3H      ADD     ij,ii,8
        SET     j,8
1H      LDB     x,a10,ij
        SUB     t,z,x
        PBP     t,No
        PBN     t,2F
        LDB     x,a00,j
        CMP     t,x,z
        CSZ     ans,t,ij
2H      SUB     j,j,1
        SUB     ij,ij,1
        PBP     j,1B
        LDA     ans,a10,ans
        SET     $0,ans
        POP     1,0
No      SUB     ii,ii,8
        PBNN    ii,3B
        SET     ans,0
        SET     $0,ans
        POP     1,0
