x = 1e-23*rand(5,1);
v = zeros(5,1);
t = 0;
x0 = x;
dt = 1e-15;

a = 500;

xp = x - v*dt;
xpp = x -2*v*dt;
for i = 1:2000
    xscat = rand(5,1) <= 0.05;
    v(xscat) = 0;
    x(~xscat) = -xpp(~xscat) + 2*xp(~xscat) + a*dt^2;
    v(~xscat) = (x(~xscat) - xpp(~xscat))/(2*dt);
    
    t = t+dt;
    vdrift(i) = mean(x-x0)/t;
    plot(x,0, 'o', 'MarkerSize', 10);
    xlim([0, 1e-23]);
    title(sprintf('%e m/s', vdrift(i)));
    drawnow
    xpp = xp;
    xp = x;
    
end

plot(vdrift);