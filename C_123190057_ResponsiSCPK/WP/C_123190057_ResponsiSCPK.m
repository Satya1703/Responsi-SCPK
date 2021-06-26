function varargout = C_123190057_ResponsiSCPK(varargin)
% C_123190057_RESPONSISCPK MATLAB code for C_123190057_ResponsiSCPK.fig
%      C_123190057_RESPONSISCPK, by itself, creates a new C_123190057_RESPONSISCPK or raises the existing
%      singleton*.
%
%      H = C_123190057_RESPONSISCPK returns the handle to a new C_123190057_RESPONSISCPK or the handle to
%      the existing singleton*.
%
%      C_123190057_RESPONSISCPK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in C_123190057_RESPONSISCPK.M with the given input arguments.
%
%      C_123190057_RESPONSISCPK('Property','Value',...) creates a new C_123190057_RESPONSISCPK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before C_123190057_ResponsiSCPK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to C_123190057_ResponsiSCPK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help C_123190057_ResponsiSCPK

% Last Modified by GUIDE v2.5 26-Jun-2021 08:38:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @C_123190057_ResponsiSCPK_OpeningFcn, ...
                   'gui_OutputFcn',  @C_123190057_ResponsiSCPK_OutputFcn, ...
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


% --- Executes just before C_123190057_ResponsiSCPK is made visible.
function C_123190057_ResponsiSCPK_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to C_123190057_ResponsiSCPK (see VARARGIN)

% Choose default command line output for C_123190057_ResponsiSCPK
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes C_123190057_ResponsiSCPK wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = C_123190057_ResponsiSCPK_OutputFcn(hObject, eventdata, handles) 
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
opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = (1:5);
data = readmatrix('Real estate valuation data set.xlsx', opts);
set(handles.uitable1,'data',data,'visible','on');%membaca dan menampilkan data pada tabel


% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = (2:5);
data = readmatrix('Real estate valuation data set.xlsx', opts);
k=[0,0,1,0]; %memberikan cost dan benefit
w=[3,5,4,1]; %pembobotan kriteria
[m n]=size(data);
w=w./sum(w);

%proses perhitungan
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    v(i)=prod(data(i,:).^w); 
end;
l = v/sum(v)

opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = (1);
datanew = readmatrix('Real estate valuation data set.xlsx', opts);
xlswrite('hasilwp.xlsx', datanew, 'Sheet1', 'A1'); %menulis data pada kolom A1
v=v';%merubah dari horizontal ke vertikal
xlswrite('hasilwp.xlsx', v, 'Sheet1', 'B1'); %menulis data pada kolom B1

opts = detectImportOptions('hasilwp.xlsx');
opts.SelectedVariableNames = (1:2);
data = readmatrix('hasilwp.xlsx', opts);
x=sortrows(data,2,'descend'); %mengurutkan data dari yang terbesar
set(handles.uitable2,'data',x,'visible','on');%membaca dan menampilkan data pada tabel

% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in uitable2.
function uitable2_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
