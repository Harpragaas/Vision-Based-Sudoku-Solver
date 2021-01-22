
function endpoints = BordersFinder(lines)
%input: all solid lines found from Hough transform
%output: four outer-most borders named as 'endpoints'
%This funtion is to find the outer-most four borders from all lines
%detected from Hought transform
%The general idea is: With twenty gridlines recorded in coordinates, we classify them into two groups, 
% namely horizontal and vertical lines. The grouping is done based on their polar angles: 
% the polar angles of the lines in the same group are quite close. By doing so, we eliminate the influence
% of unitary rotation. Then we identify and extract the outer borders by finding two lines in each group 
%that are the closest and the furthest to the origin.
%%
theta_extracted = abs(extractfield(lines,'theta')); 
%give absolute value to all the theta(angle) extracted in polar coordinates
rho_extracted = abs(extractfield(lines,'rho'));
%give absolute value to all the pho (length) extracted in polar coordinates

threshold_value = (max(theta_extracted)+ min(theta_extracted))/2; %define a threshold for comparison
index_1 = find(theta_extracted <= threshold_value); %divide two groups based on threshold
index_2 = find(theta_extracted > threshold_value);

rho_value_1 = rho_extracted(index_1);
rho_value_2 = rho_extracted(index_2);
%find four lines based on the rho value
[~,ind_max_2] = max(rho_value_2);
[~,ind_min_2] = min(rho_value_2);
[~,ind_max_1] = max(rho_value_1);
[~,ind_min_1] = min(rho_value_1);

%extract four outer-most lines. Note that there is a conversion between
%polar and cartesian coordinates.
top_line = [lines(index_2(ind_min_2)).point1,lines(index_2(ind_min_2)).point2];
bottom_line = [lines(index_2(ind_max_2)).point1,lines(index_2(ind_max_2)).point2];
left_line = [lines(index_1(ind_min_1)).point1,lines(index_1(ind_min_1)).point2];
right_line = [lines(index_1(ind_max_1)).point1,lines(index_1(ind_max_1)).point2];

endpoints = [top_line;bottom_line;left_line;right_line]; %stack as a matrix called endpoints
end