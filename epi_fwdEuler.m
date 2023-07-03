function epi_fwdEuler
 
    %initial conditions
    N = 1000000;
    I0 = 10;
    S0 = N-I0;
    R0 = 0;
    
    %model constants
    beta = 5e-7;
    gamma = 0.05*10;
    
    dT = 0.001; %delta tau (in days)
    maxT = 365; %max t
    t=0:dT:maxT;
    S = zeros(size(t)); %initializing susceptible matrix
    I = zeros(size(t)); % initializing infected matrix
    R = zeros(size(t)); % initializing recovered matrix
    numIter=(maxT/dT); %number of iterations
    
    S(1) = S0/N; %initial x value
    I(1) = I0/N; %initial y value
    R(1) = R0/N;
    
    for j=1:numIter
        %susceptible update function
        S(j+1)=S(j)+s(S(j),I(j))*dT;
        %infected update function
        I(j+1)=I(j)+i(S(j),I(j))*dT;
        %recovered update function
        R(j+1)=R(j)+r(I(j))*dT;
    end

%   SUSCEPTIBLE FUNCTION
    function ds_dt = s(s_hat, i_hat)
        ds_dt = -beta*N*s_hat*i_hat;
    end
%   INFECTED FUNCTION
    function di_dt = i(s_hat, i_hat)
        di_dt = (beta*N*s_hat-gamma)*i_hat;
    end
%   RECOVERED FUNCTION
    function dr_dt = r(i_hat)
        dr_dt = gamma*i_hat;
    end

     figure(1);
     plot(t, S, 'b'); 
     hold on
     plot (t, I, 'r');
     hold on
     plot (t, R, 'g');
     hold off
     xlim([0 365]);
     ylim([0 1]);
     
     xlabel('days');
     ylabel('population size');
     legend('susceptible', 'infected', 'recovered');
    
     figure(2);
     plot(S, I, 'k');
     xlabel('susceptible');
     ylabel('infected');
     
     hold on
 
     %creation of phase plane
     [SS, II] = meshgrid([0:0.05:1], [0:0.05:1]);
     vel_S = -beta*N.*SS.*II;
     vel_I = (beta*N.*SS-gamma).*II;
     h = quiver(SS, II, vel_S, vel_I, 1.25);
     set(h, 'maxheadsize', 0.05, 'color', [0, 0, 0]/255);
     
     xlim([0 1]);
     ylim([0 1]);
     
     hold on
     
     %plotting null clines
     plot([0 0], [0 1], '--k');
     plot([gamma/(beta*N) gamma/(beta*N)], [0 1], '--k');
     
     hold off
     
     disp("Total number of individuals infected: " + ceil(N*R(end)));
     disp("Total number of individuals avoiding infection: " + ceil(N*S(end)));
     disp("Total number of individuals dead with a 5% mortality rate: " + ceil(0.05*N*R(end)));
end