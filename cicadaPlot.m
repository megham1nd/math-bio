function cicadaPlot
    numIterations = 1000;
    t = 0:numIterations;
    N = zeros(size(t));
    N(1) = 100;
    
    R0 = 5;
    a = 1e-4;
    b = [1, 2, 0.5, 0.0];
    c = ['r', 'g', 'b', 'c'];
    
    for i = 1:length(b)
        for j=1:numIterations
            N(j+1) = (R0*N(j))/((1+(a*N(j)))^b(i));
        end
        plot(t, N, c(i));
        xlabel('t');
        ylabel('N(t)');
        axis ([0 1000 0 5e4]);
        hold on
    end
    
    %R0 = beta - gamma
    R0 = (log(2)/48)-0;
    K = 40000;
    %LOGISTIC PLOT
    for i=1:length(t)
        N(i) = (K*N(1)*exp(R0*t(i)))/(K-N(1)+(N(1)*exp(R0*t(i))));
    end
    
    plot(t, N, 'k')
    xlabel('t')
	ylabel('N(t)')
        
end