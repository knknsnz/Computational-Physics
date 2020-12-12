clear all
close all
n=10;
I=zeros(n,n);
A=zeros(n,n);
for i = 1:n
    I(i,i)=1;
end
for i = 1:n
    for j= 1:n
        A(i,j)=(1+I(i,j))/(n+1);
    end
end
c=I-A;
logA=-c;
b=norm(c);  %%%%%%%%%%we can find k=n+1
tic
for i= 1:n
    logA1=logA-c^(i+1)/(i+1);
    logA= logA1;
end
toc

