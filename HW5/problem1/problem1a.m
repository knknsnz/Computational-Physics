clear all
close all

%%%since we know one of the root is near -1, we will choose fx(a0)<0,
%%%fx(b0)>0
ai=-2;
bi=0;
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
       

%%%%% we can find when x= -0.815553665161133,
%%%%% Fx=-6.43516953668932e-07,satify the tolerance.



function y=fx(x)
     y= exp(x)-x^4;
end