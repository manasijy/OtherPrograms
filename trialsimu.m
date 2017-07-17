% myworld = vrworld('myfcc.wrl','new');
myworld = vrworld('cube_model.wrl','new');
open(myworld);
fig = vrfigure(myworld);
cube = vrnode(myworld,'Crystal');
euler = [0,45,90]*degree;
phi1 = euler(1);
Phi = euler(2);
phi2 = euler(3);
% prompt('Please enter phi1,phi,phi2')
% [phi1,Phi,phi2] = str2double(textscan(input(prompt)));
rot_v = SpinCalculator('EA313toEV',[phi1,Phi,phi2],0.01,0);
cube.rotation = rot_v;
vrdrawnow;
