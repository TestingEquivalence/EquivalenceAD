source("testStatistic.R")
source("asymptoticTest.R")
source("simulation/power.R")
source("asymptoticTestBootstrapVariance.R")
source("empiricalBootstrapTest.R")
source("BootstrapTestTPercentile.R")
source("distributions/alternatives.R")
source("distributions/mixedDistribution.R")

#1:27
for (pointNr in c(10)){
  
  
  epsilon=0.05
  n=100
  
  lsCDF=listCDF()
  lsR=listRDG()
  
  G<-function(x){
    x
  }
  
  H<-function(x){
    lsCDF[[pointNr]](x)
  }
  
  #check the point
  dst=theoreticADDistance(H,G)
  if (dst$value<epsilon) {next}
  
  #find mixed boundary point
  w=boundaryPoint(epsilon, H)
  
  #check the boundary point
  mixedF<-function(x){
    pMixed(x,w,H,G)
  }
  
  check=theoreticADDistance(mixedF,G)$value
  
  #define generator for the boundary point
  rDistribution<-function(x){
    rMixed(n,w,lsR[[pointNr]],runif)
  }
  
  parameter=list()
  parameter$F=G
  parameter$alpha=0.05
  parameter$n=n
  parameter$nSimulation=1000
  
  nSimulation=1000
  
  res=simulatePower(tPercentileBootstrapTest, parameter, nSimulation, rDistribution)
  fn=paste0("power_AT_",pointNr,"_n_",parameter$n,".csv")
  write.csv(res,fn)
}

 