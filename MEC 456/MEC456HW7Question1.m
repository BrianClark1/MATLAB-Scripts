FIRST QUESTION ALL PARTS

%MEC 456 HW SET #7 QUESTION 1

%Initializing values taken from table A.4
E1 = 41 ;
E2 = 10.4 ;
v12 = .28 ;
v21 = .06 ;
G12 = 4.3 ; %GPA
Q66 = G12*1000000000 ;
%Given Loads
Nx = 200 ; %kN/m
Ny = 200 ; %kN/nm
Ns = 20  ; %kN/m
%total thickness of layers
h = 0.006 ;
F1 = 1140e6 ;
F2 = 39e6 ;
F6 = 89e6 ;




N= [200e3 ; 200e3 ; 20e3] ; %%kN/m




thick = 2 ; %mm

%Equations 4.56

Q11 = ((1000000000*E1) / (1-v12*v21)) ;
Q22 = ((1000000000*E2) / (1-v12*v21)) ;
Q12 = ((v21*1000000000*E1) / (1-v12*v21)) ;


%Establish Q Matrix

Q = [ Q11 Q12 0 ; Q21 Q22 0 ; 0 0 Q66] ;

%Equations 4.67

%Layer 1
theta1 = 0 ;

m = cos(deg2rad(theta1)) ;
n = sin(deg2rad(theta1)) ;

Qxx = m^4*Q11 + n^4*Q22 + 2*m^2*n^2*Q12 + 4*m^2*n^2*Q66 ;
Qyy = n^4*Q11 + m^4*Q22+2*m^2*n^2*Q12+4*m^2*n^2*Q66 ;
Qxy = m^2*n^2*Q11 + m^2*n^2*Q22 + (m^4+n^4)*Q12 - 4*m^2*n^2*Q66 ;
Qxs = m^3*n*Q11 - m*n^3*Q22 - m*n*(m^2 - n^2)*Q12 - 2*m*n*(m^2 - n^2)*Q66 ;
Qys = m*n^3*Q11 - m^3*n*Q22 + m*n*(m^2 - n^2)*Q12 + 2*m*n*(m^2 - n^2)*Q66 ;
Qss = m^2*n^2*Q11 + m^2*n^2*Q22 - 2*m^2*n^2*Q12 + (m^2 - n^2)^2*Q66 ;

QMaster1 = [ Qxx Qxy Qxs ; Qxy Qyy Qys ; Qxs Qys Qss ] ;

%Layer 2
theta2 = 30 ;

m = cos(deg2rad(theta2)) ;
n = sin(deg2rad(theta2)) ;

Qxx2 = m^4*Q11 + n^4*Q22 + 2*m^2*n^2*Q12 + 4*m^2*n^2*Q66 ;
Qyy2 = n^4*Q11 + m^4*Q22+2*m^2*n^2*Q12+4*m^2*n^2*Q66 ;
Qxy2 = m^2*n^2*Q11 + m^2*n^2*Q22 + (m^4+n^4)*Q12 - 4*m^2*n^2*Q66 ;
Qxs2 = m^3*n*Q11 - m*n^3*Q22 - m*n*(m^2 - n^2)*Q12 - 2*m*n*(m^2 - n^2)*Q66 ;
Qys2 = m*n^3*Q11 - m^3*n*Q22 + m*n*(m^2 - n^2)*Q12 + 2*m*n*(m^2 - n^2)*Q66 ;
Qss2 = m^2*n^2*Q11 + m^2*n^2*Q22 - 2*m^2*n^2*Q12 + (m^2 - n^2)^2*Q66 ;

QMaster2 = [ Qxx2 Qxy2 Qxs2 ; Qxy2 Qyy2 Qys2 ; Qxs2 Qys2 Qss2 ] ;

%Layer 3
theta2 = -45 ;

m = cos(deg2rad(theta2)) ;
n = sin(deg2rad(theta2)) ;

Qxx3 = m^4*Q11 + n^4*Q22 + 2*m^2*n^2*Q12 + 4*m^2*n^2*Q66 ;
Qyy3 = n^4*Q11 + m^4*Q22+2*m^2*n^2*Q12+4*m^2*n^2*Q66 ;
Qxy3 = m^2*n^2*Q11 + m^2*n^2*Q22 + (m^4+n^4)*Q12 - 4*m^2*n^2*Q66 ;
Qxs3 = m^3*n*Q11 - m*n^3*Q22 - m*n*(m^2 - n^2)*Q12 - 2*m*n*(m^2 - n^2)*Q66 ;
Qys3 = m*n^3*Q11 - m^3*n*Q22 + m*n*(m^2 - n^2)*Q12 + 2*m*n*(m^2 - n^2)*Q66 ;
Qss3 = m^2*n^2*Q11 + m^2*n^2*Q22 - 2*m^2*n^2*Q12 + (m^2 - n^2)^2*Q66 ;

QMaster3 = [ Qxx3 Qxy3 Qxs3 ; Qxy3 Qyy3 Qys3 ; Qxs3 Qys3 Qss3 ] ;

%Solve For The A matrix
a = zeros(3,3) ;
b = zeros(3,3) ;
d = zeros(3,3) ;

%SOLVE A B D
for i= 1:3
    for j =1:3
        a(i,j)= QMaster1(i,j)*(.003-.001) + QMaster2(i,j)*(.001--.001) + QMaster3(i,j)*(-.001--.003);
    end
end

for i= 1:3
    for j =1:3
        b(i,j)= 0.5*(QMaster1(i,j)*(.003^2-.001^2) + QMaster2(i,j)*(.001^2-(-.001)^2) + QMaster3(i,j)*((-.001)^2-(-.003)^2));
    end
end

for i= 1:3
    for j =1:3
        d(i,j)= 0.333333*(QMaster1(i,j)*(.003^3-.001^3) + QMaster2(i,j)*(.001^3-(-.001)^3) + QMaster3(i,j)*(-.001^3-(-.003)^3));
    end
end

%Part B Midplane Strains and Curvatures
%Inverse values and star values
Aneg1 = inv(a) ;
Bstar = -(Aneg1)*(b) ;
Cstar = (b)*(Aneg1) ;
Dstar = (d) - ((b)*(Aneg1))*(b) ;

%a b c d for the compliance matrix
format long
acomp = (Aneg1) -((Bstar)*(inv(d))*(Cstar)) ;
atest = (Aneg1) -(Bstar)*(inv(d))*(Cstar) ;
bcomp = (Bstar)*(inv(Dstar)) ;
ccomp = -(inv(Dstar))*(Cstar) ;
dcomp = (inv(Dstar)) ;

sigmax = (1/h)*N(1) ; %Mx
sigmay = (1/h)*N(2) ; %My
taus = (1/h)*N(3) ; %Ms

M = [sigmax*(0.001)^(2) ; sigmay*(0.001)^2 ; taus*(0.001)^(2)]  ; %Moment Matrix

eo = acomp *N + bcomp*M ; %Strain x y direction
k = ccomp*N + dcomp*M ; %Curvature x y direction

%Part C formula 7.8
e = eo + 0.001*k ;

%Part D Safety Factors per Tsai Hill
%Find According Stresses for each ply
Stress1 = QMaster1*eo + 0.002*(QMaster1*k) ;
Stress2 = QMaster2*eo + 0*(QMaster2*k) ;
Stress3 = QMaster3*eo - 0.002*(QMaster3*k) ;


%Tsai Hill Value for each Ply
TsaiHill1 = ((Stress1(1))^2 /F1^2 ) + (Stress1(2)^2 / F2^2 ) + (Stress1(3)^2/F6^2) - ((Stress1(1)*Stress1(2)) / F1^2)  ;
TsaiHill2 = ((Stress2(1))^2 /F1^2 ) + (Stress2(2)^2 / F2^2 ) + (Stress2(3)^2/F6^2) - ((Stress2(1)*Stress2(2)) / F1^2)  ;
TsaiHill3 = ((Stress3(1))^2 /F1^2 ) + (Stress3(2)^2 / F2^2 ) + (Stress3(3)^2/F6^2) - ((Stress3(1)*Stress3(2)) / F1^2)  ;
%Safety Factor for each ply
SF1 = sqrt(1/TsaiHill1) ;
SF2 = sqrt(1/TsaiHill2) ;
SF3 = sqrt(1/TsaiHill3) ;

%Placing Safety Factors into Matrix Form
FOS= [ SF1 ; SF2 ; SF3  ] ;
%Finding the Minimum factor of safety
min(FOS)

%Part E

%N is Nx Ny Ns for each ply respectively
N1 = QMaster1*eo*.002+QMaster1*k*((0.003^(2)-0.001^(2))/2) ;
N2 = QMaster2*eo*.002+QMaster2*k*((0.001^(2)-0.001^(2))/2) ;
N3 = QMaster3*eo*.002+QMaster3*k*((0.001^(2)-0.003^(2))/2) ;

AA = N1+N2+N3 ;

%Percentage of each Ply 1-3

Percent1 = N1/AA ;
Percent2 = N2/AA ;
Percent3 = N3/AA ;
