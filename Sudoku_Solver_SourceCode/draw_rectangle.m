function draw_rectangle(object)


%% capture the sudoku image
% call the Matlab's inbuilt function imrect() to select the region of
% interest
handle_im=imrect;
setColor(handle_im,'Green');
% record the position of the region of interest
position=wait(handle_im);
% after double-click, get the get the camera picture
image=getsnapshot(object);
% crop the interested region from the captured image
sudoku_im=imcrop(image,position);
% the raw input image is not rgb image. we convert it
sudoku_im=ycbcr2rgb(sudoku_im);
% display the interested image in the screen
imshow(sudoku_im)
hold on

%% create the laser scanning animation
[width,length]=size(sudoku_im);
scan_image(width,length);

%% call the key processing function and record the processing time
time0=cputime;
% understand the input image, solve the sudoku, and show the solved result
output_im = BrainOfSudoku(sudoku_im);
imshow(output_im);
% tout represents the whole processing time
time_out=cputime-time0;

%% difficulty assessment
if time_out<8
    msgbox('Sudoku-level: Easy', ':-)');
else
    msgbox('Sudoku-level: Medium', ':-)');
end

end