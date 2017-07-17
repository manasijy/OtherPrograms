clear;
close;
CS = crystalSymmetry('-43m');
SS = specimenSymmetry('orthorhombic');
h = Miller(1,1,1,CS);
r = vector3d(0,0,1);
odf = fibreODF(h,r,SS); 

h1 = Miller(1,1,0,CS);
r1 = vector3d(0,0,1);
odf1 = fibreODF(h1,r1,SS);

odf = 0.5*odf+ 0.5*odf1;

o = calcOrientations(odf,500);
plotPDF(o,Miller(1,1,1,CS),'contourf')
figure
scatter(o)
pbaspect([1 1 1])