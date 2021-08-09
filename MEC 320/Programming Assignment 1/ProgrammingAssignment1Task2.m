close all
clear
clc

%F=e^x - 4x
%G= 1/4(e^x)



%Fixed Point
es=0.001; %Error Threshold
xr=3; %Initial GUess
ea=1;
i=0;
g = @(x) log(4*x);
FPerror=zeros(1,13);

while ea>es
        i=i+1;
    xrold=xr
    xr=g(xrold);
    if xr~=0
        ea=abs((xr-xrold)/xr)*100;
    end
       FPerror(i)=ea;
    if es > ea
        break
    end



end

FPiter=i

XVal=1:i;
error=zeros(size(FPerror));
for j = 2:i
error(j)=FPerror(j)/FPerror(j-1);
end

figure
semilogy(error,'linewidth',2)
xlabel('Iteration')
ylabel('Error Ratio')
ylim([0 0.5])
grid on

% This is the code for a task. Under the "Publish" tab, click "Publish" and
% copy the code in that format into your word document.
