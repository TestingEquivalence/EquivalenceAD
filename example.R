source("testStatistic.R")
source("asymptoticTest.R")
source("asymptoticTestBootstrapVariance.R")
source("BootstrapTestTPercentile.R")
source("simulation/power.R")

# Application of the equivalence test to the uniform distribution on [0,1],
# i.e. we compare the true underlying distribution of the random sample
# with the uniform distribution on [0, 1].
# Instead of the uniform distribution you can apply the test 
# to compare with any other fixed distribution similarly.

# Cumulative distribution function (CDF) of the uniform distribution on [0,1]. 
F<-function(x){
  x
}

# Parameter of the equivalence test:
parameter=list()
parameter$F=F # CDF of uniform distribution on [0,1]
parameter$alpha=0.05 # significance level of the test
parameter$nSimulation=1000 # number of samples in case of bootstrap test

# First we apply the equivalence test to the random sample from the uniform distribution. 
# Simulate a sample from the uniform distribution on [0,1].

set.seed(30122023)
n=100 # number of observations in sample
parameter$x=runif(n) # random numbers from the uniform distribution

# Apply 3 variants of the equivalence test. 
# Each test version return the minimum value of the tolerance parameter epsilon,
# for which H0={d(F,G)>epsilon} can be rejected at the given significance level.
# d(F,G) denotes the Anderson-Darling distance between the CDF F and G.
asymptoticTest(parameter) # asymptotic test
asymptoticTestBootstrapVariance(parameter) # asymptotic test with bootstrapped variance 
tPercentileBootstrapTest(parameter) # t-percentile  bootstrap test. It takes a bit longer! 

# Next we apply the equivalence test to an alternative distribution.
# We consider the beta(p,q) distribution.
# You can vary the parameters of the beta distribution to get different results.

# Parameters of the beta distribution:
p=0.5
q=0.5

# The Anderson-Darling distance between uniform distribution and beta(p, q) is:

Q<-function(x){
  pbeta(x,p,q)
}

theoreticADDistance(F, Q)

# Simulate a sample from the beta(p,q)
set.seed(30122023)
parameter$x=rbeta(n,p,q)

# Perform 3 variants of the equivalence test: 
 
asymptoticTest(parameter) # asymptotic test
asymptoticTestBootstrapVariance(parameter) # asymptotic test with bootstrapped variance 
tPercentileBootstrapTest(parameter) # t-percentile  bootstrap test. It takes a bit longer! 

