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


x$upper$bound[2]
x$n.I[2]


theta <- seq(0,0.5,by=0.01)
delta <- sapply(theta, function(theta){
   x <- gsDesign(k=3,test.type=2,alpha=0.05,
                 n.fix=ceiling(n),beta=0.1,sfu='WT',sfupar=theta)
   x$upper$bound[2]*sqrt(2)*34/sqrt(x$n.I[2])
})
wykres <- data.frame(theta = theta, delta = delta)
library(ggplot2)
library(ggthemes)
ggplot(wykres, aes(x = theta, y = delta)) + geom_smooth(lwd=2)+
   geom_hline(yintercept=5, col = "orange", lwd=2)+
   geom_vline(xintercept=0.4, col = "red", lwd=2)+
   theme_bw(base_family="serif", base_size=20)


plot(theta, delta,type='l')
abline(a=5,b=0, "red")
theta[which(delta>5)]
# theta =2.5

gsDesign(k=3,test.type=2,alpha=0.05,
         n.fix=ceiling(n),beta=0.1,sfu='WT',sfupar=0.4)


### ZAD 2

### ZAD 3 

n <- nNormal(delta1=5,sd=17,alpha=0.05,beta=0.1,sided=2)
(x <- gsDesign(k=3,test.type=3,alpha=0.05,n.fix=ceiling(n),beta=0.1))
plot(x,plottype=8)
