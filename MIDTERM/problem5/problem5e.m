clear all
close all
r1=zeros(1,2);
r2=zeros(1,2);
r3=zeros(1,2);
r1=[0.01,0];
r2=[0,1];
r3=[0,-1];
v1=[0,0];
v2=[1,0];
v3=[-1,0];
ti=0;
tf=50;
dt=0.01;
c=dt^2/2;
r1_0=r1-dt.*v1+c.*((r2-r1)./((r2(1,1)-r1(1,1))^2+(r2(1,2)-r1(1,2))^2)^1.5+(r3-r1)./((r3(1,1)-r1(1,1))^2+(r3(1,2)-r1(1,2))^2)^1.5);%%%%%%%%%%%%%%verlet method is applied
r2_0=r2-dt.*v2+c.*((r1-r2)./((r2(1,1)-r1(1,1))^2+(r2(1,2)-r1(1,2))^2)^1.5+(r3-r2)./((r3(1,1)-r2(1,1))^2+(r3(1,2)-r2(1,2))^2)^1.5);
r3_0=r3-dt.*v3+c.*((r1-r3)./((r1(1,1)-r3(1,1))^2+(r1(1,2)-r3(1,2))^2)^1.5+(r2-r3)./((r3(1,1)-r2(1,1))^2+(r3(1,2)-r2(1,2))^2)^1.5);
for i = ti:dt:tf
r1nplus1=2.*r1-r1_0+2*c.*((r2-r1)./((r2(1,1)-r1(1,1))^2+(r2(1,2)-r1(1,2))^2)^1.5+(r3-r1)./((r3(1,1)-r1(1,1))^2+(r3(1,2)-r1(1,2))^2)^1.5); %%%%%%calculate dimensionless r
r2nplus1=2.*r2-r2_0+2*c.*((r1-r2)./((r2(1,1)-r1(1,1))^2+(r2(1,2)-r1(1,2))^2)^1.5+(r3-r2)./((r3(1,1)-r2(1,1))^2+(r3(1,2)-r2(1,2))^2)^1.5);
r3nplus1=2.*r3-r3_0+2*c.*((r1-r3)./((r1(1,1)-r3(1,1))^2+(r1(1,2)-r3(1,2))^2)^1.5+(r2-r3)./((r3(1,1)-r2(1,1))^2+(r3(1,2)-r2(1,2))^2)^1.5);
v1=(r1nplus1-r1_0)./dt./2;   %%%%%%%%%%calculate diemnsionless velocity
v2=(r2nplus1-r2_0)./dt./2;
v3=(r3nplus1-r3_0)./dt./2;
r1_0=r1;
r2_0=r2;
r3_0=r3;
r1=r1nplus1;
r2=r2nplus1;
r3=r3nplus1;
U=-1./((r2(1,1)-r1(1,1))^2+(r2(1,2)-r1(1,2))^2)^0.5-1./((r3(1,1)-r1(1,1))^2+(r3(1,2)-r1(1,2))^2)^0.5-1./((r3(1,1)-r2(1,1))^2+(r3(1,2)-r2(1,2))^2)^0.5;%%%%%calclate of potential energy
P= 0.5*(v1(1,1)^2+v1(1,2)^2+v2(1,1)^2+v2(1,2)^2+v3(1,1)^2+v3(1,2)^2);  %%%%%%calculate kinetic energy
T=U+P;   %%%%%calculate total energy
U_t(round(i/dt)+1,:)=U;
P_t(round(i/dt)+1,:)=P;
T_t(round(i/dt)+1,:)=T;
r1_t(round(i/dt)+1,:)=r1nplus1;
r2_t(round(i/dt)+1,:)=r2nplus1;
r3_t(round(i/dt)+1,:)=r3nplus1;
v1_t(round(i/dt)+1,:)=v1;
v2_t(round(i/dt)+1,:)=v2;
v3_t(round(i/dt)+1,:)=v3;
end
figure
plot(r2_t(:,1),r2_t(:,2))
hold on
plot(r3_t(:,1),r3_t(:,2))
hold on
plot(r1_t(:,1),r1_t(:,2))
hold off
title('trajectories of ri');
xlabel('x(t)');
ylabel('y(t)');
legend('r2','r3','r1');


figure
for i= ti:dt:tf
    t(round(i/dt)+1,:)=i;
end
plot(t(:,1),T_t(:,1))
title('total energy');
xlabel('t');
ylabel('T');


%%%%%%%%  trajectory is different from what I found in problem d,beacuse
%%%%%%%%  the r1 is moving, so r2 and r3 is moving, different dt may obtain
%%%%%%%%  different periodical orbit, thus the trajectiry is different. 