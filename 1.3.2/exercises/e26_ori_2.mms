* Cryptanalysis Problem (CLASSIFIED) (pipelined, superscalar)
    PREFIX :Crypto:
p IS $0
freq IS $1
freqq IS $2
a GREG
b GREG
bb GREG
bbb GREG
bbbb GREG
c GREG
cc GREG
t GREG
x GREG
y GREG
ones   GREG #0101010101010101
:Crypto  LDOU a,p,0
       INCL p,8
       BDIF t,ones,a
       SLU  bb,a,8
       BNZ  t,3F        Do main loop, unless near the end.
2H     SRU  b,a,53
       SRU  bb,bb,53
       LDO  c,freq,b
       LDO  cc,freqq,bb
       SLU  bbb,a,16
       SLU  bbbb,a,24
       INCL c,1
       INCL cc,1
       SRU  bbb,bbb,53
       SRU  bbbb,bbbb,53
       STO  c,freq,b
       STO  cc,freqq,bb
       LDO  c,freq,bbb
       LDO  cc,freqq,bbbb
       SLU  b,a,32
       SLU  bb,a,40
       INCL c,1
       INCL cc,1
       SRU  b,b,53
       SRU  bb,bb,53
       STO  c,freq,bbb
       STO  cc,freqq,bbbb
       LDO  c,freq,b
       LDO  cc,freqq,bb
       SLU  bbb,a,48
       SLU  bbbb,a,56
       INCL c,1
       INCL cc,1
       SRU  bbb,bbb,53
       SRU  bbbb,bbbb,53
       STO  c,freq,b
       STO  cc,freqq,bb
       LDO  c,freq,bbb
       LDO  cc,freqq,bbbb
       LDOU a,p,0
       INCL p,8
       INCL c,1
       INCL cc,1
       BDIF t,ones,a
       SLU  bb,a,8
       STO  c,freq,bbb
       STO  cc,freqq,bbbb
       PBZ  t,2B
3H     SRU  b,a,53
       LDO  c,freq,b
       INCL c,1
       STO  c,freq,b
       SRU  b,b,3
       SLU  a,a,8
       PBNZ b,3B
       SET  p,8*255
4H     LDO  c,freq,p
       LDO  cc,freqq,p
       ADD  c,c,cc
       STO  c,freq,p  
       SUB  p,p,8
       PBP  p,4B
       POP
