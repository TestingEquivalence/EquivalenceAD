source("testStatistic.R")
source("asymptoticTest.R")
source("simulation/size.R")
source("asymptoticTestBootstrapVariance.R")
source("empiricalBootstrapTest.R")
source("BootstrapTestTPercentile.R")

F<-function(x){
  x
}

parameter=list()
parameter$F=F
parameter$alpha=0.05
parameter$n=100
parameter$nSimulation=1000

nSimulation=1000

res=simulatePowerAtUniform(tPercentileBootstrapTest, parameter, nSimulation)
fn=paste0("size_as_",parameter$n,".csv")
write.csv(res,fn)
