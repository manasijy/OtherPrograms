[X,Y] = meshgrid(-2:.1:2);

load coeff;
eqs = coeff;
% load equations;
% eqs = equations; 

figure
l = size(eqs,1);
for i=1:1:l
Z = eqs(i,1)*X + eqs(i,2)*Y + eqs(i,3);

mesh(X,Y,Z)
hold on;
end
hold  off

% surf(X,Y,Z,'FaceColor','interp',...
%    'EdgeColor','none',...
%    'FaceLighting','phong')
