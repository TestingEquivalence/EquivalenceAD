source("testStatistic.R")
source("asymptoticTest.R")
source("simulation/power.R")
source("asymptoticTestBootstrapVariance.R")
source("empiricalBootstrapTest.R")
source("BootstrapTestTPercentile.R")
source("distributions/alternatives.R")

pointNr=9
lsCDF=listCDF()
lsR=listRDG()

H<-function(x){
  x
}

G<-function(x){
  lsCDF[[pointNr]](x)
}

dst=theoreticCMDistance(H,G)
dst$value
dst

rDistribution<-function(n){
  lsR[[pointNr]](n)
}


for (n in c(50,100,200,500,1000)){
  parameter=list()
  parameter$F=H
  parameter$alpha=0.05
  parameter$n=n
  parameter$nSimulation=1000
  
  nSimulation=1000
  
  res=simulatePower(empiricalBootstrapTest, parameter, nSimulation, rDistribution)
  fn=paste0("power_EB_",pointNr,"_n_",parameter$n,".csv")
  write.csv(res,fn)
}
 