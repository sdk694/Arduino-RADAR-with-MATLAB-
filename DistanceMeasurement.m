a=arduino();
function varargout = DistanceMeasurement(varargin)
% DISTANCEMEASUREMENT MATLAB code for DistanceMeasurement.fig
%      DISTANCEMEASUREMENT, by itself, creates a new DISTANCEMEASUREMENT or raises the existing
%      singleton*.
%
%      H = DISTANCEMEASUREMENT returns the handle to a new DISTANCEMEASUREMENT or the handle to
%      the existing singleton*.
%
%      DISTANCEMEASUREMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISTANCEMEASUREMENT.M with the given input arguments.
%
%      DISTANCEMEASUREMENT('Property','Value',...) creates a new DISTANCEMEASUREMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DistanceMeasurement_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DistanceMeasurement_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DistanceMeasurement

% Last Modified by GUIDE v2.5 21-Jun-2019 12:35:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DistanceMeasurement_OpeningFcn, ...
                   'gui_OutputFcn',  @DistanceMeasurement_OutputFcn, ...
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
end

% --- Executes just before DistanceMeasurement is made visible.
function DistanceMeasurement_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DistanceMeasurement (see VARARGIN)

% Choose default command line output for DistanceMeasurement
handles.output = hObject;
% Delete any opened ports in MATLAB
delete(instrfind)
% Create a Serial Object
handles.ser = serial('COM9', 'BaudRate',115200,'Terminator','LF',...
    'Timeout',10);
% Associate Serial Event, whenever Terminal Character is recived
handles.ser.BytesAvailableFcn = {@SerialEvent, hObject};
% Open Serial Port
fopen(handles.ser);
% Update handles structure
guidata(hObject, handles);
end
% UIWAIT makes DistanceMeasurement wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DistanceMeasurement_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

clear all ;
global a;
a=arduino();
end

function SerialEvent(sObject, eventdata, hGui)
% get the updated handle
handles = guidata(hGui);
% get data from serial port
tmp_c = fscanf(sObject);
set(handles.textDistance, 'String', tmp_c)
% Updates handle structure
guidata(hGui, handles)
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fclose(handles.ser);
delete(handles.ser);
% Hint: delete(hObject) closes the figure
delete(hObject);
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
while get(hObject,'Value')
 global a;
 writeDigitalPin(a,'D2',1);
 writeDigitalPin(a,'D3',1);
 writeDigitalPin(a,'D4',0);
 writeDigitalPin(a,'D5',0);
 pause(0.0003);
 writeDigitalPin(a,'D2',0);
 writeDigitalPin(a,'D3',1);
 writeDigitalPin(a,'D4',1);
 writeDigitalPin(a,'D5',0);
 pause(0.0003);
 writeDigitalPin(a,'D2',0);
 writeDigitalPin(a,'D3',0);
 writeDigitalPin(a,'D4',1);
 writeDigitalPin(a,'D5',1);
 pause(0.0003);
 writeDigitalPin(a,'D2',1);
 writeDigitalPin(a,'D3',0);
 writeDigitalPin(a,'D4',0);
 writeDigitalPin(a,'D5',1);
 pause(0.0003);
end
end
% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
while get(hObject,'Value')
    global a;
     writeDigitalPin(a,'D2',1);
     writeDigitalPin(a,'D3',0);
     writeDigitalPin(a,'D4',0);
     writeDigitalPin(a,'D5',1);
     pause(0.0003);
     writeDigitalPin(a,'D2',0);
     writeDigitalPin(a,'D3',0);
     writeDigitalPin(a,'D4',1);
     writeDigitalPin(a,'D5',1);
     pause(0.0003);
     writeDigitalPin(a,'D2',0);
     writeDigitalPin(a,'D3',1);
     writeDigitalPin(a,'D4',1);
     writeDigitalPin(a,'D5',0);
     pause(0.0003);
     writeDigitalPin(a,'D2',1);
     writeDigitalPin(a,'D3',1);
     writeDigitalPin(a,'D4',0);
     writeDigitalPin(a,'D5',0);
     pause(0.0003);
end
end