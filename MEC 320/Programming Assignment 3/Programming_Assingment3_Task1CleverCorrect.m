close all
clear
clc

%Clever: Reassigning X's from one iteration to the next

%Initial Conditions
x = 0;
f = @(x)  -exp(-x)*sin(x); %Equation expressed as an anonymous function
xo=0 ;
x1=1 ;
x2=2 ;
%f(xo) = -exp(-xo)*sin(xo) ;
%f(x1) = -exp(-x1)*sin(x1) ;
%f(x2) = -exp(-x2)*sin(x2) ;
%f(x3) = -exp(-x3)*sin(x3) ;
%x3= guess for the minimum
%x3= (f(xo)*(x1^2-x2^2)+f(x1)*(x2^2-xo^2)+f(x2)*(xo^2-x1^2))/(2*f(xo)*(x1-x2)+2*f(x1)*(x2-x0)+2*f(x2)*(x0-x1));

es=.000001 ; %Stopping criteria
i=0;
ea=1;
while ea>es;
    i = i+1; %Iteration Counter
    
    fxo = f(xo) ;
    fx1 = f(x1) ;
    fx2 = f(x2) ;
    
    if i>1;
        xold=x3
    end
    
    x3= (f(xo)*(x1^2-x2^2)+f(x1)*(x2^2-xo^2)+f(x2)*(xo^2-x1^2))/(2*f(xo)*(x1-x2)+2*f(x1)*(x2-xo)+2*f(x2)*(xo-x1));
    fx3 = f(x3);
    
    if x3>x1;
        if f(x3)<f(x1)
            xo=x1 ;
            x1=x3;
            x2=x2 ;
            
        else f(x3)>f(x1);
            xo=xo ;
            x1=x1 ;
            x2=x3 ;
        end
        
    elseif x3<x1
        if f(x3)>f(x1)
            xo=x1 ;
            x1=x3 ;
            x2=x2;
            
        elseif f(x3)<f(x1)
            xo=xo ;
            x2=x1 ;
            x1=x3 ;
            
        end
    end
    
    if i>1
        ea = abs(((x3 - xold)/(x3))*100);
    end
end
