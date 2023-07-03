%velocity field exercise
%purpose: To draw velocity field 
%initalization with parameters
alpha=0.04;
beta=0.2;
gamma=5e-4;
epsilon=0.1;
%purpose: define some max's on a grid
max_U= 8000;
max_V= 160;
N=5;
range_U=0:(max_U/N):max_U; %vector of length 6(6 ticks), lines 9 and 10 equivalent
range_V=linspace(0, max_V, N+1); %generates the fixed number of ticks
[UU, VV]=meshgrid(range_U, range_V); %meshgrid: setting things up, generates two template matrices for the velocities

vel_U=(alpha.*UU)-(gamma.*UU.*VV); %horizontal velocity 
vel_V=(epsilon.*gamma.*UU.*VV)-(beta.*VV); %vertical velocity

disp([UU, VV])
disp(vel_U);
disp(vel_V);

h=quiver(range_U,range_V,vel_U,vel_V,0.5); %last param: size of arrows

set(h, "maxheadsize", 0.005);
xlabel("Prey");
ylabel("Predator");