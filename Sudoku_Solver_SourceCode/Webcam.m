% this file implements the UI control interface
clear all;
close all;
clc;

%   call the computer camera
%   please change 'winvideo' to 'macvideo' if you are using MacOS
object=videoinput('winvideo',1);
% object=videoinput('macvideo',1,'YUY2_1920x1080');

% camera setting, trigger properties
set(object,'TriggerRepeat',inf);
set(object,'FramesPerTrigger',1);

% call the figure in the UI and set its properties
handle_f=figure('Units','Normalized','Menubar','None','NumberTitle','off','Name','Sudoku Solver');
% set the axes for following image processing
handle_a=axes('Parent',handle_f,'Units','Normalized','Position',[.05 .2 .85 .7]);
axis off

%% button named 'Click Image'
% this button ensures that customers can capture the sudoku image
% this buttion is baded on Matlab's inbuilt preview() function
hb1=uicontrol('Parent',handle_f,'Units','Normalized',...
    'Position',[.40 .05 .2 .1],'String','Click Image',...
    'Callback',...
    ['object_Res=get(object,''VideoResolution'');'...
    'no_Bands=get(object,''NumberOfBands'');'...
    'handle_Image=image(zeros(object_Res(2),object_Res(1),no_Bands));'...
    'preview(object,handle_Image);'...
    'draw_rec(object);']);