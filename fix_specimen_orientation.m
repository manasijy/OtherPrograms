CS = crystalSymmetry('-43m');
SS = specimenSymmetry('orthorhombic');
% h = [Miller(0,0,1,CS),Miller(0,1,1,CS),Miller(1,1,1,CS)];
r = [ rotation('euler', 90*degree,35*degree,30*degree), ...
     rotation('euler', 90*degree,35*degree,0*degree)];
sr = SS*r; %Covarient rotation is applied on the RHS
odf = unimodalODF(sr,CS,SS);
% define a rotational displacement
r2 = rotation('euler', 6*degree,4*degree,0*degree);
odf = rotate(odf,r2);
h = [Miller(0,0,1,CS),Miller(0,1,1,CS),Miller(1,1,1,CS)];
plotPDF(odf,h,'antipodal');
%             now retrive the rotation back
%               [odr,r,v1,v2] = centerSpecimen(odf);
%             plotPDF(odr,h,'antipodal')