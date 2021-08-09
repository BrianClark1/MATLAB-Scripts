%MEC 422 Homework #2 Part 2.
%Generating Moody-Chart with Chen & Churchill & Darcy-Weisbach equations


clear all;
clc;

% For Re, 300 data points are used to see neat plot. 
Re = logspace(0,9,300);             % Vector for Re = (1~10^9)
% ep_D : epsilon/D data points are given in the text book (pp. 91)
ep_D = [0.0, 0.000005, 0.00001, 0.00005, 0.0001, 0.0002, ...
    0.0004, 0.0006, 0.0008, 0.001, 0.002, 0.004, 0.006, ...
    0.008, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.7];

f1 = zeros(size(Re));               % Matrix for f1 : friction factor 1
f2 = zeros(size(Re));               % Matrix for f2 : friction factor 2
                                    % f1 is for the laminar flow regime
                                    % f2 is for the turbulent flow regime
Mat_ep_D = size(ep_D,2);            % Matrix for ep/D
Mat_Re = size(Re,2);                % Matrix for Re
hold on

%title ('Moody diagram constructed with Chen equation');
title ('Moody diagram constructed with Churchill''s formula');
xlabel ('Re','FontWeight','Bold','FontSize',12);
ylabel ('f','FontWeight','Bold','FontSize',12);
yticks([0.005 0.006 0.007 0.008 0.009 0.01 0.015 0.02 0.025 ...
    0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.6]);


% Axis limits to depict Fig 3.3 in the textbook.
ylim([0.005 0.1]);
xlim([600 10^8]);
grid on;
set(gca, 'Xscale','log','Yscale','log');


for i=1:Mat_ep_D                    % For every roughness value

    for j=1:Mat_Re                  
        if Re(j) < 2100             % For the laminar flow
            % Darcy-Weisbach formula
            f1(j) = 64/Re(j);
            
        elseif Re(j) >= 2100            % For the turbulent flow
            B1 = ( 2.457*log( 1/( ( 7/Re(j) )^0.9 + ...
                ( 0.27 * ep_D(i) ) ) ) )^16;
            B2 = ( 37530/Re(j) )^16;
            % Churchill's formula 
            f2(j) = 8*( ( 8 / Re(j) )^12 + 1 /( B1 + B2 )^1.5 )^( 1/12 );
            % Chen equation
            %f2(j) = ( -2.0 * log10( ep_D(i)/(3.7065) - (5.0452/Re(j))*...
                %log10((1/2.8257)*ep_D(i)^(1.1098) + 5.8506/(Re(j)^(0.8981)))))^-2;
        end
        
    end
    loglog(Re,f1,'LineWidth',1.3); % Create a line for each roughness value             
    loglog(Re,f2,'LineWidth',1.3); % Create a line for each roughness value
    
    % Relative roughness legend
    if ep_D(i) == 0.0
        text(10^8,f2(j),sprintf('   0 (smooth)'),'FontSize',9);
    else
        text(10^8,f2(j),sprintf('   %1.6f',ep_D(i)),'FontSize',9);
    end
    text(10^8,0.1,'   \epsilon/D', 'FontSize',12);
end


%Additional question : Calculate f when Re=5.437*10^6 and e/D=0.00153
%Since Re >= 2100, use Churchill's formula
Re_given = 5.437 * 10^6;
ep_D_given = 0.00153;
B1 = ( 2.457*log( 1/( ( 7/Re_given )^0.9 + ( 0.27 * ep_D_given ) ) ) )^16;
B2 = ( 37530/Re_given )^16;
% Churchill's formula 
f1 = 8*( ( 8 / Re_given )^12 + 1 /( B1 + B2 )^1.5 )^( 1/12 )
% Plot the point on the same graph
hold on
s = plot(Re_given,f1,'r*');
legend(s,'f = 0.0219 for given Re and \epsilon/D', 'Location',...
    'SouthWest','FontSize',10);

