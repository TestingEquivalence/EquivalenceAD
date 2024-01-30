<<<<<<< HEAD
This project belongs to a published article:

Vladimir Ostrovski,
Equivalence tests based on weighted L2- distance between cumulative distribution functions.
Journal of Statistics and Computer Science
Vol. 2, No. 2, 2023, pp. 147-159
© ARF India. All Right Reserved
open acces to article under:
URL : https://www.arfjournals.com/statistics/jscs
https://doi.org/10.47509/JSCS.2023.v02i02.06

A preprint is available under:
???

Abstract:
We introduce a new family of equivalence tests for a fully specified continuous distribution on the real line. 
The tests are based on the weighted L_2-distance between cumulative distribution functions. 
The asymptotic distribution of the test statistic is derived using the functional delta method. 
The local asymptotic optimality of the proposed tests is shown. 
An easy-to-compute estimator for the asymptotic variance of the test statistic is provided. 
The tests can be carried out using the asymptotic approximation or the percentile-t bootstrap method. 
For the special case of the Anderson-Darling distance, a comprehensive simulation study of finite sample properties is performed. 
A practical method of finding appropriate values for the tolerance parameter is given.

Keywords: equivalence test, Cramér-von Mises distance, Anderson-Darling distance, uniformity test, weighted CDF


How to start:
start with examples in example.R

Introduction:
Let G be CDF (cumulative density function) of some distribution on the real line.
We observe a sample of n independent identically distributed random numbers, which true underlying CDF is F. 

Let d(F,G) denote the weighted L_2-distance between cumulative distribution functions F and G. 
Then the equivalence test problem is defined by
H0={d(F,G)>epsilon} versus H1={d(F,G)<=epsilon}
for a tolerance parameter epsilon>0.

If the hypothesis H0 can be rejected based on the observed data only for 
a sufficiently small value of epsilon, then the true 
underlying distribution F is close to the given distribution G. 

This code provides a significance test for the equivalence tests problem,
called  equivalence test. Three variants of the equivalence test are given:
- asymptotic test, where the critical value is computed using the asymptotic approximation;
- asymptotic test where the variance of the test statistic is estimated by bootstrap;
- percentile-t bootstrap test, where the critical value is computed by percentile-t bootstrap method.





=======
# EquivalenceNormalAD
testing equivalence to uniform distribution using Andersen Darling statistic
>>>>>>> bfe65a7312816b0a96443f3e82cda8dd48c46225
