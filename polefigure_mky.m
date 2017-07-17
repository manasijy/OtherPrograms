%% Running this script will import texture data (in .txt format). The original script is modified to plot pf, calc odf and plot 'em. 
clear;
close;

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = crystalSymmetry('-43m', [1 1 1], 'color', 'light blue');

% specimen symmetry
SS = specimenSymmetry('mmm');

% % crystal symmetry
% CS = crystalSymmetry('6/mmm',' mineral', '680-20', 'color', 'light blue');
% % specimen symmetry
% SS = specimenSymmetry('orthorhombic');

% plotting convention
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','outOfPlane');



%% Specify File Names

% path to files
% pname = 'C:\Documents and Settings\nilesh\My Documents\MATLAB\MKY1\mtex_practice\7075Amit\HR480(200)';
pname = 'C:\Documents and Settings\nilesh\Desktop\TXT';
% which files to be imported
fname = {...
  [pname '\(311).TXT'],...
  [pname '\(111).TXT'],...
  [pname '\(200).TXT'],...
  [pname '\(220).TXT'],...
  };
% fname = {...
%   [pname '\680_0002.xrdml'],...
%   [pname '\680_0111.xrdml'],...
%   [pname '\680_0112.xrdml'],...
%   [pname '\680_0113.xrdml'],...
%   };

%% Specify Miller Indice

h = { ...
  Miller(3,1,1,CS),...
  Miller(1,1,1,CS),...
  Miller(2,0,0,CS),...
  Miller(2,2,0,CS),...
  };
% h = { 
%   Miller(0,0,0,2,CS),...
%   Miller(0, 1,1, 1,CS),...
%   Miller(0, 1,1, 2,CS),...
%   Miller(0, 1,1, 3,CS),...
%   };

% c = {1,[0.52 ,1.23]};

%% Import the Data

% create a Pole Figure variable containing the data
pf = loadPoleFigure(fname,h,CS,SS,'interface','rigaku_txt'); %,'superposition');
% pf = loadPoleFigure(fname,h,CS,SS,'interface','rigaku_txt');
%plot(pf,'contourf')

%% ODF calculation and applying rotation to correct for error in sample orientation during measurement

% odf = calcODF(pf,'zero_range','silent');
odf = calcODF(pf, 'resolution',5*degree);
% rot = rotation('axis', zvector,'angle',5*degree);
% odf=rotate(odf,rot);

%% To plot pole figures

% %figure
plotPDF(odf,Miller(1,1,1,CS),'complete','antipodal')
% mtexColorbar
% %plotPDF(odf,h,'antipodal','superposition',c)


%% Calculate orientation
ori = calcOrientations(odf,10000);
ori1=Euler(ori,'Bunge');
% scatter(ori);



%%
% pf = loadPoleFigure(fname,h,CS,SS,'interface','rigaku_txt',...
%   'wizard', 'wizard', 'wizard', 'wizard');
% % pf = delete(pf,get(pf,'theta')>70*degree);
% % rot = rotation('axis', zvector, 'angle',0*degree);
% % pf = rotate(pf, rot);
% plot(pf)
% %figure()
% % plot(pf,'contour','antipodal','linewidth',2.5);
% %figure()
% odf = calcODF(pf, 'resolution',5*degree);
% plot(odf,'contour','colorrange',[1,5],'antipodal','linewidth',2.5);
%figure()
% pf=normalize(pf,odf);
% plotpdf(odf,h,'contour','complete','colorrange',[1,8],'antipodal','linewidth',2.5);
%%

% %% To plot ipf maps
% 
% %figure
% % plotIPDF(odf,[xvector,zvector],'antipodal')
% % figure
% % plotIPDF(odf,zvector,'antipodal','complete')
% % annotate(Miller(0,1,1,odf.CS),'labeled')
% % mtexColorbar

%% 
% %% To plot odf sections
% 
% % figure
% % plot(odf,'sections',6,'silent')
% % plot(odf,'phi2',[25 30 35 40]*degree,'contourf','silent')
% 
% %% Fibre plot
% 
%  figure
% % plotFibre(odf,Miller(1,1,1,CS),vector3d(0,0,1),'LineWidth',2);
% mdf = calcMDF(odf);
% plotAxisDistribution(mdf)
% 
% %% To plot misorientation angle and axis distribution 
% figure
% 
% plotAngleDistribution(mdf)
% hold all
% plotAngleDistribution(CS,CS)
% hold off
% legend('data ODF','uniform ODF')
