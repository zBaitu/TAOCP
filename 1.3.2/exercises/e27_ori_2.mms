    PREFIX :Fib:
t IS $0
n IS $1
new GREG
old GREG
phii GREG #9e3779b97f4a7c16
lo GREG
hi GREG
hihi GREG
:Fib SET n,2
     SET old,1
     SET new,1
1H   ADDU new,new,old
     INCL n,1
     CMPU t,new,old
     BN   t,9F
     SUBU old,new,old
     MULU lo,old,phii
     GET hi,:rH
     ADDU hi,hi,old
     ADDU hihi,hi,1
     CSN hi,lo,hihi
     CMP t,hi,new
     PBZ  t,1B
     SET  t,1
9H   POP    2,0
    PREFIX :
