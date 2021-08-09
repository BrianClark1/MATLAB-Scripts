OPTIONAL SECOND QUESTION:
%MEC 456 HW SET #7 QUESTION 2
close all
clear
clc



Vf = 0.63 ;%Fiber volume ratio
Densiy = 1.60 ;
E1 = 147 ; %Gpa
E2 = 10.3 ; %GPa
G12 = 7.0e9 ; %GPa
v12 = 0.27 ;
v21 = 0.02 ;
F1t = 2280e6 ;%MPa Longitudinal Tensile Stength
F2t =  57e6 ;  %MPa Tranverse Tensile Strength
F6 = 76e6 ; %MPa In-Plane Shear Strength
F1c = 1725e6 ;


Q11 = ((1000000*E1) / (1-v12*v21)) ;
Q22 = ((1000000*E2) / (1-v12*v21)) ;
Q21 = ((v21*1000000*E1) / (1-v12*v21)) ;
Q66 = G12 ;



%Establish Q Matrix

MainQ = [ Q11 Q21 0 ; Q21 Q22 0 ; 0 0 Q66] ;

%Equations 4.67

%Layer 1
theta1 = 0 ;

m = cos(deg2rad(theta1)) ;
n = sin(deg2rad(theta1)) ;

Qxx = m^4*Q11 + n^4*Q22 + 2*m^2*n^2*Q21 + 4*m^2*n^2*Q66 ;
Qyy = n^4*Q11 + m^4*Q22+2*m^2*n^2*Q21+4*m^2*n^2*Q66 ;
Qxy = m^2*n^2*Q11 + m^2*n^2*Q22 + (m^4+n^4)*Q21 - 4*m^2*n^2*Q66 ;
Qxs = m^3*n*Q11 - m*n^3*Q22 - m*n*(m^2 - n^2)*Q21 - 2*m*n*(m^2 - n^2)*Q66 ;
Qys = m*n^3*Q11 - m^3*n*Q22 + m*n*(m^2 - n^2)*Q21 + 2*m*n*(m^2 - n^2)*Q66 ;
Qss = m^2*n^2*Q11 + m^2*n^2*Q22 - 2*m^2*n^2*Q21 + (m^2 - n^2)^2*Q66 ;

QMaster1 = [ Qxx Qxy Qxs ; Qxy Qyy Qys ; Qxs Qys Qss ] ;

%Layer 2
theta2 = 90 ;

m = cos(deg2rad(theta2)) ;
n = sin(deg2rad(theta2)) ;

Qxx = m^4*Q11 + n^4*Q22 + 2*m^2*n^2*Q21 + 4*m^2*n^2*Q66 ;
Qyy = n^4*Q11 + m^4*Q22+2*m^2*n^2*Q21+4*m^2*n^2*Q66 ;
Qxy = m^2*n^2*Q11 + m^2*n^2*Q22 + (m^4+n^4)*Q21 - 4*m^2*n^2*Q66 ;
Qxs = m^3*n*Q11 - m*n^3*Q22 - m*n*(m^2 - n^2)*Q21 - 2*m*n*(m^2 - n^2)*Q66 ;
Qys = m*n^3*Q11 - m^3*n*Q22 + m*n*(m^2 - n^2)*Q21 + 2*m*n*(m^2 - n^2)*Q66 ;
Qss = m^2*n^2*Q11 + m^2*n^2*Q22 - 2*m^2*n^2*Q21 + (m^2 - n^2)^2*Q66 ;

QMaster2 = [ Qxx Qxy Qxs ; Qxy Qyy Qys ; Qxs Qys Qss ] ;

for i = 1:1:3
    for j=1:1:3
        LargeA(i,j) = 2*(QMaster1(i,j)+QMaster2(i,j)) ;
    end
end

SigmaX = (1/4)*(LargeA(1,1)-LargeA(1,2)^(2)/LargeA(2,2))
Vxy = LargeA(1,2)/LargeA(2,2)

Smalle = [ 1/SigmaX ; -Vxy/SigmaX ; 0] ;
MainQ = [Q22 Q21 0 ; Q21 Q11 0 ; 0 0 Q66] ;
stresses = MainQ*Smalle;

sigmaxs = [-F1c / stresses(2) F2t/stresses(1)]
min(sigmaxs)/1e6
