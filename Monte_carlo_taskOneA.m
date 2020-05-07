 %monte carlo 
 x= rand(1,10)
   %production of random numbers matrix one by 10 
  xi= x(1,2:end)
  xvalue= x(1,1)
  xi_1= [xi,xvalue]
plot (xi_1, x)

 a= rand(1,1000);
   %production of random numbers matrix one by 1000
  ai= a(1,2:end);
  avalue= a(1,1);
  ai_1= [ai,avalue];
plot (ai_1, a)

 b= rand(1,100000);
   %production of random numbers matrix one by 1000000
  bi= b(1,2:end);
  bvalue= b(1,1);
  bi_1= [bi,bvalue];
plot (bi_1, b)


%plots show random variations over the x-values, the more values we plot
%the more randomness we get and the fuller the graph gets