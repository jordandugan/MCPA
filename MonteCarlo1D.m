x = 0;
v = 0;
t = 0;

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
    vdrift(i) = x/t;
    plot(x,0, 'o', 'MarkerSize', 10);
    xlim([0, 1e-23]);
    title(sprintf('%e m/s', vdrift(i)));
   
    drawnow
    xpp = xp;
    xp = x;
    
end

plot(vdrift);
    