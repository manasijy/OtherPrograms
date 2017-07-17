%% Import Script for PoleFigure Data
%
% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any changes to this script.

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = crystalSymmetry('-43m', [4.05 4.05 4.05], 'mineral', 'aluminum', 'color', 'light blue');

% specimen symmetry
SS = specimenSymmetry('orthorhombic');

% plotting convention
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','outOfPlane');

%% Specify File Names

% path to files
pname = 'C:\Documents and Settings\nilesh\Desktop\sumUDRXSA';

% which files to be imported
fname = {...
  [pname '\311.TXT'],...
  [pname '\111.TXT'],...
  [pname '\200.TXT'],...
  [pname '\220.TXT'],...
  };

%% Specify Miller Indice

h = { ...
  Miller(3,1,1,CS),...
  Miller(1,1,1,CS),...
  Miller(2,0,0,CS),...
  Miller(2,2,0,CS),...
  };

%% Import the Data

% create a Pole Figure variable containing the data
pf = loadPoleFigure(fname,h,CS,SS,'interface','rigaku_txt');
plot(pf)
