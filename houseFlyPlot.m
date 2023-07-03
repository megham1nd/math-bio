function houseFlyPlot
    dt = 1; %time interval of one hour
    numIterations = 30*24; %time period of 30 days
    t = 0:dt:numIterations;
    N = zeros(size(t));
    N0 = 100;
    
    %R0 = beta - gamma
    R0 = (log(2)/48)-0;
    K = 400;
    
    %EXPONENTIAL PLOT
    for i=1:length(t)
         N(i) = N0*exp(R0*t(i));
    end
    
    plot(t, N, 'c')
    axis([0 numIterations 0 800])
    hold on
    
    %LOGISTIC PLOT
    for i=1:length(t)
        N(i) = (K*N0*exp(R0*t(i)))/(K-N0+(N0*exp(R0*t(i))));
    end
    
    plot(t, N, 'b')
    xlabel('t')
	ylabel('N(t)')
    
    %FORWARD EULER METHOD
    dT= 1; %delta tau of 1 hour
	maxT= 30*24; %max t, 30 days with 1 hour intervals
     
	t=0:dT:maxT;
	X=zeros(size(t));
	numIter=(maxT/dT); %number of iterations
	X(1)= N0;
     
	for i=1:numIter
        X(i+1)=X(i)+f(X(i))*dT; %projected growth using Euler equation
	end
     
	plot(t, X, '--g')
	xlabel('t')
	ylabel('N(t)')
    
    function dx_dt=f(x)
        dx_dt= R0*x*(1-(x/K));
    end

end