close all

clc

 anguloin = 'introduzca el valor (grados) de la primera articulacion:';
 theta1_deg = input(anguloin);
 theta1_Rad = deg2rad(theta1_deg);
 
 anguloin = 'introduzca el valor (grados) de la segunda articulacion:';
 theta2_deg = input(anguloin);
 theta2_Rad = deg2rad(theta2_deg);


    
 for theta1_Rad=0:0.1:theta1_Rad
clf  
PrintAxis();
p1=[0;0;0];
L1=8;
L2=5;


TRANSz1 = [cos(theta1_Rad) -sin(theta1_Rad) 0 0;sin(theta1_Rad) cos(theta1_Rad) 0 0;0 0 1 0;0 0 0 1]; %%  
%%
%%    Matriz Homogenea Z
%          | cos(?)  -sen(?)  0 |  0   X
%          |                    |
%          | sen(?)   cos(?)  0 |  0   Y
%     TRZ =|                    |
%          |   0        0     1 |  0   Z
%          |____________________|___
%          |   0        0     0  1
%          |

%%
TRANSPOSICIONx1 = [1 0 0 L1;0 1 0 0; 0 0 1 0; 0 0 0 1];


%%    Matriz de transformación de Posición
%          |   1      0     0 |  L1   X
%          |                  |
%          |   0      1     0 |  0    Y
%     TRX =|                  |
%          |   0      0     1 |  0    Z
%          |__________________|___ 
%          |   0      0     0 |  1
%          |

%//////////////////////////////////////////////////////////////////////////
T1=TRANSz1*TRANSPOSICIONx1;
p2=T1(1:3,4);
v1x=TRANSz1(1:3,1);
v1y=TRANSz1(1:3,2);



line([p1(1) p2(1)],[p1(2) p2(2)],[p1(2) p2(2)],'color',[0 0 0],'linewidth',5)
line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(2) v1x(2)],'color',[1 0 0],'linewidth',5)
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(2) v1y(2)],'color',[0 1 0],'linewidth',5)
pause(0.1);
 end
 

 
 for theta2_Rad=0:-0.1:theta2_Rad
     clf
     %%
     PrintAxis();

     
TRz2 = [cos(theta2_Rad) -sin(theta2_Rad) 0 0;sin(theta2_Rad) cos(theta2_Rad) 0 0;0 0 1 0;0 0 0 1];
TRx2 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRz2*TRx2;



Tf=T1*T2;
p3=Tf(1:3,4);
v3x=p3+Tf(1:3,1);
v3y=p3+Tf(1:3,2);
v1x=TRz1(1:3,1);
v1y=TRz1(1:3,2);

line([p2(1) p3(1)],[p2(2) p3(2)],[p2(2) p3(2)],'color',[0.6 0 0.8],'linewidth',5)

line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(2) v1x(2)],'color',[1 0 0],'linewidth',5)
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(2) v1y(2)],'color',[0 1 0],'linewidth',5)

v2x=p2+T1(1:3,1);
v2y=p2+T1(1:3,2);
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(2) v2x(2)],'color',[1 0 0],'linewidth',5)
line([p2(1) v2y(1)],[p2(2) v2y(2)],[p2(2) v2y(2)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(2) v3x(2)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(2) v3y(2)],'color',[0 1 0],'linewidth',5)

pause(0.1);
 end