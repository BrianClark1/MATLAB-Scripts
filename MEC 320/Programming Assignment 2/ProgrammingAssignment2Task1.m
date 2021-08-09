%Brian Clark Programming Assignment 2 Task 1
%Solve Ax=b using gauss elimination without pivoting
%Compare to gauss elimination with pivoting
clc
clear
close all


A = [-1,3,2,-3,-3,4,2,7;
    20000,20000,-100000,-50000,10000,0,-20000,50000;
    100000,100000,9990,-40000,-30000,20000,-10000,60000;
    -2,4,1,3,3,0,7,2;
    1,3,2,7,0,2,2,4;
    0.000001,0.000003,0.000002,-0.0000004,-0.0000001,0.000001,0.000002,0.000002;
    10,-5,5,-8,7,4,6,3;
    2,-5,-2,-14,6,7,2,9;];

b = [1;-1;2;-2;3;100;-3;4;]; %Solution Vector


%Dimensions of A are n by n
%Dimensions of b are n by k
%x is the solution matrix and its dimensions are n by k
%Ax=b
n=length(b); %Number of Columns
x=zeros(n,1); %Creating X Value Vector 


%GE with Partial Pivoting
%Forward Elimination

for k=1:n-1 %Indexes through rows to perform swapping
    
    max=0; %Searches for the maxmimum in the column
    for m=k:n
        if abs(A(m,k))>abs(max)
            max=A(m,k);
            index=m;
        end
    end
    
    %Swaps rows such that the MAX in A ios along the diagonal
    dummyA=A(i,1:n);  %Translational Function
    A(i,1:n)=A(k,1:n);
    A(k,1:n)=dummyA;
    
   dummyB= b(i); 
   b(i)=b(k);
   b(k)=dummyB;
   
   for i=k+1:n
       ratio=A(i,k)/A(k,k);
       for j=k:n
          A(i,j)= A(i,j)-ratio*A(k,j);
       end
       b(i)=b(i)-ratio*b(k);
   end
end
disp([A b]);

%Backward Substitution 
x=zeros(n,1);
    sum=0;
    for j=i+1:n
        sum=sum+A(i,j)*x(j);
    end
    x(i)=(b(i)-sum)/A(i,i);
    
   
    
    error = b- A*x;
    
    


       
   
            
        











   
 

    
    

    