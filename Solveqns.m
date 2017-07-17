clear;
close

% a1=2.902;
% b1=0.8098;
% a2=2.885;
% b2=0.814;
% c1=325;
% c2=322;
% x=0;
% y=0;
% 
% %sys := [a1*x + b1*y = c1, a2*x + b2*y =c2]:
% solve([a1*x + b1*y = c1, a2*x + b2*y =c2], [x, y]);
% %delete sys:
% fprintf('%f %f',x,y);
% 
% 
% %solve([x^2 + y = 1, x + y^2 = 1], [x, y], VectorFormat)

syms x y z
A = [x 2*x y; x*z 2*x*z y*z+z; 1 0 1];
B = [z y; z^2 y*z; 0 0];

Use linsolve to solve this equation. Assigning the result of the linsolve call to a single output argument, you get the matrix of solutions:

X = linsolve(A, B)

X =
[       0,       0]
[ z/(2*x), y/(2*x)]
[       0,       0]