max_iterations=50;  % max number of iterations
numprint=50;  % how many numbers to print to the screen
r=2;  % our choice of r

% INITIALIZATION
x=.01;  %our initial value
m=zeros(50,3);

for i=1:max_iterations
    m(i,1)=i;
end
% ITERATIONS
for i=1:max_iterations
	x=logistic_calculate(r,x);
	m(i,2)= x;
	
end  %end of iteration loop

r=2.99;
x= 0.01;
for i=1:max_iterations
	x=logistic_calculate(r,x);
	m(i,3)= x;
end
plot(m(:,1),m(:,2),'-o','MarkerSize',3,'color','black');
hold on
plot(m(:,1),m(:,3),'-+','MarkerSize',3,'color','blue');

title('logistic map');
legend('r=2','r=2.99');
ax=gca;
ax.FontSize=12;
xlabel('Iteration Times');
ylabel('x_n');

saveas(gcf,'logistic map','epsc');
hold off
function x=logistic_calculate(r,x)
	x=r*x*(1-x);
end

%%  for r=2, fixed point approached reached immeadiatedly (less than 10 iterations)
 %% for r= 2.99, logistic map oscillated around the fixed point:(1-1/2.99)