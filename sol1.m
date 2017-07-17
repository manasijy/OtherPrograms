%% Import Script for PoleFigure Data
%
% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any changes to this script.

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = symmetry('m-3m', 'mineral', 'iron', 'color', 'light blue');

% specimen symmetry
SS = symmetry('orthorhombic');

% plotting convention
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','outOfPlane');

%% Specify File Names

% path to files
pname = 'G:\New folder\navjeet\leaf spring 2\90% rolled_RD';

% which files to be imported
fname = {...
  [pname '\211.TXT'],...
  [pname '\110.TXT'],...
  [pname '\200.TXT'],...
  };

%% Specify Miller Indice

h = { ...
  Miller(2,1,1,CS),...
  Miller(1,1,0,CS),...
  Miller(2,0,0,CS),...
  };

%% Import the Data

% create a Pole Figure variable containing the data
pf = loadPoleFigure(fname,h,CS,SS,'interface','rigaku_txt',...
  'wizard', 'wizard', 'wizard', 'wizard');
pf = delete(pf,get(pf,'theta')>70*degree);
rot = rotation('axis', zvector, 'angle',0*degree);
pf = rotate(pf, rot);
plot(pf)
odf = calcODF(pf, 'resolution',5*degree)
plot(odf,'phi2', 45*degree,'contour', 1:1:8);
%pf=normalize(pf,odf);
%plotpdf(odf,Miller(2,2,0),'projection','eangle','contour',1.2:1:3,'complete','antipodal')



