close all
clear
clc

%initial upper and lower bounds
xl = .5; %Lower Bound
xu = 4; %Upper Bound


%Initial Equation
f = @(x) exp(-x).*sin(x); %Anonymous Function

%False-Position Method
%ea = iteration error
%es = stopping criterion
%es = (0.5 * 10^(2-n))
%n = number of significant figures
xr = xl - (f(xl)*(xu-xl))/(f(xu)-f(xl)); %Initial Xr
es = (0.5 * 10^-4); %Error Threshold
ea = abs(((xr - xl)/(xr + xl))); %Error on iteration

FPGuesses=[0];
NRGuesses=[0];
i=0;

while ea>es
    i = i+1; %Counter
    fxl = f(xl) ; %Iteration Lower Bound
    fxu = f(xu); %Iterarion Upper Bound
    xr = xl - (f(xl)*(xu-xl))/(f(xu)-f(xl));
    func_xr=exp(-xr)*sin(xr);


    if f(xr)*f(xl)<0 %Rearranges Boundaries Based on guess
        ea = abs(((xr - xu)/(xu)));
        xu = xr;

    elseif f(xr)*f(xl)>0
        ea = ((xr - xl)/(xl))*100;
        xl = xr;


    end
    FPGuesses=[FPGuesses xr];
end

FPAnswer=xr;
FPiters=i;

% This is the code for a task. Under the "Publish" tab, click "Publish" and
% copy the code in that format into your word document.


%Newton Raphson
step = .15;
xr = 4;%Initial Guess
es = (0.5 * 10^-4); %Error Threshhold
ea = 1;
while ea>es
    i=i+1; %Counter
    df=f((xr+step)-f(xr-step))/(2*step); %Derivative
    xi=xr-f(xr)/df;
    ea=(xi-xr)/xi;
    xr=xi;
    NRGuesses=[NRGuesses xr];
end

X = 0:.01:13;
Y= f(X);
figure
plot(X,Y,'linewidth',2)
xlabel('x')
ylabel('f(x)')
title('f(x) = e^-x * sin(x)')

NRGuess=xr;
NRiters=i;

% This is the code for a task. Under the "Publish" tab, click "Publish" and
% copy the code in that format into your word document.
