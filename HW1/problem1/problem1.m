x=0.1;
n=20;
t=2;
dt=0.1;
fdt=zeros(n+1,1);
for i= 0:n
   x1=logistic_calculate(2);
   tdt= t+ 10^(-i);
   x2=logistic_calculate(tdt);
   x_prime=derivative_calculate(2); 
   fdt(i+1,1)= x_prime-(x2-x1)/dt;  %%%compute f(delta t)
   logfdt(i+1,1)= log(fdt(i+1,1));  %%%% ln(f(delta t))
    
end
    
for j =1:n+1
    data(j,1)=j;
    logdata(j,1)=log(data(j,1));
end

plot(data(:,1),logfdt(:,1),'-o','MarkerSize',10,'color','black');
title('problem1');
%writes to the top of the plot



xlabel('n');
ylabel('x_n');
%labels the axes 

saveas(gcf,'problem1','epsc');


   function x=logistic_calculate(t)
	x=1/(1+9*exp(-t));
end
function x_prime=derivative_calculate(t)
	x_prime=-9*exp(-t)*log(1+9*exp(-t));
end