%Task 2 Steepest Descent into Golden Section Search
close all
clear all
clc

%Function


f = @(x,y,z) sin(y/2)-2*cos(2*x+2)+((z-4)^2)/2 ;

%Initial Guesses
x0=1 ;
y0=1 ;
z0=1 ;

%C=pertubation factor
C=0.05;

i=0 ;
es = .000001 ;
eax=1 ;
eay=1 ;
eaz=1 ;
%Computing Partial Derivatives
partialx0 = (f(x0+C,y0,z0)-f(x0-C,y0,z0))/(2*C) ;
partialy0 = (f(x0,y0+C,z0)-f(x0,y0-C,z0))/(2*C) ;
partialz0 = (f(x0,y0,z0+C)-f(x0,y0,z0-C))/(2*C) ;
%Iterative Descent Formulas
g=@(h)f(x0+partialx0*h,y0+partialy0*h,z0+partialz0*h); %Use this formula to Golden Search and Optimize

while eax>es || eay>es || eaz >es
    
    i = i+1 ; %Iteration Counter
    
    if i ~=1
        %Computing Partial Derivatives
        partialx0 = (f(xnew+C,ynew,znew)-f(xnew-C,ynew,znew))/(2*C) ;
        partialy0 = (f(xnew,ynew+C,znew)-f(xnew,ynew-C,znew))/(2*C) ;
        partialz0 = (f(xnew,ynew,znew+C)-f(xnew,ynew,znew-C))/(2*C) ;
        %Iterative Descent Formulas
        g=@(h)f(xold+partialx0*h,yold+partialy0*h,zold+partialz0*h); %Use this formula to Golden Search and Optimize h
    end
    
    
    
    
    
    %Golden Section Search
    %Initial Bounds [-3,3]
    %ea=.01
    
    %Initalize upper and lower bounds
    xl = -3 ;
    xu = 3 ;
    GR = 0.61803 ;
    
    x1 = xl + GR*(xu-xl) ;
    x2 = xu - GR*(xu-xl) ;
    
    k=0 ;
    es2 = .01 ;
    ea = 1 ;
    
    
    
    while ea>es2
        k = k+1 ;
        if k~=1
            xu = xunew ;
            xl = xlnew ;
        end
        if g(x1)<g(x2)
            
            xlnew = x2 ;
            x2new = x1 ;
            xunew = xu ;
            x1new = xlnew + (xunew - xlnew)*GR ;
            
            x1 = x1new ;
            x2 = x2new ;
            
            
            xopt = x1new ;
            h = xopt ;
            
            
            
            
        elseif g(x2)<g(x1)
            
            xlnew = xl ;
            xunew = x1 ;
            x1new = x2 ;
            x2new = xunew - (xunew - xlnew)*GR ;
            
            x1 = x1new ;
            x2 = x2new ;
            
            xopt = x2new ;
            h = xopt ;
        end
        
        
        if k>1
            
            ea = (1-GR)*abs(((xu - xl)/(xopt))*100); %Xopt is the lowest value guess
        end
    end
    
    if i~=1
        xold=xnew;
        yold=ynew;
        zold=znew;
    end
    if i==1
        xold=x0;
        yold=y0;
        zold=z0;
    end
    
    xnew = xold + partialx0*h ;
    ynew = yold + partialy0*h ;
    znew = zold + partialz0*h ;
    
    
    
    eax = abs(((xnew - xold)/(xnew))*100);
    eay = abs(((ynew - yold)/(ynew))*100);
    eaz = abs(((znew - zold)/(znew))*100);
    
    
end


%Hessian in order to find Min/Max/Saddle

Secondpartialx0 = (f(x0+C,y0,z0)-C*f(x0,y0,z0)+f(x0-C,y0,z0))/(2*C) ;
Secondpartialy0 = (f(x0,y0+C,z0)-C*f(x0,y0,z0)+f(x0,y0-C,z0))/(2*C) ;
Secondpartialz0 = (f(x0,y0,z0+C)-C*f(x0,y0,z0)+f(x0,y0,z0-C))/(2*C) ;

Secondpartialx0partialy0 = (f(x0+C,y0+C,z0)+f(x0-C,y0-C,z0)-f(x0-C,y0+C,z0)-f(x0+C,y0-C,z0))/(4*C*partialx0*partialy0);
Secondpartialx0partialz0 = (f(x0+C,y0,z0+C)+f(x0-C,y0,z0-C)-f(x0-C,y0,z0+C)-f(x0+C,y0,z0-C))/(4*C*partialx0*partialz0);
Secondpartialz0partialy0 = (f(x0,y0+C,z0+C)+f(x0,y0-C,z0-C)-f(x0,y0-C,z0+C)-f(x0,y0+C,z0-C))/(4*C*partialz0*partialy0) ;


H = [ Secondpartialx0 , Secondpartialx0partialy0 , Secondpartialx0partialz0 ;
    Secondpartialz0partialy0 , Secondpartialy0 , Secondpartialz0partialy0 ;
    Secondpartialx0partialz0 , Secondpartialz0partialy0 , Secondpartialz0 ];

if det[H]>0 || Secondpartialx0>0;
    disp('LocalMinimum')
elseif  det[H]>0 || Secondpartialx0<0;
    disp('LocalMaximum')
elseif  det[H]<0;
    disp('SaddlePoint')
end




  
      














