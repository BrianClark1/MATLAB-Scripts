%Trapezoidal Rule

close all
clear
clc
%Import Data
M = importdata('Data_PA5.xlsx') ;
E = M.data ; %Create Matrix composed of data

L = size(E) ;
LT = L(1,1)
Integra = 0 ;      %Intialize Values
i = 0 ;

for i = 901 : 2699 ;
    Integra = (Integra + (E(i+1,3) - E(i,3))*((E(i+1,4) + E(i,4))/2)) ;    %Trapezoidal Rule
end

%Work During entire engine process is .3468
%Work During Compression/Expansion is .3727