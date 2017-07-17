clear;

cs = crystalSymmetry('cubic');
ss = specimenSymmetry('mmm');

%% Creating the grid about an ideal orientation say brass 

phi1_idl = 35;
phi_idl = 45;
phi2_idl = 0;

v1= (phi1_id-20):5:(phi1_idl + 20);
v2= (phi_id-20):5:(phi_idl + 20);
v3= (phi2_id-20):5:(phi2_idl + 20);
[X, Y,Z] = meshgrid(v1,v2,v3);

%% Now converting the grid to phi1,phi, phi2 coordinate arrays. 

phi1 = reshape(X,[],1);
phi  = reshape(Y,[],1);
phi2 = reshape(Z,[],1);
eul_ini = [phi1, phi, phi2]*degree;

% To reconvert
% xx1 = reshape(phi1,9,9,9);
% yy2  = reshape(phi,9,9,9);
% zz3 = reshape(phi2,9,9,9);

%% 
% The final orientation after lattice spin 

%%
%To be provided from vpsc
eul_fin = [phi1_f, phi_f, phi2_f]*degree;

%% 


o_ini = orientation('Euler',eul_fin,cs,ss).project2FundamentalRegion;
o_fin = orientation('Euler', eul_ini,cs,ss).project2FundamentalRegion;

%% Finding the change in euler angles

del_phi1 = o_fin.phi1 - o_ini.phi;
del_phi = o_fin.phi - o_ini.phi;
del_phi2 = o_fin.phi2 - o_ini.phi2;




%% Finding the rotaion vector from euler angles of rotation
 
mori = inv(o_ini)*o_fin;
rotm = quat2rotm(mori.quat);
omega21_dot = rotm(2,1);
omega32_dot = rotm(3,2);
omega13_dot = rotm(1,3);

%%
% Finding the rates of change of euler angles according to bunge and toth
% method

phi1_dot = omega21_dot -phi2*cosd(phi);
phi_dot = omega32_dot*cosd(phi1) + omega13_dot*sind(phi1);
phi2_dot = (omega32_dot*sind(phi1) - omega13_dot*cosd(phi1))/sind(phi)
%%

p = Euler(new_gmatrix(:,(j+1)));%/degree;
%% 
% delp = p - p0;



o1 = orientation('Euler', p*degree,cs,ss);
o0 = orientation('Euler', p0*degree,cs,ss); 
del_O = Euler(o1)/degree - Euler(o0)/degree;

toc



% mori = inv(ori1) * ori2

