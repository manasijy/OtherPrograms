clear;
close;
cs = crystalSymmetry('triclinic');
oR_all = fundamentalRegion(cs);
plot(oR_all);
rotZ = orientation('axis',zvector,'angle',180*degree,cs);

hold on
plot(rotZ,'MarkerColor','b','MarkerSize',10)
hold off

% rotations about the x- and y-axis about 30,60,90 ... degree
rotX = orientation('axis',xvector,'angle',(-180:30:180)*degree,cs);
rotY = orientation('axis',yvector,'angle',(-180:30:180)*degree,cs);

hold on
plot(rotX,'MarkerColor','r','MarkerSize',10)
plot(rotY,'MarkerColor','g','MarkerSize',10)
hold off

%%
figure;
plotSection(rotZ,'MarkerColor','b','axisAngle',(30:30:180)*degree)
hold on
plotSection(rotX,'MarkerColor','g')
hold on
plotSection(rotY,'MarkerColor','r')
hold off
%%
cs = crystalSymmetry('222');
oR = fundamentalRegion(cs);

close all
plot(oR_all)
hold on
plot(oR,'color','r')
% hold off

%%

mtexdata forsterite
hold on
plot(ebsd('Fo').orientations);
% hold off
ori =  ebsd('Fo').orientations.project2FundamentalRegion;

hold on
plot(ori,'MarkerColor','g')
hold off