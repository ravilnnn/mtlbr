function varargout = extra(varargin)
% EXTRA MATLAB code for extra.fig
%      EXTRA, by itself, creates a new EXTRA or raises the existing
%      singleton*.
%
%      H = EXTRA returns the handle to a new EXTRA or the handle to
%      the existing singleton*.
%
%      EXTRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXTRA.M with the given input arguments.
%
%      EXTRA('Property','Value',...) creates a new EXTRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before extra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to extra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help extra

% Last Modified by GUIDE v2.5 07-Jun-2012 20:40:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @extra_OpeningFcn, ...
                   'gui_OutputFcn',  @extra_OutputFcn, ...
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


% --- Executes just before extra is made visible.
function extra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to extra (see VARARGIN)

% Choose default command line output for extra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes extra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = extra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global filein;
global frames;
global video;
[fname pname] = uigetfile('*.avi', 'Select Video'); % ������ ������ �����
filein = [pname fname]; % ������� ����
if (filein)
video = mmreader(filein); % �����
input_fileinfo = aviinfo(filein)
frames = video.NumberOfFrames; % ���������� ������
width = video.Width;    % ������ ������
height = video.Height;  % ������� ������

    global writer;
   result_file = 'd:\test\result1.avi';
   nFrames = 200;
   % ��������� ���� ��� ������
% ���������� ������������� - XVID
writer = avifile(result_file, 'compression', 'XVID');
% � ����� ������-������������-����������
% ��������������� ������� ��� ���������� ���������
se = strel('rectangle', [3 3]);
for k = 1:nFrames
    % ������ ����
    frame = read(video, k);
    % ��������� ��������� �����
    frame = imdilate(frame, se);
    % ���������� ����
    writer = addframe(writer, frame);
end
% ����������� ���������� writer
writer = close(writer);

end;
