
clear;
close;
 [x,y] = meshgrid(-1:.1:1,-1:.1:1);
y(y==0 & x==0) = NaN; % Explicitly add NaNs to data
contour(x,y,x./(x.^2+y.^2))
% axis square;
% colormap('red');
% xlabel('X Distance(in mm)');
% ylabel('Y Distance(in mm)');
 