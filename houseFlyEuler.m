function houseFlyEuler
    %R0 = beta - gamma
    R0 = (log(2)/48)-0;
    K = 400;
    N0 = 100;

    %FORWARD EULER METHOD
    dT= 100; %delta tau of 1 hour
	maxT= 30*24; %max t, 30 days with 1 hour intervals
     
	t=0:dT:maxT;
	X=zeros(size(t));
	numIter=(maxT/dT); %number of iterations
	X(1)= N0;
     
	for i=1:numIter
        X(i+1)=X(i)+f(X(i))*dT; %projected growth using Euler equation
	end
     
	plot(t, X)
	xlabel('t')
	ylabel('N(t)')
    
    function dx_dt=f(x)
        dx_dt= R0*x*(1-(x/K));
    end

end