library('gsDesign')

### ZAD 1
help(package='gsDesign')

#a
n <- nNormal(delta1=5,sd=17,alpha=0.05,beta=0.1,sided=2)
(x <- gsDesign(k=3,test.type=2,alpha=0.05,n.fix=ceiling(n),beta=0.1,sfu='OF'))
1-pnorm(2.09)

#b
n <- nNormal(delta1=5,sd=17,alpha=0.05,beta=0.1,sided=2)
(x <- gsDesign(k=3,test.type=2,alpha=0.05,n.fix=ceiling(n),beta=0.1,sfu='Pocock'))
plot(x)
1-pnorm(1.99)

#c
n <- nNormal(delta1=5,sd=17,alpha=0.05,beta=0.1,sided=2)
(x <- gsDesign(k=3,test.type=2,alpha=0.05,n.fix=ceiling(n),beta=0.1,sfu='WT',sfupar=0.2))
plot(x)

theta <- seq(0,2,by=0.5)
x$upper$bound[2]
x$n.I[2]

delta <- sapply(theta, function(theta){
  x <- gsDesign(k=3,test.type=2,alpha=0.05,
                n.fix=ceiling(n),beta=0.1,sfu='WT',sfupar=theta)
  x$upper$bound[2]*sqrt(4)*17/sqrt(x$n.I[2])
})

plot(theta, delta,type='l')
theta[which(delta>5)]
# theta =2.5

gsDesign(k=3,test.type=2,alpha=0.05,
         n.fix=ceiling(n),beta=0.1,sfu='WT',sfupar=1)


### ZAD 2

### ZAD 3 

n <- nNormal(delta1=5,sd=17,alpha=0.05,beta=0.1,sided=2)
(x <- gsDesign(k=3,test.type=3,alpha=0.05,n.fix=ceiling(n),beta=0.1))
plot(x,plottype=8)
