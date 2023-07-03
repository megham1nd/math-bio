function hasselExercise
    numIterations=100;
    R0=100;
    t=0:numIterations;
    N=zeros(size(t));
    N(1)=1;
    Nc=1e6;
    a=R0/Nc;
    b=100;
    for i=1:numIterations
         N(i+1) = (R0*N(i))/(1+(a*N(i)))^b;
 
 
    end
    N(end);
    plot(t,N, '-o');
    xlabel('t')
    ylabel('N')