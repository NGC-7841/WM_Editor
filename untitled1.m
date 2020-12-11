function varargout = untitled1(varargin)
% UNTITLED1 MATLAB code for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 11-Dec-2020 22:31:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Settings;
set(hObject, 'enable', 'off');
set(handles.slider1,'Value', pi / 2);
set(handles.slider1, 'enable', 'off');
set(handles.submit, 'enable', 'off');
num = xlsread(Dataset, 'sheet1', 'A1');
%disp(num);
cla reset;
axis([-30,30,-30,30]);
axis equal;
set(gca,'ytick',[]);
set(gca,'xtick',[]);
color = 'b'; 
deg = rand() * pi;
set(handles.edit, 'string', 'Rectangle No.1');
Show_Rectangle;
disp("1st:");
disp(deg);
result(1,1) = deg;
deg = rand() * pi;
color = 'r';
set(handles.edit, 'string', 'Rectangle No.2');
Show_Rectangle;
disp("2nd:");
disp(deg);
result(1,2) = deg;
set(handles.edit, 'string', 'Focus on the GREEN one');
Noise_Generator;
Flash_Generator;
cla reset;
axis([-30,30,-30,30]);
axis equal;
set(gca,'ytick',[]);
set(gca,'xtick',[]);
color = 'g';
deg = pi / 2;
ro = hgtransform;
rectangle('Position', [-25,-5,50,10], 'Curvature', [0 0], 'edgecolor', color, 'facecolor', color, 'parent', ro, 'linewidth', 1);
ro.Matrix = makehgtform('zrotate', deg);
question = mod(round(rand() * 1000), 2) + 1;
set(handles.edit, 'string', ['What is the direction of the No.', num2str(question), ' rectangle?']);
disp("Question:");
disp(question);
result(1,3) = question;
set(handles.slider1, 'enable', 'on');




% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns 
axis([-30,30,-30,30]);
axis equal;
set(gca,'ytick',[]);
set(gca,'xtick',[]);
% Hint: place code in OpeningFcn to populate axes1

function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Min', 0);
set(hObject,'Max', pi);
set(hObject,'Value', pi / 2);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Settings;
cla reset;
axis([-30,30,-30,30]);
axis equal;
set(gca,'ytick',[]);
set(gca,'xtick',[]);
deg = pi - get(hObject, 'Value');
color = 'g';
ro = hgtransform;
rectangle('Position', [-25,-5,50,10], 'Curvature', [0 0], 'edgecolor', color, 'facecolor', color, 'parent', ro, 'linewidth', 1);
ro.Matrix = makehgtform('zrotate', deg);
set(handles.submit, 'enable', 'on');


% --- Executes during object creation, after setting all properties.


% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
set(hObject, 'enable', 'off');
set(handles.slider1, 'enable', 'off');
Settings;
disp("Feedback:");
disp(deg);
result(1,4) = deg;
disp("Experiment Type:");
disp(exp_type);
result(1,5) = exp_type;
xlswrite(Dataset, result, 'sheet2', ['A', num2str(num)]);
disp("Done.");
set(handles.start, 'enable', 'on');
set(handles.edit, 'string', 'The answer is');
ro = hgtransform;
if result(1, 3) == 1 
    color = [0 0 1];
else
    color = [1 0 0];
end
rectangle('Position', [-25,-5,50,10], 'Curvature', [0 0], 'edgecolor', color, 'facecolor', color, 'parent', ro, 'linewidth', 1);
ro.Matrix = makehgtform('zrotate', result(result(1, 3)));
xlswrite(Dataset, num + 1, 'sheet1', 'A1');
% hObject    handle to submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of submit


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over slider1.



function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit as text
%        str2double(get(hObject,'String')) returns contents of edit as a double


% --- Executes during object creation, after setting all properties.
function edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
