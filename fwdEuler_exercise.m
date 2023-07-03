function fwdEuler_exercise
    %Purpose: to demonstrate forward euler method
    %fill in where "%%" exist
    dT= 0.1; %delta tau
    maxT= 10; %max t
    X_init= 1; %initial x value
    t=0:dT:maxT;
    X=zeros(size(t));
    numIter=(maxT/dT); %number of iterations
    X(1)= X_init;
    for i=1:numIter
        X(i+1)=X(i)+f(X(i))*dT;
    end
    X(end);
    plot(t, X)
    xlabel('t')
    ylabel('y')
    
    function dx_dt=f(x)
        gamma=2;
        dx_dt= -gamma *x;
    end
end