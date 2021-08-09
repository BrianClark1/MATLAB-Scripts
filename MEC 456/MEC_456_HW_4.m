%Homework Set 4 Problem 1
%Composite Initial Values
e1=110;
e2=15;
g12=8;
v12=0.1;

%iteration counter
k=0;

%Intializing theta
for angle=0:1:90

k=k+1;
Angle(k,1)=angle;
%saving the iterative angle values
  
%Standard forumla computations

ex(k,1)=1/(((1/e1)*cosd(angle)^4)+((1/g12)-(2*v12/(e1))*sind(angle)^2*cosd(angle)^2)+(1/e2)*sind(angle)^4);

ey(k,1)=1/(((1/e1)*sind(angle)^4)+((1/g12)-(2*v12/(e1))*sind(angle)^2*cosd(angle)^2)+(1/e2)*cosd(angle)^4);

gxy(k,1)=1/((2*(2/e1+2/e2+(4*v12/(e1))-1/g12)*sind(angle)^2*cosd(angle)^2)+(1/g12)*(sind(angle)^4+cosd(angle)^4));
  
vxy(k,1)=ex(k,1)*(((v12/e1)*(sind(angle)^4+cosd(angle)^4))-((1/e1+1/e2-1/g12)*sind(angle)^2*cosd(angle)^2));
  

shearxy(k,1)=ex(k,1)*((2/e1+(2*v12/(e1))-1/g12)*sind(angle)*cosd(angle)^3-(2/e2+(2*v12/(e1))-1/g12)*sind(angle)^3*cosd(angle));

end


%Graph Number one ex/e1
figure(1)
plot(Angle,ex/e1)
grid('on')
xlabel('angle','FontSize',10,'FontWeight','bold','Color','b')
ylabel('ex/e1','FontSize',10,'FontWeight','bold','Color','g')


%Graph Number 2 ey/e2 
figure(2)
plot(Angle,ey/e2)
grid('on')
xlabel('angle','FontSize',10,'FontWeight','bold','Color','b')
ylabel('Ey/E2','FontSize',10,'FontWeight','bold','Color','g')


%Graph Number 3 gxy/g12
figure(3)
plot(Angle,ex/e1)
grid('on')
xlabel('theta','FontSize',10,'FontWeight','bold','Color','b')
ylabel('Gxy/G12','FontSize',10,'FontWeight','bold','Color','g')

%Graph Number 4 vxy/v12
figure(4)
plot(Angle,ex/e1)
grid('on')
xlabel('angle','FontSize',10,'FontWeight','bold','Color','b')
ylabel('\nu_{xy}/\nu_{12}','FontSize',10,'FontWeight','bold','Color','g')

%graph Numner 5 nxs/Ex
figure(5)
plot(Angle,ex/e1)
grid('on')
xlabel('angle','FontSize',10,'FontWeight','bold','Color','b')
ylabel('\eta_{xy}/ex','FontSize',10,'FontWeight','bold','Color','g')