%Method of Sequential Ordering "Less Clever"

close all
clear
clc

%Initial Conditions
f = @(x)  -exp(-x)*sin(x); %Equation expressed as an anonymous function
xo=0 ;
x1=1 ;
x2=2 ;

es=.000001 ; %Stopping criteria
i=0;
ea=1;
while ea>es
    i = i+1; %Iteration Counter
    
    if i>1
        xo=x1;
        x1=x2;
        x2=x3
    end
    
    
    fxo = f(xo) ;
    fx1 = f(x1) ;
    fx2 = f(x2) ;
    
     if i>1;
        xold=x3;
     end
    
    x3= (f(xo)*(x1^2-x2^2)+f(x1)*(x2^2-xo^2)+f(x2)*(xo^2-x1^2))/(2*f(xo)*(x1-x2)+2*f(x1)*(x2-xo)+2*f(x2)*(xo-x1));
    
    
    if i>1;
        ea = abs(((x3 - xold)/(x3))*100);
    end
end

    
    