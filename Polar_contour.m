[th,r] = meshgrid((0:5:360)*pi/180,0:.05:1);
[X,Y] = pol2cart(th,r);
Z = X+i*Y;
f = (Z.^4-1).^(1/4);
surf(X,Y,abs(f))
hold on
surf(X,Y,zeros(size(X)))
% hold off
xlabel('Real','FontSize',14);
ylabel('Imaginary','FontSize',14);
zlabel('abs(f)','FontSize',14);
%
contour(X,Y,abs(f),30)
axis equal
xlabel('Real','FontSize',14);
ylabel('Imaginary','FontSize',14);
%
% h = polar([0 2*pi], [0 1]);
% delete(h)With hold on, display
% the contour on the polar grid:hold on
% contour(X,Y,abs(f),30)
% %