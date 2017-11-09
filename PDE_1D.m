
close all
clear all

nt = 20000;
nx = 101;
c = 0.7;
dt = 0.1;
dx = 1;
a = c*dt/(dx^2);
u = zeros(nx,nt);
u(1,1) = 1;
x = 0:nx-1;
y = normpdf(x,50,50/3.2);
u(:,1) = y;
u(1,1) = 0;
u(100,1) = 0;

P = zeros(nx);

for i = 1:nx
    if i == 1 || i == nx
        P(i,i) = 1;
    else
        P(i,i) = 1 - 2*a;
        P(i,i-1) = a;
        P(i,i+1) = a;

    end

end
figure()
plot(x,u(:,1));
drawnow

tic
for n = 1:nt-1
    
    u(:,n+1) = P*u(:,n);
    
    if mod(n,1000) == 0
        plot(x,u(:,n+1));
        axis([0 100 0 max(y)])
        drawnow
    end
    
end
toc
