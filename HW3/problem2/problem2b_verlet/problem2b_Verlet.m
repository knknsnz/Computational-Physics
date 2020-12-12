%%% xtt= -x, x0=0, v0=1,  x=sin(t)
%%% X_n+1= 2*X_n -X_n-1+dt^2*xtt (Verlet method)
ti=0;
xi=0;
dt=0.001;
vi=1;
tf=5;
n=(tf-ti)/dt;
x=zeros(n+1,1);
x_nplus1=zeros(n+1,6);
t=[0.5,0.1,0.05,0.01,0.005,0.001];
x_minus1= xi-dt*vi+0.5*dt^2*xtt_calculate(xi); %%%calcualte x_-1 
for j = 1:6   %%%%% different dt
    dt=t(1,j);
    x=zeros(n+1,1);
    x_minus1= xi-dt*vi+0.5*dt^2*xtt_calculate(xi); %%%calcualte x_-1 
for i = ti+dt:dt:tf
    f=x(round(i/dt),1);
    y= xtt_calculate(f);
    x(round(i/dt+1),1)=2*x(round(i/dt),1)-x_minus1+dt^2*y;
    x_minus1= x(round(i/dt),1);
     x(round(i/dt),1) =  x(round(i/dt+1),1);
    x_nplus1(round(i/dt),j)=x(round(i/dt),1);
    if i== tf
        g(j,1)=sin(i)-x(round(i/dt),1); %%%%%calulate g1(delta t)
    end
    
end
end

for i=1:6
    data(i,1)=t(1,i);
    data(i,2)=g(i,1);
end
plot(data(:,1),data(:,2),'-o','MarkerSize',10,'color','black');
title('harmonic oscillator');
%writes to the top of the plot

box on
%puts a box all around the plot (instead of just x-y axes)

ax=gca;
% gca means "get current axes".  If you wnat to modify the axes, this is how.

ax.FontSize=12;
%sets the font size for the axes
set(ax,'Xscale','log')
set(ax,'Yscale','log')

xlabel('ln(dt)');
ylabel('ln(g1)');
%labels the axes 

saveas(gcf,'prioblem2b_verlet','epsc');
function fx=xtt_calculate(x)
     fx= -x;
end
