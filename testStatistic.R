uTransform<-function(X,F){
  X=sort(X)
  U=F(X)
  return(U)
}

testStatisticAD<-function(U){
  n=length(U)
  i=c(1:n)
  
  v=log(U)
  rv=log(1-U)
  rv=rev(rv)
  
  w=(v+rv)
  w=w*(2*i-1)/n
  s=sum(w)
  s=-n-s
  
  return(s/n)
}

