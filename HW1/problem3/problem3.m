a=zeros(1,3);
b=ones(1,3);
v1=zeros(1,3);
v2=zeros(1,3);
for i= 1:3
    a(1,i)=i;
end
v1=a;
ab=a*reshape(b,3,1); %% calculate a*b
d=ab/(a(1,1)^2+a(1,2)^2+a(1,3)^2); %%calculate (a*b)/a^2
for i =1:3
v2(1,i)=b(1,i)-d*a(1,i);
end
c_square=(b(1,1)^2+b(1,2)^2+b(1,3)^2)/(v2(1,1)^2+v2(1,2)^2+v2(1,3)^2);
c= sqrt(c_square);

