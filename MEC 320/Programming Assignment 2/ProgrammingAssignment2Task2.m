%Brian Clark
%Find inverse of a matrix using Crout LU decompostion without Pivoting

close all
clear
clc

%Original Matrix
A = [-1,3,2,-3,-3,4,2,7,;
    20000,20000,-100000,-50000,10000,-20000,5000;\
    100000,100000,9990,-40000,-30000,20000,-10000,60000;
    -2,4,1,3,3,0,7,2,;
    1,3,2,7,0,2,2,4;
    .000001,.000003,.000002,-.0000004,.0000001,.000001,.000002,.000002;
    10,-5,5,-8,7,4,6,3;
    2,-5,-2,-14,6,7,2,9;]

b = [1,-1,2,-2,3,100,-3,4] %Solution Matrix

%A=LU_
U=zeros(length(A)); %Lower Triangular Matrix
L=zeros(Length(A)); %Upper Triangular Matrix
s=length(A);
k=length(A);

for i=1:n
    L(i,1)=A(i,1);
    U(i,i)=1;
end
for j=2:n
    U(1,j)=A(1,j)/L(1,1);
end
for i=2:n
    for j=2:i
        L(i,j)=A(i,j)-L(i,1:j-1)*U(1:j-1,j);
    end
     for j=i+1:n
        U(i,j)=(A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
     end
end

inverse=zeroes(size(A);


    
    
    


  