function point_out_cor=Projection2D(H_mat,point_in)

    %% projection
    number_count=size(point_in,1);
    point_in_homo=[point_in ones(number_count,1)]';
    point_out=H_mat*point_in_homo;
    
    %% ensure the output is a homogeneous point
    weighting=point_out(3,:);
    point_out_norm = point_out./weighting;
    point_out_cor=point_out_norm(1:2,:)';
end