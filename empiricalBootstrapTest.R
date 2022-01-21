empiricalBootstrapTest<-function(parameter){
  U=uTransform(parameter$x, parameter$F)
  distance=testStatisticAD(U)
  
  #calculate bootstrap distribution
  t.fun<-function(dat,ind){
    x=dat[ind]
    x=sort(x)
    return(testStatisticAD(x))
  }
  
  res=boot(U,t.fun,R=parameter$nSimulation)
  
  #calculate quantile of bootstrap distribution
  qt=quantile(res$t,parameter$alpha,type=1)
  min_eps=-qt+2*distance
  return(min_eps)
}