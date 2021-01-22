function output_image=BackProjection(input_image,image_filled,H_matrix,scale_factor,left_corner,width_val)
% input:    input_image    the captured image
%           image_filled   the image where the puzzle has been filled by blue digits
%           H              the transformation matrix
%           scale          the magnitude of enlargement 
%           left_corner    location of the left-top corner is
%                          (left_corner,left_corner), in the standard planar
%           width          the width of the square puzzle in the standard planar
% output:   output_image   the captured image with answers
% this function will project the solved results to the input planar

    % enlarge the image to increase digits clarity
    img_enlarge=imresize(image_filled,scale_factor,'nearest');
    % read in the background
    output_image=im2double(input_image);
    row=left_corner;
    width=width_val;
    % project the image from the standard planar to the original planar
    for i=scale_factor*row:scale_factor*(row+width)
        for j=scale_factor*row:scale_factor*(row+width)           
           point=[j/scale_factor,i/scale_factor];
           % we only project the information pixels
           if img_enlarge(i,j,1)==0&&img_enlarge(i,j,2)==0&&img_enlarge(i,j,3)==1
               % using the inverse transformation matrix, project the point
               project_point=Projection2D(inv(H_matrix),point);
               % avoid the decimals
               project_point=round(project_point);
               x=project_point(1);
               y=project_point(2);
               output_image(y,x,1)=0;
               output_image(y,x,2)=0;
               output_image(y,x,3)=1;          
           end
        end
    end

end