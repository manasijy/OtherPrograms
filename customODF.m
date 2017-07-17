%% This program creates a coustom ODF, generates n random orientations from this odf and plots it

%% Define crystal and specimen symmetry
CS = crystalSymmetry('cubic');
SS = specimenSymmetry('orthorhombic');

%% Define crystal direction aligned with a sample direction for fiber definition
% could create as many fibers as one wants
h = Miller(1,1,1,CS);
r = vector3d(0,0,1);

%% Select a suitable kernel

psi = deLaValeePoussinKernel('halfwidth',10*degree);

%or use kernel's free parameter
% psi = deLaValeePoussinKernel(13); %default in Mtex
% psi = AbelPoissonKernel(0.79);
% psi = vonMisesFisherKernel(7.5);
% psi = bumpKernel(35*degree);
% psi = DirichletKernel(9);

%% Select model orientations and create your custom odf

% mod1 = orientation('Miller',[1,2,2],[2,2,1],CS,SS); % Ideal texture component: [1 2 2](2 2 1).
% mod5 = orientation('euler',29*degree,59*degree,63*degree,'ZXZ',CS,SS);
% mod3 = orientation('euler',0*degree,45*degree,0*degree,'ZXZ',CS,SS);
mod5   = orientation('brass',CS,SS); % we can use cube, goss, copper etc already defined in Mtex
% mod5  =  orientation('copper',CS,SS);

% h = Miller(1,1,1,CS); r = vector3d(0,0,1);
% odf6 = fibreODF(h,r,SS); 

odf = 0.5*unimodalODF(mod5,psi)+ 0.5*uniformODF(CS,SS) ; %+ 0.5*unimodalODF(mod5,psi);
% odf1 =  0.4 * uniformODF(CS,SS) + 0.6 * unimodalODF(mod1,psi);
% odf2 = 0.25* unimodalODF(mod2,psi)+ 0.25* unimodalODF(mod3,psi)...
%     + 0.5* unimodalODF(mod4,psi);
% odf = 0.5*odf1 + 0.5*odf2;

%% We can also rotate an ODF

% rot = rotation('axis',zvector,'angle',0*degree);
% odf = rotate(odf,rot);

%% Calculate n random orientations from this odf
o = calcOrientations(odf,500);
o1=Euler(o,'Bunge')/degree;
for ii=0:1:6
    o1(:,1) = o1(:,1)-15*ii;
    
    txtfile = strcat('brass_',num2str(15*ii),'.txt');
    fname = fullfile('C:\Documents and Settings\nilesh\My Documents\MATLAB\MKY1\created texture data\Brass',txtfile);
    save(fname,'o1','-ASCII');
end   

% o1(:,1) = o1(:,1)-15;
% fname = 'C:\Documents and Settings\nilesh\My Documents\MATLAB\MKY1\created texture data\S\S_90.txt';
% save(fname,'o1','-ASCII');

%% We can also do following calculations on ODF

% err = calcError(odf2,odf3,'L1')      % difference between ODFs
% 
% [maxODF,centerODF] = max(odf);  % the modal orientation
% avg = mean(odf);                      % the mean orientation
% max_odf = max(odf);
% 
% vol_odf = volume(odf,centerODF,5*degree); % the volume of a ball
% vol_fiber = fibreVolume(odf2,h,r,5*degree); % the volume of a fibre
% 
% TI = textureindex(odf) ;             % the texture index
% en = entropy(odf);                   % the entropy
% f_hat = calcFourier(odf2,16);  % the C-coefficients up to order 16

%% Plotting

% close all
% plotPDF(odf,[Miller(1,1,1,CS),Miller(2,0,0,CS)],'complete','antipodal')