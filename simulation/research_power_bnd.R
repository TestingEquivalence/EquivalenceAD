source("testStatistic.R")
source("asymptoticTest.R")
source("simulation/power.R")
source("asymptoticTestBootstrapVariance.R")
source("empiricalBootstrapTest.R")
source("BootstrapTestTPercentile.R")
source("distributions/alternatives.R")
source("distributions/mixedDistribution.R")

pointNr=2
epsilon=0.02
n=50

lsCDF=listCDF()
lsR=listRDG()

H<-function(x){
  x
}

G<-function(x){
  lsCDF[[pointNr]](x)
}

#find mixed boundary point
w=boundaryPoint(epsilon, G)

#check the boundary point
mixedF<-function(x){
  pMixed(x,w,H,G)
}

theoreticCMDistance(H,mixedF)

#define generator for the boundary point
rDistribution<-function(x){
  rMixed(n,w,runif,lsR[[pointNr]])
}

parameter=list()
parameter$F=H
parameter$alpha=0.05
parameter$n=n
parameter$nSimulation=1000
  
nSimulation=1000
  
res=simulatePower(asymptoticTestBootstrapVariance, parameter, nSimulation, rDistribution)
fn=paste0("power_ABV_",pointNr,"_n_",parameter$n,".csv")
write.csv(res,fn)

 