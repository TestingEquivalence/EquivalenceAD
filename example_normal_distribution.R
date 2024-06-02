source("testStatistic.R")
source("asymptoticTest.R")
source("asymptoticTestBootstrapVariance.R")
source("BootstrapTestTPercentile.R")

  
# Example of testing equivalence to the standard normal distribution

# CDF of the standard normal distribution
F<-function(x){
  pnorm(x,mean=0, sd=1)
}

# Version 1 : mean of variance of sample distribution are known to be 0 and 1. 

parameter=list() # a list named parameter, this will store parameters of the equivalence test
parameter$F=F # theoretical distribution, G in the paper
parameter$alpha=0.05 # significance level of the test
parameter$nSimulation=1000 # number of samples in case of bootstrap test

n=100 # number of observations in sample
parameter$x=rnorm(n) # generates a random sample of size n from standard normal distribution
asymptoticTest(parameter)

# Version 2. mean and variance of sample distribution is unknown.

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

# Version 3. mean and variance of sample distribution is unknown.

# We split the data into two subsamples. 
# The mean and sd of the normal distribution are estimated using the first subsample. 
# The estimated values can then be used to test the second part of the data against the normal distribution,
# whose parameters are the estimated mean and standard deviation.
# This version is perfectly correct from a theoretical point of view, because conditional on the estimated parameter, we are testing against a fully specified normal distribution.


n=200 # number of observations in sample
x=rnorm(n, -5, 10) # generates a random sample of size n from some not standard normal distribution

# split the data
x1=x[1:100]
x2=x[101:200]

# estimate the parameter using first subset
mu=mean(x1)
sigma=sd(x1)

#normalize the second subset using mu and sigma

x2=(x2-mu)/sigma
mean(x2)
sd(x2)

parameter=list() # a list named parameter, this will store parameters of the equivalence test
parameter$F=F # theoretical distribution, G in the paper
parameter$alpha=0.05 # significance level of the test
parameter$nSimulation=1000 # number of samples in case of bootstrap test
parameter$x=x2 # data sample

asymptoticTest(parameter)
