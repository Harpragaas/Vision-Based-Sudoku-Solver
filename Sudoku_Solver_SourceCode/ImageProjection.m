function normalised_image=ImageProjection(H_matrix,Image,row,width)

% preset the size of the projected image
normalised_image=ones(2*row+width,2*row+width);

for i=1:size(Image,1)
    for j=1:size(Image,2)
        point=[j,i];
        % we only project the information pixels
        if Image(i,j)==0
            % using the transformation matrix, project the point
            project_point=Projection2D(H_matrix,point);
            % avoid the decimals
            project_point=round(project_point);
            x=project_point(1);
            y=project_point(2);
            normalised_image(y,x)=0;
        end
    end
end
% just to ensure the output is a binary image
normalised_image = imbinarize(normalised_image);
end