upf<-function(k,n,s){
  (k/n)*log(s/(1-s))+log(1-s)
}

pf<-function(k,n,U){
  if (k==0){
    return(log(1-U[1]))
  }
  
  if (k==n){
    return(-log(U[n]))
  }
  
  (k/n)*log(U[k+1]*(1-U[k])/(U[k]*(1-U[k+1])))+log((1-U[k+1])/(1-U[k]))  
}

asymptoticVariance<-function(U){
  r=0
  n=length(U)
  
  for (k in c(0:n)){
    p2=pf(k,n,U)
    for (l in c(0:n)){
      p1=min(k,l)/n-k*l/(n^2)
      p3=pf(l,n,U)
        
      r=r+p1*p2*p3
    }
  }
  return(4*r)
}

asymptoticTest<-function(parameter){
  #calculate asymptotic min eps
  U=uTransform(parameter$x, parameter$F)
  n=length(parameter$x)
  vol = asymptoticVariance(U)/n
  vol=sqrt(vol)
  qt=qnorm(1-parameter$alpha,0,1)
  
  distance=testStatisticAD(U)
  min_eps = distance + qt*vol
  return(min_eps)
}