

vf=0:0.1:1;

vm=1-vf;

E2f=12;

Em=3;

z=1;

num=0.3;

%%%%%MECHANICS OF MATERIAL APPROACH%%%

E2M=(E2f.*Em)./(vf.*Em)+((1-vf).*E2f);

y1=E2M./Em;

%%%%%Halpin Tsai Approach%%%%%%

e=((E2f./Em)-1)./((E2f./Em)+z);

E2H=((1+(z.*e.*vf))*Em)./(1-(e.*vf));

y2=E2H./Em;

plot(vf,y1,'linewidth',1.5)

hold on;

plot(vf,y2,'linewidth',1.5)

legend('Mechanics of Materials','Halpin Tsai')

xlabel ('Vf','fontweight','bold', 'fontsize', 15)

ylabel ('E/Em','fontweight','bold', 'fontsize', 15)