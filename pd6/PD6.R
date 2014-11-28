library(gsDesign)
library(pwr)
library(Hmisc)

### ZAD1

nBinomial(p1=0.45,p2=0.3,alpha=0.05,n=200,outtype=2,sided=2)
bpower(0.45,0.3,n=200,n1=100,n2=100,alpha=0.05) # pakiet Hmisc, daje podobna moc

# pwr.chisq.test(w =, N = , df = , sig.level =, power = ) 
# pwr.chisq.test(w,N=200,df=1,sig.level=0.05)
# w <- sqrt(0.15^2/0.3)

betki <- seq(0.01,0.975,by=0.01)
nki <- numeric(length(betki))
for(i in seq_along(betki)){
  nki[i] <-nBinomial(0.45,0.3,alpha=0.05,sided=2,beta=betki[i])
}
plot(1-betki~nki,type='l')


### ZAD 2
var <- function(x){6.5^2*sqrt(x)} 
var(52) # wariancja w 52 tyg

dif <- 15-qnorm(0.55)*sqrt(var(52)) -(15-qnorm(0.7)*sqrt(var(52)))

nNormal(delta1=dif,delta0=0,n=200,alpha=0.05,side=2,sd=sqrt(var(52)),ratio=1,outtype=2) 
# rownowazne hipotezy, a test dla srednich ma duza wieksza moc niz chi^2

sigma <- sqrt(var(52)*(1/100+1/100)) # sigma efektu

beta <- pnorm(qnorm(1-0.05/2),dif/sigma)-pnorm(qnorm(0.05/2),dif/sigma) 
(1-beta) # zgadza sie z nNormal (wow!)

### ZAD 3

var(26)
dif <- 15-qnorm(0.55)*sqrt(var(52)) -(15-qnorm(0.7)*sqrt(var(52)))
nNormal(delta1=dif/2,delta0=0,n=200,alpha=0.05,side=2,sd=sqrt(var(26)),ratio=1,outtype=2) # dziwnee


### ZAD 4

(dif <- 15-qnorm(0.55)*sqrt(var(26)) - 6.6) 
nNormal(delta1=dif,delta0=0,n=200,alpha=0.05,side=2,sd=sqrt(var(26)),ratio=1,outtype=2) # dziwnee

### ZAD 5


# rANOVA


### ZAD 6

var(52) # wariancja w 52 tyg
(dif <- 15-qnorm(0.55)*sqrt(var(52)) -(15-qnorm(0.7)*sqrt(var(52))))

#nNormal(delta0=-dif,delta1=0,sd=sqrt(var(52)),alpha=0.05,beta=0.2,outtype=2)

nNormal(delta1=0,delta0=-dif,sd=sqrt(var(52)),alpha=0.05,beta=0.2,outtype=2)


2*(qnorm(0.8)+qnorm(0.95))^2/(dif/sqrt(var(52)))^2 # reczne sprawdzenie, OK

### ZAD 7

nNormal(delta0=-5,delta1=0,sd=sqrt(var(52)),alpha=0.05,beta=0.2,outtype=2)
2*(qnorm(0.8)+qnorm(0.95))^2/(5/sqrt(var(52)))^2 # reczne sprawdzenie, OK

### ZAD 8

nNormal(delta0=-dif,delta1=0,sd=sqrt(var(52)),alpha=0.05,beta=0.2,outtype=2,ratio=1/2)
n <- 3*(qnorm(0.8)+qnorm(0.95))^2/(dif/sqrt(var(52)))^2 # reczne sprawdzenie, OK
c(n,0.5*n)


### ZAD 9

nNormal(delta0=-5,delta1=-2,sd=sqrt(var(52)),alpha=0.05,beta=0.2,outtype=2)
n <- 2*(qnorm(0.8)+qnorm(0.95))^2/((-2+5)/sqrt(var(52)))^2

### ZAD 10

nNormal(delta0=-5,delta1=3,sd=sqrt(var(52)),alpha=0.05,beta=0.2,outtype=2)
n <- 2*(qnorm(0.8)+qnorm(0.95))^2/((3+5)/sqrt(var(52)))^2
