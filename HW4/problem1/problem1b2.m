%%%%%%% assmue a=1 dt=0.01s r=4
clear all
close all
ti=0;
dt=0.01;
vi=1;
tf=10;
n=(tf-ti)/dt;
x=zeros(n+1,1);
x(1,1)=4;
for i = ti+dt:dt:tf
  
  j=round(i/dt);
  f1= xt_calculate(x(j,1));
  f2= xt_calculate(x(j,1)+0.5*dt*f1);
  f3=xt_calculate(x(j,1)+0.5*dt*f2);
  f4=xt_calculate(x(j,1)+dt*f3);
  x(j+1,1)=x(j,1)+1/6*dt*(f1+2*f2+2*f3+f4);
  xplus1(j,1)= x(j+1,1);
  theta(j,1)=i;
end

pol(:,2)= xplus1(:,1);
pol(:,1)=theta(:,1);
polar(theta,xplus1);












function fx=xt_calculate(x)
     fx= x-x^3;
end