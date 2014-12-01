
x <- gsDesign(k=3,test.type=2,alpha=0.05,
              n.fix=ceiling(n),beta=0.1,sfu='WT',sfupar=0.4)
y <- cbind(x$n.I,x$upper$bound, 1-pnorm(x$upper$bound), x$upper$spend )

y <- as.data.frame(y)
names(y) <- c("n", "Z", "Nominal p", "spend")

library(xtable)
xtable(y, digits=3)


