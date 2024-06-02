source("testStatistic.R")
source("asymptoticTest.R")
source("asymptoticTestBootstrapVariance.R")
source("BootstrapTestTPercentile.R")

  
# Example of testing equivalence to the standard normal distribution

# CDF of the standard normal distribution
F<-function(x){
  pnorm(x,mean=0, sd=1)
}

# Version 1 : mean of variance of sample distribution are known to be 0 and 1 

parameter=list() # a list named parameter, this will store parameters of the equivalence test
parameter$F=F # theoretical distribution, G in the paper
parameter$alpha=0.05 # significance level of the test
parameter$nSimulation=1000 # number of samples in case of bootstrap test

n=100 # number of observations in sample
parameter$x=rnorm(n) # generates a random sample of size n from standard normal distribution
asymptoticTest(parameter)

# Version 2. mean and variance of sample distribution is unknown
# This version is not completely correct from a theoretical point of view,
# because the normalization of the data sample introduces some dependence between observations. 
# Therefore, the assumption of identically independent observations is no longer correct.  
# However, the dependence is negligible for large sample sizes.

n=100 # number of observations in sample
x=rnorm(n, -5, 10) # generates a random sample of size n from some not standard normal distribution

#normalize the data sample
x=x-mean(x)
x=x/sd(x)

mean(x)
sd(x)

parameter=list() # a list named parameter, this will store parameters of the equivalence test
parameter$F=F # theoretical distribution, G in the paper
parameter$alpha=0.05 # significance level of the test
parameter$nSimulation=1000 # number of samples in case of bootstrap test
parameter$x=x # data sample

asymptoticTest(parameter)


