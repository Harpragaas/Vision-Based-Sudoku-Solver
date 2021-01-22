function output_image = BrainOfSudoku(input_im)

disp('Solving the Sudoku Puzzle...');

% the width of the square puzzle in the standard planar
width_setting=9*16*3;
% in the standard planar, the location of the left-top corner is (left_corner,left_corner)
left_corner=400;
% prepare for dimension extension; we can also solve 16*16 sudoku
dimension_value=9;

%% image processing and denoising
% convert the image to grayscale
grayImage = rgb2gray(input_im);
% increase contrast
grayImage = imadjust(grayImage ,[0.4 0.6], [0 1]);
% convert the image to binary format
% reverse black and white, to prepare for following recognition
image_bw = imcomplement(imbinarize(grayImage,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4));


%% find the four vertices of the puzzle
% detect the edges by Hough transform
edges_detected = EdgesFinder(image_bw);
% find the four strongest lines, i.e., borders
borders_detected = BordersFinder(edges_detected);
% from the borders, we can get their intersections,i.e., the vertices
corners_detected = CornersFinder(borders_detected);

%% conduct 2D projection
% this part will project the input image to a standard planar, preparing
% for the following recognition section

% calculate the transformation matrix
H = homo2D(corners_detected(:,1),corners_detected(:,2),left_corner,width_setting);
% project the whole input image
image_norm = projectImage(H,imcomplement(image_bw),left_corner,width_setting);
figure,imshow(image_norm);
title('2D Planar Image');

%% image cropping
% crop the puzzle into 81 subimages
[cropped_image, check_num] = cropImage(image_norm,left_corner,width_setting,dimension_value);

%% digits recognition
% OCR method
%puzzleOcr = recognizeOcr(cropped_image, check_num);
% CNN method
%puzzleCNN=recognizeCNN(cropped_image);
% KNN method (template matching)
puzzleKNN=recognizeKNN(cropped_image);
% three methods vote to get the confident results
%puzzle = puzzleMode(puzzleOcr,puzzleCNN,puzzleKNN);
puzzle = puzzleKNN;
%% sudoku solving
% two solving methods
 [solution, sol] = sudoku2(puzzle);
% solution = solvePuzzle(puzzle);

% if the sudoku cannot be solved, error
if sol
    msgbox('Infeasible problem', 'error');
end

%% fill the puzzle and re-project
if ~sol
    % fill the puzzle with answers
    image_filled = fillPuzzle(double(image_norm),puzzle,solution,left_corner,width_setting,dimension_value);
    % enlarge the puzzle and then project it back to the input form
    scale=2;
    output_image=projectBack(input_im,image_filled,H,scale,left_corner,width_setting);
end
end

