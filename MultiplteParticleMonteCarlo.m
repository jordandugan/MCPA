x = 1e-23*rand(5,1);
v = 0;
t = 0;
x0 = x;
dt = 1e-15;

a = 500;

xp = x - v*dt;
xpp = x -2*v*dt;
for i = 1:2000
    xscat = rand(5,1) <= 0.05;
    v(i,xscat) = 0;
    x(~xscat) = -xpp(~xscat) + 2*xp(~xscat) + a*dt^2;
    v(i,~xscat) = (x(~xscat) - xpp(~xscat))/(2*dt);
    
    t = t+dt;
    vdrift(i) = mean(x-x0)/t;
    subplot(2,1,1)
    plot(x,0, 'o', 'MarkerSize', 10);
    xlim([0, 1e-23]);
    title(sprintf('%e m/s', vdrift(i)));
    subplot(2,1,2)
    plot(v)
    title('speed')
    ylim([0, 1e-10]);
    drawnow
    xpp = xp;
    xp = x;
    
end

plot(vdrift);