function scan_image(width,length)


%% draw the background grid
large_edge=max([width,length]);
spacing=round(large_edge/64);
% make the grid a bit larger than the image, so as to avoid vulnerabilities
meas=1:spacing:1.1*large_edge;
% grid setting
Iden=meshgrid(meas,meas);
% draw the horizontal and vertical lines
plot(meas,Iden,'g');
hold on
plot(Iden,meas,'g');

%% scanning animation
% the step size of the scanning line
speed_count=12;
time_count=1;
% the number of scanning loops
loop=2;
while time_count<loop
    for i=1:round(width/speed_count)
        x_ax=[0,length];
        y_ax=[speed_count*i,speed_count*i];
        % draw a scanning line and keep refreshing it
        % we push it from the top to bottom
        handle_line=line(x_ax,y_ax,'linewidth',2,'color','green');
        drawnow
        delete(handle_line);
    end
    time_count=time_count+1;
end
end
