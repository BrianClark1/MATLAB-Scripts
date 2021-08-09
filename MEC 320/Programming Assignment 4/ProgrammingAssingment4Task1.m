%Programming Assignment 4 Task 1
%Nth Order Polynomial "Least-Squares" Regression

close all
clear
clc

M = importdata('PA4_Data.xlsx') ;
A = M.data.Task1 ;




s = 21 ;

%Find Sum of xi
xi = 0;

for i = 1:s
    xi = xi+A(i,1);
end

%Find Sum of yi
yi = 0 ;
for i = 1:s
    yi = yi+A(i,2) ;
end

%Find sum of xi2
xi2 = 0 ;
for i = 1:s
    xi2 = xi2 +(A(i,1))^2 ;
end

%Find sum of xi3
xi3 = 0;
for i = 1:s
    xi3 = xi3 +(A(i,1))^3 ;
end

%Find sum of xi4
xi4 = 0;
for i = 1:s
    xi4 = xi4 +(A(i,1))^4 ;
end

%Find sum of xi5
xi5 = 0;
for i = 1:s
    xi5 = xi5 +(A(i,1))^5 ;
end

%Find sum of xi6
xi6 = 0;
for i = 1:s
    xi6 = xi6 +(A(i,1))^6 ;
end

%Find sum of xi7
xi7 = 0;
for i = 1:s
    xi7 = xi7 +(A(i,1))^7 ;
end

%Find sum of xi8
xi8 = 0;
for i = 1:s
    xi8 = xi8 +(A(i,1))^8 ;
end

%Find sum of xi*yi
xiyi = 0;
for i = 1:s
    
    xiyi = xiyi +A(i,1)*A(i,2) ;
    
end

%Find sum of xi2*yi
xi2yi = 0;
for i = 1:s
    
    xi2yi = xi2yi +((A(i,1))^2)*A(i,2) ;
    
end

%Find sum of xi3*yi
xi3yi = 0;
for i = 1:s
    
    xi3yi = xi3yi +((A(i,1))^3)*A(i,2) ;
    
end

%Find sum of xi4*yi
xi4yi = 0;
for i = 1:s
    
    xi4yi = xi4yi +((A(i,1))^4)*A(i,2) ;
    
end


ym = yi/s ;

%Find St = Variation in Y
St = 0 ;
for i = 1:s 
    St = St + ((A(i,2)-ym)^2) ;
    
end


%Linear
Ai2 = [ 21 , xi ;       %Initialize Matrix
    xi, xi2 ; ];



bi2 = [ yi ;xiyi ] ;

vec1 = inv(Ai2)*bi2  ;

%Find Sr
Sr1 = 0 ;

for i = 1 : s 
    Sr1 = Sr1 + (A(i,2) - vec1(1,1)-vec1(2,1)*A(i,1))^2;
    
end
R21 = 1 - (Sr1/St);     %Find the Value of R squared
R1 = (R21)^.5;          %Find Value of R

for i = 1:s
    y1(i,1) = vec1(1,1) + vec1(2,1)*A(i,1) ;    %Corresponding y function
end







%Cubic

Ai3 = [ 21 , xi , xi2 , xi3 ;       %Initialize Matrix
    xi, xi2 , xi3 , xi4 ;
    xi2 , xi3 , xi4 , xi5 ;
    xi3 , xi4 , xi5 , xi6 ] ;

bi3 = [ yi ; xiyi ; xi2yi ; xi3yi ] ;

vec2 = inv(Ai3)*bi3 ;

%Find Sr
Sr2 = 0 ;

for i = 1 : s 
    Sr2 = Sr2 + (A(i,2) - vec2(1,1)-vec2(2,1)*A(i,1) - vec2(3,1)*((A(i,1))^2) - vec2(4,1)*((A(i,1)^3)))^2 ;
    
end
R22 = 1 - (Sr2/St) ;        %Find R squared
R2 = (R22)^.5;              %Find R

for i = 1:s
    y2(i,1) = vec2(1,1) + vec2(2,1)*A(i,1)+vec2(3,1)*(A(i,1))^2+vec2(4,1)*(A(i,1))^3 ;
end


%Fourth Order

Ai4 = [ 21 , xi , xi2 , xi3 , xi4 ;     %Initialize Matrix
    xi, xi2 , xi3 , xi4 , xi5 ;
    xi2 , xi3 , xi4 , xi5 , xi6 ;
    xi3 , xi4 , xi5 , xi6 , xi7 ;
    xi4 , xi5 , xi6 , xi7 , xi8 ] ;


bi4 = [ yi ; xiyi ; xi2yi ; xi3yi ; xi4yi ] ;

vec3 = inv(Ai4)*bi4 ;



%Find Sr
Sr3 = 0 ;

for i = 1 : s 
    Sr3 = Sr3 + (A(i,2) - vec3(1,1)-vec3(2,1)*A(i,1) - vec3(3,1)*((A(i,1))^2) - vec3(4,1)*((A(i,1)^3)) - vec3(5,1)*((A(i,1)^4)))^2 ;
    
end
R23 = 1 - (Sr3/St) ;           %Find R squared
R3 = (R23)^.5;                  %Find R

for i = 1:s
    y3(i,1) = vec3(1,1) + vec3(2,1)*A(i,1)+vec3(3,1)*(A(i,1))^2+vec3(4,1)*(A(i,1))^3+vec3(5,1)*(A(i,1))^4 ;
end

plot(A(:,1) , (A(:,2))) ;
hold on
plot(A(:,1) , y1(:,1) ) ;
hold on

plot(A(:,1) , y2(:,1)) ;
hold on
plot(A(:,1) , y3(:,1)) ;



 
 




 
 





    
 