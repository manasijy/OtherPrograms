clear;
close;


CS = crystalSymmetry('432');
SS = specimenSymmetry('mmm');
h = Miller(0,0,1,CS,SS);
load('FCC_SS24_Set','SlipSystem');
%% Successive orientaions of grains

%grain 1
% o1 = orientation('Euler',[138.41,14.24,71.71]*degree,CS);%,SS);
% o2 = orientation('Euler',[140.00,14.44,69.96]*degree,CS);%,SS);
% o3 = orientation('Euler',[132.08,15.89,76.61]*degree,CS);%,SS);
% o4 = orientation('Euler',[126.33,17.07,80.59]*degree,CS);%,SS);
% o5 = orientation('Euler',[121.11,18.72,83.06]*degree,CS);%,SS);

%grain 2
% o1 = orientation('Euler',[30.22,41.9, 69.5]*degree,CS);%,SS);
% o2 = orientation('Euler',[30.12,41.42,69.6]*degree,CS);%,SS);
% o3 = orientation('Euler',[28.39,41.14,71.84]*degree,CS);%,SS);
% o4 = orientation('Euler',[25.42,40.18,76.81]*degree,CS);%,SS);
% o5 = orientation('Euler',[21.39,37.14,88.81]*degree,CS);%,SS);

%grain 3
% o1 = orientation('Euler',[160.32,32.18,43.27]*degree,CS);%,SS);
% o2 = orientation('Euler',[161.18,32.52,42.19]*degree,CS);%,SS);
% o3 = orientation('Euler',[157.46,32.52,44.99]*degree,CS);%,SS);
% o4 = orientation('Euler',[154.58,32.01,46.45]*degree,CS);%,SS);
% o5 = orientation('Euler',[152.64,29.90,45.88]*degree,CS);%,SS);

%grain 4
% o1 = orientation('Euler',[185.00,45.65,24.09]*degree,CS);%,SS);
% o2 = orientation('Euler',[185.07,45.97,23.85]*degree,CS);%,SS);
% o3 = orientation('Euler',[187.59,45.05,20.39]*degree,CS);%,SS);
% o4 = orientation('Euler',[193.33,44.21,13.10]*degree,CS);%,SS);
% o5 = orientation('Euler',[205.57,42.94,86.94]*degree,CS);%,SS);

%  grain 5
% o1 = orientation('Euler',[176.83,48.31,29.55]*degree,CS);%,SS);
% o2 = orientation('Euler',[176.90,48.79,29.29]*degree,CS);%,SS);
% o3 = orientation('Euler',[177.48,48.46,27.84]*degree,CS);%,SS);
% o4 = orientation('Euler',[33.00,45.56,66.66]*degree,CS);%,SS);
% o5 = orientation('Euler',[26.12,42.63,76.36]*degree,CS);%,SS);

% grain 6
% o1 = orientation('Euler',[197.87,43.18,17.53]*degree,CS);%,SS);
% o2 = orientation('Euler',[197.71,43.66,17.50,]*degree,CS);%,SS);
% o3 = orientation('Euler',[198.39,43.70,16.92]*degree,CS);%,SS);
% o4 = orientation('Euler',[202.93,44.15,11.99]*degree,CS);%,SS);
% o5 = orientation('Euler',[34.03,44.50,87.10]*degree,CS);%,SS);

% grain 7
% o1 = orientation('Euler',[214.82,23.92,31.78]*degree,CS);%,SS);
% o2 = orientation('Euler',[214.28,24.32,32.39]*degree,CS);%,SS);
% o3 = orientation('Euler',[214.93,23.81,31.89]*degree,CS);%,SS);
% o4 = orientation('Euler',[218.87,23.79,28.41]*degree,CS);%,SS);
% o5 = orientation('Euler',[226.01,26.10,22.33]*degree,CS);%,SS);

% grain 8
% o1 = orientation('Euler',[183.18,43.20,22.39]*degree,CS);%,SS);
% o2 = orientation('Euler',[183.49,43.61,22.00]*degree,CS);%,SS);
% o3 = orientation('Euler',[184.38,44.28,20.28]*degree,CS);%,SS);
% o4 = orientation('Euler',[187.57,45.62,15.62]*degree,CS);%,SS);
% o5 = orientation('Euler',[23.82,43.70,85.65]*degree,CS);%,SS);

% % grain 9
% o1 = orientation('Euler',[326.61,17.70,12.11]*degree,CS);%,SS);
% o2 = orientation('Euler',[322.65,18.17,17.58]*degree,CS);%,SS);
% o3 = orientation('Euler',[331.03,16.53,10.59]*degree,CS);%,SS);
% o4 = orientation('Euler',[318.69,19.77,23.76]*degree,CS);%,SS);
% o5 = orientation('Euler',[350.97,16.13,84.02]*degree,CS);%,SS);
% o6 = orientation('Euler',[319.08,20.96,27.42]*degree,CS);%,SS);

% % % grain 9
% o1 = orientation('Euler',[261.87,10.08,32.57]*degree,CS);%,SS);
% o2 = orientation('Euler',[259.81,11.63,35.18]*degree,CS);%,SS);
% o3 = orientation('Euler',[256.35,8.96,40.72]*degree,CS);%,SS);
% o4 = orientation('Euler',[260.34,15.91,33.36]*degree,CS);%,SS);
% o5 = orientation('Euler',[260.07,3.95,40.08]*degree,CS);%,SS);
% o6 = orientation('Euler',[262.75,20.86,31.80]*degree,CS);%,SS);

% % % grain 10
% o1 = orientation('Euler',[230.36,17.57,73.62]*degree,CS);%,SS);
% o2 = orientation('Euler',[232.76,20.34,72.21]*degree,CS);%,SS);
% o3 = orientation('Euler',[229.17,18.22,77.63]*degree,CS);%,SS);
% o4 = orientation('Euler',[240.66,26.09,64.36]*degree,CS);%,SS);
% o5 = orientation('Euler',[224.96,15.04,85.15]*degree,CS);%,SS);
% o6 = orientation('Euler',[246.52,30.64,59.45]*degree,CS);%,SS);

% % grain 10
o1 = orientation('Euler',[238.12,17.39,58.45]*degree,CS);%,SS);
o2 = orientation('Euler',[240.10,19.17,56.90]*degree,CS);%,SS);
o3 = orientation('Euler',[236.06,17.17,63.07]*degree,CS);%,SS);
o4 = orientation('Euler',[243.72,22.46,52.19]*degree,CS);%,SS);
o5 = orientation('Euler',[232.53,13.18,70.00]*degree,CS);%,SS);
o6 = orientation('Euler',[246,25.59,50.12]*degree,CS);%,SS);

% % % grain 11
% o1 = orientation('Euler',[26.86,19.25,82.29]*degree,CS);%,SS);
% o2 = orientation('Euler',[27.42,19.34,80.75]*degree,CS);%,SS);
% o3 = orientation('Euler',[25.10,18.52,82.42]*degree,CS);%,SS);
% o4 = orientation('Euler',[24.01,17.41,82.60]*degree,CS);%,SS);
% o5 = orientation('Euler',[19.88,16.85,85.72]*degree,CS);%,SS);
% o6 = orientation('Euler',[17.52,16.41,87.37]*degree,CS);%,SS);

%%
mo = [orientation(o1,o2),orientation(o2,o3),orientation(o3,o4),orientation(o4,o5),orientation(o5,o6)];
ax = axis(mo);
ang = angle(mo);
axis = round(Miller(ax ,CS));
% axis = round(Miller(ax(1),ax(2),ax(3) ,CS))
ang = ang/degree;


%% Plotting of data on the orientaion map

oM = ipdfHSVOrientationMapping(CS,SS);
oM.inversePoleFigureDirection = vector3d(xvector);
% oM.colorPostRotation = rotation('axis',zvector,'angle',90*degree);
% oM = BungeRGBOrientationMapping(CS);
plot(oM,'antipodal');
hold on
colr = ['b','r','k','y','g','m'];
plotIPDF(o1,xvector,'antipodal','MarkerFaceColor',colr(1),'MarkerEdgeColor',colr(1));
plotIPDF(o2,xvector,'antipodal','MarkerFaceColor',colr(2),'MarkerEdgeColor',colr(2));
plotIPDF(o3,xvector,'antipodal','MarkerFaceColor',colr(3),'MarkerEdgeColor',colr(3));
plotIPDF(o4,xvector,'antipodal','MarkerFaceColor',colr(4),'MarkerEdgeColor',colr(4));
plotIPDF(o5,xvector,'antipodal','MarkerFaceColor',colr(5),'MarkerEdgeColor',colr(5));
plotIPDF(o6,xvector,'antipodal','MarkerFaceColor',colr(6),'MarkerEdgeColor',colr(6));
hold off

%%
% plot(CS,'antipodal');
figure;
plotHKL(CS,'MarkerColor','b','MarkerSize',3); %'antipodal
hold on
for ci=1:1:12   
    plot(SlipSystem(ci).r.axis,'label',int2str(ci),'marker','x','MarkerColor','k','textaboveMarker');
end

for moi=1:1:5
    plot(ax(moi),CS,'MarkerFaceColor',colr(moi),'MarkerEdgeColor',colr(moi));
end
hold off

figure;
oR = fundamentalRegion(CS);
plot(mo.project2FundamentalRegion('antipodal'))    
%% Plot misorientation axes



%%

% %% old lines
% ori = [o1,o2, o3, o4, o5]; 
% close all
% % cycle through all major lattice planes
% for im = 1:length(ori)
%   plot((ori(im))*xvector,'symmetrised','MarkerSize',10,...
%     'fundamentalRegion','figSize','normal')
%   hold all
% end
% hold off
% annotate(Miller(ori*xvector,CS),'labeled')

%%
% m = Miller({1,0,-1,0},{1,1,-2,0},{1,0,-1,1},{1,1,-2,1},{1,1,-2,2},{0,0,0,1},CS);
% 
% close all
% % cycle through all major lattice planes
% for im = 1:length(m)
% 
%   % plot the lattice planes of grains 80 with respect to the
%   % reference frame of grain 70
%   plot(mori * symmetrise(m(im)),'symmetrised','MarkerSize',10,...
%     'DisplayName',char(m(im)),'fundamentalRegion','figSize','normal')
%   hold all
% end
% hold off
% annotate(m,'labeled')
% 
% % show legend
% legend({},'location','NorthWest','FontSize',13);
