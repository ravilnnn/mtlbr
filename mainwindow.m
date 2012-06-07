function varargout = mainwindow(varargin)
%MAINWINDOW M-file for mainwindow.fig
%      MAINWINDOW, by itself, creates a new MAINWINDOW or raises the existing
%      singleton*.
%
%      H = MAINWINDOW returns the handle to a new MAINWINDOW or the handle to
%      the existing singleton*.
%
%      MAINWINDOW('Property','Value',...) creates a new MAINWINDOW using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to mainwindow_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAINWINDOW('CALLBACK') and MAINWINDOW('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAINWINDOW.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainwindow

% Last Modified by GUIDE v2.5 07-Jun-2012 19:16:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainwindow_OpeningFcn, ...
                   'gui_OutputFcn',  @mainwindow_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before mainwindow is made visible.
function mainwindow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for mainwindow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainwindow wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainwindow_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in save_btn.

% --- Executes on button press in open_btn.
function open_btn_Callback(hObject, eventdata, handles)
% hObject    handle to open_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filein;
global frames;
global video;
[fname pname] = uigetfile('*.avi', 'Select Video'); % диалог выбора файла
filein = [pname fname]; % входной файл
if (filein)
video = mmreader(filein); % видео
input_fileinfo = aviinfo(filein)
frames = video.NumberOfFrames; % количество кадров
global width;
global height;
width = video.Width;    % ширина кадров
height = video.Height;  % высотка кадров
set(handles.save_btn,'Enable','on'); % включаем кнопку сохранениz
frame = read(video, 75);
imshow(frame);
disp(frames);
end;

% --------------------------------------------------------------------




function textframe_Callback(hObject, eventdata, handles)
% hObject    handle to textframe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textframe as text
%        str2double(get(hObject,'String')) returns contents of textframe as a double


% --- Executes during object creation, after setting all properties.
function textframe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textframe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
