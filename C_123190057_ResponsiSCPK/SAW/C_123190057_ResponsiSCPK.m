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

% Last Modified by GUIDE v2.5 26-Jun-2021 07:43:09

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


% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('DATA RUMAH.xlsx');
opts.SelectedVariableNames = (2:7);
data = readmatrix('DATA RUMAH.xlsx', opts);
k=[0,1,1,1,1,1]; %memberikan cost dan benefit
w=[0.3,0.2,0.23,0.1,0.07,0.1]; %pembobotan kriteria
[m n]=size(data);
r=zeros (m,n);
y=zeros (m,n);
for j=1:n,
    if k(j)==1, %memberikan atribut benefit
        r(:,j)=data(:,j)./max(data(:,j));
    else %memberikan atribut cost
        r(:,j)=min(data(:,j))./data(:,j);
    end;
end;
for i=1:m,
    v(i)=sum(w.*r(i,:)) %melakukan perhitungan
end;

opts = detectImportOptions('DATA RUMAH.xlsx');
opts.SelectedVariableNames = (1);
datanew = readmatrix('DATA RUMAH.xlsx', opts);
xlswrite('hasilsaw.xlsx', datanew, 'Sheet1', 'A1'); %menulis data pada kolom A1
v=v';
xlswrite('hasilsaw.xlsx', v, 'Sheet1', 'B1'); %menulis data pada kolom B1

opts = detectImportOptions('hasilsaw.xlsx');
opts.SelectedVariableNames = (1:2);
data = readmatrix('hasilsaw.xlsx', opts);
x=sortrows(data,2,'descend'); %mengurutkan data dari yang terbesar
set(handles.uitable2,'data',x,'visible','on');%membaca dan menampilkan data pada tabel

% --- Executes on button press in tampil.
function tampil_Callback(hObject, eventdata, handles)
% hObject    handle to tampil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('DATA RUMAH.xlsx'); %memasukkan data excel
opts.SelectedVariableNames = (1:7); %memilih kolom yang dipakai
data = readmatrix('DATA RUMAH.xlsx', opts);
set(handles.uitable1,'data',data,'visible','on');%membaca dan menampilkan data pada tabel


% --- Executes when selected cell(s) is changed in uitable2.
function uitable2_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
