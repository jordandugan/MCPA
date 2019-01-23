x = 1e-23*rand(5,1);
v = rand(5,1);
t = 0;
x0 = x;
dt = 1e-15;

a = 500;

xp = x - v*dt;
xpp = x -2*v*dt;
for i = 1:2000
    if rand() <= 0.05 
        v = 0;
    else 
        x = -xpp + 2*xp + a*dt^2;
        v = (x - xpp)/(2*dt);
    end
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