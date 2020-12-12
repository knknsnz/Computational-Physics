clear all
close all

%%%since we know one of the root is near 9, we will choose fx(a0)<0,
%%%fx(b0)>0
ai=8;
bi=10;
xi= (ai+bi)/2;
for i =1:1000
   Fx=fx(xi);
   if abs(Fx)< 1e-6
       root=xi;
       disp(root);
       break
   elseif Fx>0
       bi=xi;
       xi= (ai+bi)/2;
   else
       ai=xi;
        xi= (ai+bi)/2;
   end
end
       

%%%%% we can find when x=  8.613169456366450,
%%%%% Fx= -2.20929905481171e-07,satify the tolerance.



function y=fx(x)
     y= exp(x)-x^4;
end