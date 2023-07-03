function houseFlyNewton
    %R0 = beta - gamma
    R0 = (log(2)/48)-0;
    K = 400;
    N0 = 100;

    %NEWTONIAN METHOD OF FINDING FIXED POINTS
    tol = 1e-2;
    x0 = 0.9 * K;
    
    x = x0;
    i = 0;
    
    disp([i x f(x)]);
    
    while (abs(f(x)) > tol)
        x = x-(f(x)/df(x));
        i = i + 1;
        disp([i x f(x)]);
    end
    
    function y = f(x)
        y = (R0*x)*(1-(x/K));
    end

    function y = df(x)
        y = R0*(1-(2*x/K));
    end
    
end

    