a=c("sun","mon","tue","wed","thur","fri")
b=c("fri","sat","sun","mon","wed")
m=match(a,b)
match(b,a)

m
is.na(m)

!is.na(m)
sum(!is.na(m))
