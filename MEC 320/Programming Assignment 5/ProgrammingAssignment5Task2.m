%Central Finite Difference
close all
clear
clc
%Import the data
Matri = importdata('Data_PA5.xlsx') ; % Read Data from excel file
exceldata = Matri.data ; %Create a matrix for the data
n = length(exceldata) ;  %Get Matrix of length n
CFD = zeros(1,n); %Create empty Matrix with 3600 values

% intialize loops
for i = 1:3600
    
    if i == 1 ;
        jason = 3600 ;
        ethan = 2;
        
    else if i < 3600 ;
            jason = i-1 ;    %a value
            ethan = i+1 ;    % b value
            
        else if  i == 3600;
                jason = 3599 ;
                ethan = 1;
            end
        end
    end
    %Central Finite Difference Equation
    CFD(i) = (exceldata(ethan,4) - exceldata(jason,4)) / (.4) ;
    
    
    
end

[DerivMax, index ] = max(CFD) ;
PP = exceldata(index,2) ; %Value of Crank Angle at maximum derivative
%18.4 CA value MAX
[DerivMin, index2 ] = min(CFD) ;
PP2 = exceldata(index2, 2) ; %Value of Crank Angle at minimum derivative

% Oh4 Central Difference
for i = 1:3600
    if i < 3600 ;
        jason = i-1 ;       % a value
        ethan = i+1 ;       % b value
        craig = i-2 ;       % c value
        mynol = i+2 ;       % d value
    end
    
    if i == 1 ;
        jason = 3600 ;
        ethan = 2;
        craig = 3599 ;
        mynol = 3 ;
    end
    
    if i==2 ;
        jason = 1 ;
        ethan = 3 ;
        craig = 3600  ;
        mynol = 4
    end
    
    
    
    if i == 3599 ;
        jason = 3598 ;
        ethan = 3600 ;
        craig = 3597 ;
        mynol = 1 ;
    end
    
    
    if  i == 3600;
        jason = 3599 ;
        ethan = 1;
        craig = 3598 ;
        mynol = 2 ;
        
    end
    %Equation for Oh4 Central Finite Differece
    CFDOH4(i,1) = (-exceldata(mynol,4) + 8*(exceldata(ethan,4))-8*(exceldata(jason,4))+exceldata(craig,4)) / (2.4) ;
    
    
end

%Plot Central Finite Difference
figure (1)
plot(CFD , 'r')
xlabel('Crank Angle [degrees]')
ylabel('Central Finite Difference')
title('Central Finite Difference vs. Crank Angle') ;
hold on
plot(CFDOH4 , 'g--' )
grid on

%Plot the Ratio
ratio = CFD'./CFDOH4  ;
figure(2)
plot(exceldata(:,2), ratio) ;
xlabel('Crank Angle [degrees]')
ylabel('Ratio')
title('Crank Angle vs Ratio') ;
grid on


    
   
    
   


                
              
           