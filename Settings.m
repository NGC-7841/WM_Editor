global color; %#ok<NUSED>
global deg; %#ok<NUSED>
global noise1; %#ok<NUSED>
global noise2; %#ok<NUSED>
global exp_type; %#ok<NUSED>
global rb_type; %#ok<NUSED>
global num; %#ok<NUSED>
global task_answer; %#ok<NUSED>
global result; %#ok<NUSED>
%0: independent
%1: exactly the same
%2: Red1 / Blue0 (noise1, rectangle2) ahead
%3: Blue1 / Red0 (noise2, rectangle1) ahead
height = 90;
width = 160;
color_bar = ['r', 'b'];
%framerate = 60;
%FileName = 'test.avi'; 
%--------------------------------------------------------------------------
delaying = 10;
Dataset = 'Data_test.xlsx';
%Use 'Data_this.xlsx' to record the result
len = 1000; %1000frame~15s
rectangle_time = 1;