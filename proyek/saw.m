function varargout = saw(varargin)
% SAW MATLAB code for saw.fig
%      SAW, by itself, creates a new SAW or raises the existing
%      singleton*.
%
%      H = SAW returns the handle to a new SAW or the handle to
%      the existing singleton*.
%
%      SAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAW.M with the given input arguments.
%
%      SAW('Property','Value',...) creates a new SAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before saw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to saw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help saw

% Last Modified by GUIDE v2.5 23-Jun-2021 10:55:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @saw_OpeningFcn, ...
                   'gui_OutputFcn',  @saw_OutputFcn, ...
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


% --- Executes just before saw is made visible.
function saw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to saw (see VARARGIN)

% Choose default command line output for saw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes saw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = saw_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tampil.
function tampil_Callback(hObject, eventdata, handles)
% hObject    handle to tampil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('data.csv');
opts.SelectedVariableNames = (2:5);
data = readmatrix('data.csv', opts);
set(handles.tabel,'data',data,'visible','on');



function gaji_Callback(hObject, eventdata, handles)
% hObject    handle to gaji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gaji as text
%        str2double(get(hObject,'String')) returns contents of gaji as a double


% --- Executes during object creation, after setting all properties.
function gaji_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gaji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function semester_Callback(hObject, eventdata, handles)
% hObject    handle to semester (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of semester as text
%        str2double(get(hObject,'String')) returns contents of semester as a double


% --- Executes during object creation, after setting all properties.
function semester_CreateFcn(hObject, eventdata, handles)
% hObject    handle to semester (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function saudara_Callback(hObject, eventdata, handles)
% hObject    handle to saudara (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of saudara as text
%        str2double(get(hObject,'String')) returns contents of saudara as a double


% --- Executes during object creation, after setting all properties.
function saudara_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saudara (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ipk_Callback(hObject, eventdata, handles)
% hObject    handle to ipk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ipk as text
%        str2double(get(hObject,'String')) returns contents of ipk as a double


% --- Executes during object creation, after setting all properties.
function ipk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ipk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gaji = str2double(get(handles.gaji,'String'));
semester = str2double(get(handles.semester,'String'));
saudara = str2double(get(handles.saudara,'String'));
ipk = str2double(get(handles.ipk,'String'));
opts = detectImportOptions('data.csv');
opts.SelectedVariableNames = (2:5);
data = readmatrix('data.csv', opts);
k=[0,0,1,1]; 
w=[gaji,semester,saudara,ipk];
[m n]=size(data);
r=zeros (m,n);
y=zeros (m,n);
for j=1:n,
    if k(j)==1,
        r(:,j)=data(:,j)./max(data(:,j));
    else
        r(:,j)=min(data(:,j))./data(:,j);
    end;
end;
for i=1:m,
    v(i)=sum(w.*r(i,:))
end;
set(handles.tabel2,'data',v,'visible','on');
x=sort(v,'descend');
set(handles.tabel3,'data',x,'visible','on');
