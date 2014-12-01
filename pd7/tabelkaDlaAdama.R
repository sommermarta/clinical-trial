
x <- gsDesign(k=3,test.type=2,alpha=0.05,
              n.fix=ceiling(n),beta=0.1,sfu='WT',sfupar=0.4)
y <- cbind(x$n.I,x[19]$upper$bound, x[19]$upper$prob)

y <- as.data.frame(y)
names(y) <- c("n", "Z", "Nominal p", "spend")

library(xtable)
xtable(y)
