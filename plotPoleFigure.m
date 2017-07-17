function plotPoleFigure( eulerAngles, plotFamily, interval, viewPlane, eulerConvention )
%PLOTPOLEFIGURE Creates crystallographic pole figures based on Euler angles
%   Function will allow the plot of any arbitrary crystal vectors viewed
%   from an arbitrary plane. Common choices for these options are built in
%   for convience. For example, to view the {111} family of plane vectors
%   (the common slip planes in an FCC crystal) simply input {111} as the
%   plotFamily. The usage is as follows:
%   plotPoleFigure( angles, {111}, [0 0 1], 1, 'kocks' );
%   
%   Defaults:
%   eulerAngles - [0 0 0]
%   plotFamily  - {111}
%   viewPlane   - [0 0 1]
%   interval    - 1
%   eulerConvention - 'kocks' (Output by ABAQUS Crystal Plasticity)
%
%   The eulerAngles can also be input as a file. The file parser is
%   currently set up to parse the output from the ABAQUS Crystal Plasticity
%   code as shown here https://icme.hpc.msstate.edu/mediawiki/index.php/Code:_ABAQUS_CPFEM
%
%   Developed on MATLAB R2014b
%   - Bradley Huddleston. April 23, 2015. Mississippi State University


% Set defaults for all arguments - allows an empty call as an example.
if nargin < 5
    eulerConvention = 'kocks';
end
if nargin < 4
    viewPlane = [0 0 1];
end
if nargin < 3
    interval = 1;
end
if nargin < 2
    plotFamily = {111};
end
if nargin < 1
    eulerAngles = [0 0 0];
end

% Set up euler angle convention
%   This method for defining the rotation matrix function allows any euler
%   angle convention to be used. The user simply has to create a function
%   named 'euler_rot_<userdefinedname>' that returns a rotation matrix 
%   according to their convention and then specify their conventionname in 
%   the plotPoleFigure function call.
eulerRot = str2func(['euler_rot_' eulerConvention]);

% Check plotFamily for common inputs
if iscell(plotFamily) && length(plotFamily)==1
if plotFamily{1} == 111
    plotFamily = [[1,1,1]',[-1,1,1]',[1,-1,1]',[-1,-1,1]']/sqrt(3);
    showFamily = [1,1,1];
        
elseif plotFamily{1} == 101
    plotFamily = [[1,0,1]',[-1,0,1]',[0,1,1]',[0,-1,1]']/sqrt(2);
    showFamily = [1,0,1];
        
else
    if mod(numel(plotFamily{1}),3)==0 
        plotFamily = reshape(plotFamily{1},3,numel(plotFamily{1})/3);
        showFamily = plotFamily;
        % Normalize vectors
        nms = repmat(arrayfun(@(x)(norm(plotFamily(:,x))),1:size(plotFamily,2)),3,1);
        plotFamily = plotFamily./nms;
    else
        error('Failed to use plotFamily. It should be a collection of 3 element vectors.')
    end
end
elseif iscell(plotFamily)
    if mod(numel(plotFamily),3)==0 
        plotFamily = reshape(plotFamily{:},3,numel(plotFamily)/3);
        showFamily = plotFamily;
        % Normalize vectors
        nms = repmat(arrayfun(@(x)(norm(plotFamily(:,x))),1:size(plotFamily,2)),3,1);
        plotFamily = plotFamily./nms;
    else
        error('Failed to use plotFamily. It should be a collection of 3 element vectors.')
    end
elseif isnumeric(plotFamily)
    if mod(numel(plotFamily),3)==0 
        plotFamily = reshape(plotFamily,3,numel(plotFamily)/3);
        showFamily = plotFamily;
        % Normalize vectors
        nms = repmat(arrayfun(@(x)(norm(plotFamily(:,x))),1:size(plotFamily,2)),3,1);
        plotFamily = plotFamily./nms;
    else
        error('Failed to use plotFamily. It should be a collection of 3 element vectors.')
    end
else
    error('Unable to parse plotFamily. It should be a numeric array of vectors.')
end

% Check interval input
if ~ischar(interval) && ~isnumeric(interval)
    error('Incorrect input for interval - it should be a number, ''all'', or ''end''')
end

% Load Euler angles
alpha={};beta={};gamma={};

if isnumeric(eulerAngles) && size(eulerAngles,2)==3
    alpha{end+1} = eulerAngles(:,1);
    beta{end+1} = eulerAngles(:,2);
    gamma{end+1} = eulerAngles(:,3);
elseif ischar(eulerAngles) && exist(eulerAngles,'file')
    f = fopen(eulerAngles,'r');
    atEOF = false;
    textscan(f,'%f','CommentStyle','*','Headerlines',1);
    niter = 0;
    while ~atEOF
        M = textscan(f,'%f %f %f %f %f %f %f %f','CommentStyle','*','Headerlines',1);
        niter = niter+1;
        if niter > 100
            warning('May take a long time for large files.')
        end
        if isempty(M{1})
            atEOF = 1;
        else
            alpha{end+1} = M{1};    %#ok<AGROW>
            beta{end+1} = M{2};     %#ok<AGROW>
            gamma{end+1} = M{3};    %#ok<AGROW>
        end
    end
elseif ischar(eulerAngles) && ~exist(eulerAngles,'file')
    error('File does not exist. Check path and try again.')
else
    error('Euler angles not set. Check inputs and try again.')
end


% Determine rotational matrices for viewing plane
plane = viewPlane/norm(viewPlane);
rotaxis = cross([0,0,1],plane);
angle = acos(dot([0,0,1],plane)/norm(plane));
if any(rotaxis)
    R_plane = rot_mat(angle,rotaxis/norm(rotaxis));
else
    R_plane = eye(3);
end

% Interval will determine plot style
if isnumeric(interval) && interval<=length(alpha{1})
	for i = 1:length(alpha{interval})
        R = eulerRot(alpha{interval}(i)*pi/180,beta{interval}(i)*pi/180,gamma{interval}(i)*pi/180);
		vec = R*plotFamily;
        % Stereoscopic Projection
        for j = 1:size(plotFamily,2)
            plane_vec = vec(:,j)'*R_plane;
            theta(i,j) = atan2(plane_vec(2),plane_vec(1));  %#ok<AGROW>
            radius(i,j) = tan(acos(abs(plane_vec(3)))/2);   %#ok<AGROW>
        end
	end

	figure
	polar(0,0)
	hold on
	h = findall(gcf,'type','line');
	delete(h)
	h = findall(gcf,'type','text');
	delete(h)
	text(-.08,1.08,'[010]')
	text(1.08,0,'[100]')
    text(-.9,-.9,sprintf('\\{%d%d%d\\}\n',showFamily))
	polar(theta,radius,'.b')
	handles = get(get(gcf,'children'),'children');
	set(handles(1:end-3),'markersize',24)

elseif ischar(interval) && strcmp(interval,'all')
     for i = 1:length(alpha)
        for k = 1:length(alpha{i})
            R = eulerRot(alpha{i}(k)*pi/180,beta{i}(k)*pi/180,gamma{i}(k)*pi/180);
            vec = R*plotFamily;
            for j = 1:size(plotFamily,2)
                plane_vec = vec(:,j)'*R_plane;
                if plane_vec(3) < 0
                    plane_vec = -plane_vec;
                    radius(i,j) = tan(acos(abs(plane_vec(3)))/2);   %#ok<AGROW>
                else
                    radius(i,j) = tan(acos(abs(plane_vec(3)))/2);   %#ok<AGROW>
                end
                theta(i,j) = atan2(plane_vec(2),plane_vec(1));      %#ok<AGROW>
            end
        end
     end
	figure
	polar(0,0)
	hold on
	h = findall(gcf,'type','line');
	delete(h)
	h = findall(gcf,'type','text');
	delete(h)
	text(-.08,1.08,'[010]')
	text(1.08,0,'[100]')
    text(-.9,-.9,sprintf('\\{%d%d%d\\}\n',showFamily))
	polar(theta(:),radius(:),'.r')
	polar(squeeze(theta(1,:,:)),squeeze(radius(1,:,:)),'.b')
	handles = get(get(gcf,'children'),'children');
	set(handles(1:end-3),'markersize',24)
    
elseif ischar(interval) && strcmp(interval,'end')
    for i = 1:length(alpha{end})
        R = eulerRot(alpha{end}(i)*pi/180,beta{end}(i)*pi/180,gamma{end}(i)*pi/180);
		vec = R*plotFamily;
        for j = 1:size(plotFamily,2)
            plane_vec = vec(:,j)'*R_plane;
			theta(i,j) = atan2(plane_vec(2),plane_vec(1));  %#ok<AGROW>
            radius(i,j) = tan(acos(abs(plane_vec(3)))/2);   %#ok<AGROW>
        end
    end

	figure
	polar(0,0)
	hold on
	h = findall(gcf,'type','line');
	delete(h)
	h = findall(gcf,'type','text');
	delete(h)
	text(-.08,1.08,'[010]')
	text(1.08,0,'[100]')
    text(-.9,-.9,sprintf('\\{%d%d%d\\}\n',showFamily))
	polar(theta,radius,'.b')
	handles = get(get(gcf,'children'),'children');
	set(handles(1:end-3),'markersize',24)
end

end

function mat = rot_mat(theta,axis)

cpMat = [0, -axis(3), axis(2);...
         axis(3), 0, -axis(1);...
         -axis(2), axis(1), 0];

mat = cos(theta)*eye(3) + sin(theta)*cpMat + (1-cos(theta))*kron(axis,axis');

end

function mat = euler_rot_kocks(a, b, c) %#ok<DEFNU> % Function is used using str2func on line 43

mat = [ cos(a)*cos(b)*cos(c) - sin(a)*sin(c), - cos(a)*sin(c) - cos(b)*cos(c)*sin(a), cos(c)*sin(b);...
        cos(c)*sin(a) + cos(a)*cos(b)*sin(c),   cos(a)*cos(c) - cos(b)*sin(a)*sin(c), sin(b)*sin(c);...
                       -cos(a)*sin(b),          sin(a)*sin(b),                        cos(b)];

end