library(boot)

bootstrapVolatility<-function(U,nSimulation){
  #calculate bootstrap volatility
  vol.fun<-function(dat,ind){
    x=dat[ind]
    x=sort(x)
    return(testStatisticAD(x))
  }
  
  res=boot(U,vol.fun,R=nSimulation)
 
  return(sd(res$t))
}

asymptoticTestBootstrapVariance<-function(parameter){
  U=uTransform(parameter$x, parameter$F)
  distance=testStatisticAD(U)
  
  n=length(U)
  vol = bootstrapVolatility(U,parameter$nSimulation)
  qt=qnorm(1-parameter$alpha,0,1)
  
  min_eps = distance + qt*vol
  return(min_eps)
}
