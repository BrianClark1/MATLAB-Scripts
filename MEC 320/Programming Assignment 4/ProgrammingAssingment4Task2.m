%Programming Assignment 4 Task 2
%Lagrange's Interpolating Polynomials

close all
clear
clc

M = importdata('PA4_Data.xlsx') ;
N = M.data.Task2 ;



x = 6.7 ;           %Initial Values


n = 3 ;             %Initial Values

funcx = 0 ;

[k,z] = size(N); %For any N by N matrix

for y  = 1 : k
    dist(y,1) = abs(N(y,1) - x);            %Create distance function
    
end



for  i = 1 : k 
    
    
    for w = i+1 : k
        
        
        
    if dist(i,1) < dist(w,1)
           
        
        
    else dist(i,1) > dist(w,1);
        E = 0 ;
        E = dist(i,:) ;
        dist(i,:) = dist(w,:) ;
        dist(w,:) = E ;
        
        
        q = 0 ;
        q = N(i,:) ;
        N(i,:) = N(w,:) ;
        N(w,:) = q ;
        
      
        
        
    end
    end
end
 
       



for i = 1 : n+1
    Li = 1 ;
    for j = 1:n+1
        
        if j ~= i
            xi = N(i,1) ;
            xj = N(j,1) ;
            
            Li = Li*(x-xj)/(xi-xj) ;     %L
        end   
    end
    
    funcx =  funcx + Li*(N(i,2))   ;
end

%Original Data
figure(1)
plot(N , 'o') ;

hold on

%X=7.6
T = [4.8785 , 5.2438 , 5.5196 ] ;
plot(T , '-s') ;

hold on

%X=8.4
H = [4.4655 , 4.8308 , 4.5549 ] ;
plot(H , '-s') ;

hold on

%Extrapolated
V = [ 3.9733 , 3.3797 , 2.6432 ] ;
plot(V , '-s') ;



grid on

