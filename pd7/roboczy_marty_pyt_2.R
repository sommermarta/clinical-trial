
n <- nNormal(delta1=5,sd=17,alpha=0.05,beta=0.1,sided=1)

(x <- gsDesign(k=3,test.type=2,alpha=0.05,beta=0.1,sfu='OF'))

n <- ceiling(n)
n
po_jakim_czasie_50_8 <- ceiling((n/2)/8)
po_jakim_czasie_50_8
po_jakim_czasie_75_8 <- ceiling((3*n/4)/8)
po_jakim_czasie_75_8
po_jakim_czasie_100_8 <- ceiling(n/8)
po_jakim_czasie_100_8  

po_jakim_czasie_50_20 <- ceiling((n/2)/20)
po_jakim_czasie_50_20
po_jakim_czasie_75_20 <- ceiling((3*n/4)/20)
po_jakim_czasie_75_20
po_jakim_czasie_100_20 <- ceiling(n/20)
po_jakim_czasie_100_20  

time <- c(0.5,0.75,1)
time

x <- gsDesign(k=3,test.type=1,alpha=0.05,beta=0.1,sfu='OF', timing=time)
x
names(print.gsDesign)
x$n.I

x <- gsDesign(k=3,test.type=1,alpha=0.05,beta=0.1,sfu='OF')
x


