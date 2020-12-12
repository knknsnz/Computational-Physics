clear all
close all
%%%%%%%%%%%%%%%After using different n, we save the simulation time,in
%%%%%%%%%%%%%%%matlab
t1=[0.006252,0.006616,0.008364,0.018941,0.154033,7.207560,96.307089];

N1=[10,20,50,100,200,500,1000];

figure
loglog(N1(1,:),t1(1,:))

hold on

%%%%%%%%%%%%%%%%%%%%%in python, i just ran the maximum n of 500, since it
%%%%%%%%%%%%%%%%%%%%%took too much time to run with n over 10000.

t2=[0.0000000,0.0000000,0.010972,0.081811,1.865504,181.623260];
N2=[10,20,50,100,200,500];

loglog(N2(1,:),t2(1,:))

hold off

title('simulation time in different N');
xlabel('N');
ylabel('t(s)');
legend('Matlab','python');

%%%%%%%%%%%%%%%%%%%%plot computational complexity
%%%%%%%%%%%%%= (k+1)*k/2*n^2+k*(k-1)/2*n^3,   k=n+1
%%%%%%%%%%%%%%computational complexity= (n+2)(n+1)n^2/2+(n+1)n^4/2
N3=[10,20,50,100,200,500,1000,2000];
for i= 1:8
    cc(1,i)=0.5*((N3(1,i)+2)*(N3(1,i)+1)*N3(1,i)^2+(N3(1,i)+1)*(N3(1,i)^4));
end

figure
loglog(N3(1,:),cc(1,:))
title('compexity in different N');
xlabel('N');
ylabel('computational complexity');
