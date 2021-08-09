%Brian  Clark
%Gauss Seidal Iterative Method 
%Matrix must be strictly diagonally dominant/symmetric positive


%Original Matrix
A = [1,0,4,-1,2;
    4,-1,4,11,2;
    12,4,-3,-3,2;
    3,3,-3,4,12;
    -1,3,0,1,1;];
%Solution Vector
B = [13,12,3,10,4];
%Intializing 
AB=[A B]; %Augmented Matrix
n=length(A);
x=zeros(n,1);


%Rearrange to become diagonally dominant
for i = 1:n
    [M,D]=max(A(:,i));
    
    if i~=D 
        swap=A(i,:);
            A(i,:)=A(D,:);
            A(D,:)=swap;
            
                
           swap=B(i);
           B(i)=B(D);
           B(D)=swap;
    end
end

%GS Iterations
es= .0005; %approximate error 
ea=1;
err=(n;1);
iter=0;
while (ea>es)&&(iter<100)
    iter=iter+1
    
for k = 1:n
    series = 
    
    x(k) = series/A(k,k);
    
    

end







    
    


