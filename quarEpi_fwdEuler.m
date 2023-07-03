function quarEpi_fwdEuler
 
    %initial conditions
    N = 1000000;
    I0 = 10;
    S0 = N-I0;
    R0 = 0;
    Q0 = 0;
    
    %model constants
    beta = 5e-7;
    gamma = 0.05;
    zeta = 0; %quarantine rate
    
    dT = 0.001; %delta tau (in days)
    maxT = 365; %max t
    t=0:dT:maxT;
    S = zeros(size(t)); %initializing susceptible matrix
    I = zeros(size(t)); % initializing infected matrix
    Q = zeros(size(t)); % initializing quarantined matrix
    R = zeros(size(t)); % initializing recovered matrix
    numIter=(maxT/dT); %number of iterations
    
    S(1) = S0/N; %initial x value
    I(1) = I0/N; %initial y value
    Q(1) = Q0/N;
    R(1) = R0/N;
    
    for j=1:numIter
        %susceptible update function
        S(j+1)=S(j)+s(S(j),I(j))*dT;
        %infected update function
        I(j+1)=I(j)+i(S(j),I(j))*dT;
        %quarantined update function
        Q(j+1)=Q(j)+q(I(j))*dT;
        %recovered update function
        R(j+1)=R(j)+r(I(j))*dT;
    end

%   SUSCEPTIBLE FUNCTION
    function ds_dt = s(s_hat, i_hat)
        ds_dt = -beta*N*s_hat*i_hat;
    end
%   INFECTED FUNCTION
    function di_dt = i(s_hat, i_hat)
        di_dt = (beta*N*s_hat-(gamma+zeta))*i_hat;
    end
%   QUARANTINE FUNCTION
    function dq_dt = q(i_hat)
        dq_dt = zeta*i_hat;
    end
%   RECOVERED FUNCTION
    function dr_dt = r(i_hat)
        dr_dt = gamma*i_hat;
    end
    disp(R(end)+Q(end));
     
     while (R(end)+Q(end)>0.01)
        zeta = zeta+0.001;
        for j=1:numIter
            %susceptible update function
            S(j+1)=S(j)+s(S(j),I(j))*dT;
            %infected update function
            I(j+1)=I(j)+i(S(j),I(j))*dT;
            %quarantined update function
            Q(j+1)=Q(j)+q(I(j))*dT;
            %recovered update function
            R(j+1)=R(j)+r(I(j))*dT;
        end
        disp([zeta R(end)+Q(end)]);
     end 
     
     figure(1);
     plot(t, S, 'b'); 
     hold on
     plot (t, I, 'r');
     hold on
     plot (t, R, 'g');
     hold on
     plot(t, Q, '--k'), 
     hold off
     xlim([0 365]);
     ylim([0 1]);
     
     xlabel('days');
     ylabel('population size');
     legend('susceptible', 'infected', 'recovered', 'quarantined');
     
end