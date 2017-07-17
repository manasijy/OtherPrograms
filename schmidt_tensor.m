function [favourableSS, n_favourableSS, m_max] = schmidt_tensor(n,b)
% n = '1,1,1';
% b = '1,-1,0';
% n =[1,1,1];
% b=[1,-1,0];
plane = 
CS = crystalSymmetry('-43m');
hkl = Miller(n,CS);
uvw = Miller(b,CS);

R = SchmidTensor(hkl,uvw);
Rmatrix = matrix(R);
R.M
% Rmatrix = matrix(R);
% m = vector3d.SchmidTensor(n,b);
% matrix(R)