
%%%% problem 2(c)

n=50;


M=zeros(n,n);

b=ones(n,1);
b_plus1=zeros(n,1);

for i=1:n
    for j= 1:n
        if abs(i-j)<3
           M(i,j)=1;
        end
    end
end
[V,D]=eig(M);
lambda_max= max(D(:));  %%%%% we find labda_max= D(50,50), thus v_max= V(:,50)
v_max=V(:,50);

%%%%%% lambda_max= 4.9815,    v_max= V(:,50);


%%%%%%%problem 2(d)

for i = 1:1000
    b_plus1=M*b/norm(b);
    if norm( b_plus1-b)< 1e-6*norm(b_plus1)
        break
    else
      b=b_plus1;
    end
end

e=b_plus1./v_max;  %%%%%%calculate bkmax/vmax  e= 4.9819, thus bkmax ∝ vmax
d=M*b_plus1;
f=lambda_max.*b_plus1;
g= d./f;  %%%%%%%%%calculate Mbkmax/lambdamaxbkmax  g=1 thus, Mbkmax ≈ λmaxbkmax
        