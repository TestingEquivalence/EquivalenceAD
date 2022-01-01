source("testStatistic.R")
library(pracma)

#check test statistic
set.seed(18032021)
n=100
res=runif(n)

F<-function(x){
  x
}

testStatistic1<-function(U){
  f=ecdf(U)
  n=length(U)
  ff<-function(x){
    (f(x)-x)^2/(x*(1-x))
  }
  integrate(ff,0,1, subdivisions = n*100)
}

res=uTransform(res,F)
testStatisticAD(res)
testStatistic1(res)




