clear;
close;
CS = crystalSymmetry('432');
SS = specimenSymmetry('mmm');
h = Miller(0,0,1,CS,SS);

%% Successive orientaions of grains

%grain 1
% o1 = orientation('Euler',[138.41,14.24,71.71]*degree,CS,SS);
% o2 = orientation('Euler',[140.00,14.44,69.96]*degree,CS,SS);
o3 = orientation('Euler',[132.08,15.89,76.61]*degree,CS,SS);
o4 = orientation('Euler',[126.33,17.07,80.59]*degree,CS,SS);
% o5 = orientation('Euler',[121.11,18.72,83.06]*degree,CS,SS);

mo = orientation(o3,o4);
ax = axis(mo);
ang = angle(mo);
axis = round(Miller(ax ,CS))
% axis = round(Miller(ax(1),ax(2),ax(3) ,CS))
ang = ang/degree
