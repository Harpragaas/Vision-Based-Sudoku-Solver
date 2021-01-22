function [cropped_images, check_number] = ImageCropping(normalised_image,left_corner,width_val,dimension_val)

%% parameter preparing
grid_width_val=width_val/dimension_val;
label=1;
cropped_images=ones(28,28,1,dimension_val^2);
check_number = zeros(9,9);

%% cropping
for i=1:dimension_val
    for j=1:dimension_val
        % crop the pre-set position
        temp_var=imcrop(normalised_image,[(j-1)*grid_width_val+8+left_corner (i-1)*grid_width_val+8+left_corner grid_width_val-12 grid_width_val-12]);
        % resize the digit image to 28*28
        temp_resized=imresize(temp_var,[28,28]);
        
        % detect how many information pixels in each digit image
        len = length(find (temp_resized == 0));
        % only if there are enough information pixels, we assume this
        % region will contain a digit
        if len >= 40
            check_number(i,j) = 1;
        end
        
        cropped_images(:,:,:,label)=temp_resized;
        label=label+1;
    end
end

cropped_images = imcomplement(cropped_images);

end
