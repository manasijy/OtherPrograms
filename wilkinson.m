%wilkinson

prompt = 'The euler angle file name with .txt extension \n';
g_vectorfile = input(prompt);                       %% this stores the file name in a string array variable g_vectorfile. This file is an array of orientation vectors, each vector has three euler angles as components.
g = fopen(g_vectorfile);                            %% g stores the link to the file g_vectorfile

g_matrix = textscan(g, '%f %f %f');              %% g_matrix stores the file (g_vectorfile) data in a matrix 

fclose(g);

n = length(g_matrix{1,1});
Max_angle = zeros(1,n);
%max_axis = zeros(1,n);
Angle_Axis = struct('angle',zeros(1),'axis',zeros(1,3));
for i=1:1:n 
    g1 = [g_matrix{1,1}(i),g_matrix{1,2}(i),g_matrix{1,3}(i)];
    
    for j=1:1:n
      
      g2 = [g_matrix{1,1}(j),g_matrix{1,2}(j),g_matrix{1,3}(j)];
      
      
      [Angle_Axis(j).angle,Angle_Axis(j).axis] = delta_g_function(g1,g2);
      if Angle_Axis(j).angle > Max_angle(i)
         Max_angle(i) = Angle_Axis(j).angle;
         %max_axis(i)= Angle_Axis(j).axis;
      end
    end
end

max_Max_angle = max(Max_angle);

fprintf('Maximum misorientation in the grain is : %f \n',max_Max_angle)

