function hough_lines = EdgesFinder(im_bw)
% input:  a binary image of intereted region
% output: 20 solid lines expressed in polar and cartesian coordinates.
% This function is to detect the gridlines by finding peaks in the parameter
% space. The peaks in the function indicate the potential straight lines with
% the most dots on them.

%% parameter setting
maximum_gap = 400;
minimum_length = 100;

%% Apply Hough transformation
[H,theta,rho] = hough(im_bw);

%% Find Hough peaks
hough_peaks = houghpeaks(H,20,'threshold',ceil(0.4*max(H(:))));
hough_lines = houghlines(im_bw,theta,rho,hough_peaks,'FillGap',maximum_gap,'MinLength',minimum_length);
end

