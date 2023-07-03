function modLV_fwdEuler_holling
    %%RESTRICTED PREY GROWTH AND HOLLING'S DISK
    R0U = 0.04;
    R0V = 0.2;
    gamma = 0.0005;
    e = 0.1;
    K = 10000;
    s = gamma;
    h = 0.2;
    
    dT = 0.01; %delta tau (in days)
    maxT = 365*3; %max t
    t=0:dT:maxT;
    X = zeros(size(t)); %initializing rabbit matrix
    Y = zeros(size(t)); % initializing fox matrix
    numIter=(maxT/dT); %number of iterations
    
    X(1)= 200; %initial x value
    Y(1) = 50; %initial y value
    
    for i=1:numIter
        %rabbit update function
        X(i+1)=X(i)+u(X(i),Y(i))*dT;
        %fox update function
        Y(i+1)=Y(i)+v(X(i),Y(i))*dT;
    end

%   x is u(t) and y is v(t)
%   PREY FUNCTION -> RABBITS
    function du_dt = u(x, y)
        du_dt = ((R0U*(1-(x/K)))*x)-(((s*x)/(1+(s*h*x)))*x*y);
    end
%   PREDATOR FUNCTION -> FOXES
    function dv_dt = v(x, y)
        dv_dt = (e*((s*x)/(1+(s*h*x)))*x*y)-(R0V*y);
    end

     figure(1);
     plot(t, X, 'b'); 
     hold on
     plot (t, Y, 'c');
     hold off
     xlim([0 365*3]);
     
     xlabel('days');
     ylabel('population size');
     legend('rabbits', 'foxes');
    
     figure(2);
     plot(X, Y, 'g');
     xlabel('rabbits');
     ylabel('foxes');
     
     hold on
     
      [UU, VV] = meshgrid([0:25:250], [0:5:70])
      vel_U = ((R0U.*(1-(UU./K))).*UU)-(((s.*UU)./(1+(s.*h.*UU))).*UU.*VV);
      vel_V = (e.*((s.*UU)./(1+(s.*h.*UU))).*UU.*VV)-(R0V.*VV);
      h = quiver(UU, VV, vel_U, vel_V, 1.25);
      set(h, 'maxheadsize', 0.005, 'color', [150, 255, 150]/255);
      
      xlim([-10 250]);
      ylim([-10 70]);
      
      hold off
end