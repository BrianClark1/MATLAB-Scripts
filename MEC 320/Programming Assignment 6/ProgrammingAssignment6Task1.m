close all;
clear;
clc;

%Euler's Method
%Heun's Method with iteration
%Ralston's Method
%Fourth Order Runge-Kutta

%Euler's Method
%Initialize initial conditions
t1 = 0.20 ;
t2 = 3.05 ;
h = 0.15 ;
StepFunc = (t2-t1)/h;
yi = 6.576 ;  %y(.20)
t(1,1) = t1;
y(1,1) = yi;
y2(1,1) = yi;
diffy = @(t,y) t - 1 + ((1-2*y) / (t)); %Initial Equation
diffy2 = @(t) ((t.^2)./4)-(t./3)+(.2453./(t.^2))+.5; %True Solution
for i = 1:StepFunc
    t(i+1,1) = t(i,1)+h;
    y(i+1,1) = y(i,1)+ diffy(t(i,1),y(i,1))*h;
end



%Fourth Order Runge-Kutta
for i = 1 : StepFunc
    k1 = diffy(t(i,1),y2(i,1)) ;
    k2 = diffy((t(i,1) + (1/2)*h) , (y2(i,1) + (1/2)*k1*h)) ;
    k3 = diffy((t(i,1) + (1/2)*h) , (y2(i,1) + (1/2)*k2*h)) ;
    k4 = diffy((t(i,1) + h) ,(y2(i,1) + k3*h)) ;
    y2(i+1,1) = y2(i,1)+(1/6)*(k1 + 2*k2 + 2*k3 + k4)*h ;
end
ActualVector(1,1) = yi;
for o = 1:StepFunc
    ActualVector(o+1,1) = diffy2(t(o+1,1));
end



%Heuns Method w/ Iteration
%iterate on the correction until the approximate error
%falls below some criterion

ea = 100 ;
y3(1,1) = yi;
vlast = zeros(StepFunc,1);

for k = 1:StepFunc
    i = 1;
    ea = 100;
    v = y3(k,1)+ diffy(t(k,1),y3(k,1))*h;
    vlast(1,1) = yi;
    while ea > .01
        if i == 1
        vlast(i+1,1) = y3(k,1) + (h*(diffy(t(k,1),y3(k,1)) + diffy(t(k+1,1),v(i,1)))/2);
        else
        vlast(i+1,1) = y3(k,1) + (h*(diffy(t(k,1),y3(k,1)) + diffy(t(k+1,1),vlast(i,1)))/2);
        end
        ea = abs((vlast(i+1,1) - vlast(i,1))/vlast(i+1,1));
        i = i + 1;
    end
    y3(k+1, 1) = vlast(i,1);
end


%Ralston
y4 = zeros(StepFunc,1) ;
y4(1,1) = yi ;

for i = 1:StepFunc 
    
kay1 = diffy(t(i) , y4(i,1)) ;
kay2 = diffy((t(i)+(.75*h)) , (y4(i,1)+.75*kay1*h));
y4(i+1, 1) = y4(i,1) + ((1/3)*kay1 + (2/3)*kay2)*h ;

end



%Calculate True absolute error
why = diffy2(t) ;
errorEuler = abs((y - why)) ;
errorRunge = abs(y2 - why) ;
errorHeuns = abs(y3 -why) ;
errorRalston = abs(y4 - why) ;



%Plotting each Methods as a function of t
figure (1) ; 
plot(t , why ,'r') ;
title('t vs. Method') ;
hold on
plot(t , y , 'm') ;
hold on
plot( t ,y2 , 'k') ;
hold on
plot(t2 , y3 , 'g') ;
hold on ;
plot(t , y4 ,'b') ;
grid on


%Plotting error as a function of t
figure(2) ;
plot(t, errorEuler ,'r') ;
title('t vs. max error') ;
hold on
plot(t , errorRunge , 'm') ;
hold on
plot(t , errorHeuns , 'k' ) ;
hold on
plot(t , errorRalston , 'g') ;










