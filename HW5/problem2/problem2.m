clear all
close all


x=zeros(1,2);
fvec=zeros(1,2);
Dmat= zeros(2,2);
xi=1;
yi=1;

for i= 1:1000
    x(1,1)=xi;
    x(1,2)=yi;
    fvec(1,1)=f(xi,yi);
    fvec(1,2)=g(xi,yi);
    Dmat(1,1)=dfx(xi);
    Dmat(2,1)=dfy(yi);
    Dmat(1,2)=dgx(xi,yi);
    Dmat(2,2)=dgy(xi,yi);
    if abs(fvec(1,1))<1e-6 && abs(fvec(1,2))<1e-6
        disp(x);
        break
    else
      x= x-fvec*Dmat^-1;
      xi=x(1,1);
      yi=x(1,2);
    end
end
      

%%%%%%%%%%%%%we obtained following results x*=1.173977710152050, y*=0.807868817013699



function y=f(x,y)
     y= x^2*exp(-x^2)+y^2-1;                        
end
function df=dfx(x)
     df=2*x*exp(-x^2) - 2*x^3*exp(-x^2);         %%%%%df/dx
end
function df=dfy(y)                               %%%%%%% df/dy
     df= 2*y;
end
function y=g(x,y)
     y= x^4/(1+x^2*y^2)-1;
end
function dg=dgx(x,y)
     dg= (4*x^3)/(x^2*y^2 + 1) - (2*x^5*y^2)/(x^2*y^2 + 1)^2;               %%%%%%% dg/dx
end
function dg=dgy(x,y)
     dg= -(2*x^6*y)/(x^2*y^2 + 1)^2;                                         %%%%% dg/dy
end