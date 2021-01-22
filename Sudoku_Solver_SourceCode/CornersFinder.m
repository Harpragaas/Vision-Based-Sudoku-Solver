function mat_out = CornersFinder(Location)

% convert the point pairs to the cartesian coordinate expression
for i=1:4
    k_temp(i)=(Location(i,2)-Location(i,4))/(Location(i,1)-Location(i,3));
    b_temp(i)= Location(i,2)-k_temp(i)*Location(i,1);
end

% from the cartesian coordinate expression,we can easily compute the intersections
point_1(1)=(b_temp(4)-b_temp(1))/(k_temp(1)-k_temp(4));
point_1(2)=k_temp(1)*point_1(1)+b_temp(1);

point_2(1)=(b_temp(3)-b_temp(1))/(k_temp(1)-k_temp(3));
point_2(2)=k_temp(1)*point_2(1)+b_temp(1);

point_3(1)=(b_temp(3)-b_temp(2))/(k_temp(2)-k_temp(3));
point_3(2)=k_temp(3)*point_3(1)+b_temp(3);

point_4(1)=(b_temp(4)-b_temp(2))/(k_temp(2)-k_temp(4));
point_4(2)=k_temp(4)*point_4(1)+b_temp(4);

% convert the four intersections into a output matrix
mat_out = [point_1;point_2;point_3;point_4];
end