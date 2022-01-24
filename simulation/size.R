
simulatePowerAtUniform<-function(test, parameter, nSimulation){
  set.seed(10071977)
  
  sim=list()
  for (i in c(1:nSimulation)){
    sim[[i]]=runif(parameter$n)
  }
  
  res=rep(0,nSimulation)
  for (i in c(1:nSimulation)){
    parameter$x=sim[[i]]
    res[i]=test(parameter)
    print(i)
  }

  return(res)
}
