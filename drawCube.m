function drawCube ( origin, size )
x=([0 1 1 0 0 0;1 1 0 0 1 1;1 1 0 0 1 1;0 1 1 0 0 0]-0.5)*size(1)+origin(1)+size(1)/2;
y=([0 0 1 1 0 0;0 1 1 0 0 0;0 1 1 0 1 1;0 0 1 1 1 1]-0.5)*size(2)+origin(2)+size(2)/2;
z=([0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1]-0.5)*size(3)+origin(3)+size(3)/2;
for i=1:6
    h=patch(x(:,i),y(:,i),z(:,i),'w');
    set(h,'edgecolor','r')
    set(h,'FaceColor','g')
end
direction = [0 1 0];
alpha = pi/4;
rotate(h,direction,alpha)
direction = [1 0 0];
alpha = pi/3;
rotate(h,direction,alpha)
az = 30;
el = 45;
view(az, el); %view(ax,...)
%  rotate3d on  it activates rotation
% camorbit(dtheta,dphi)



% s=input('side: ');
% x=[0 1 1 0 0 0;1 1 0 0 1 1;1 1 0 0 1 1;0 1 1 0 0 0]*s;
% y=[0 0 1 1 0 0;0 1 1 0 0 0;0 1 1 0 1 1;0 0 1 1 1 1]*s;
% z=[0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1]*s;
% for i=1:6
% %     h=patch(x(:,i),y(:,i),z(:,i),'k');
%     h=patch(x,y,z,'y');
%     set(h,'edgecolor','r')
% end