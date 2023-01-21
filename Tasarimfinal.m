function varargout = Tasarimfinal(varargin)
% TASARIMFINAL MATLAB code for Tasarimfinal.fig
%      TASARIMFINAL, by itself, creates a new TASARIMFINAL or raises the existing
%      singleton*.
%
%      H = TASARIMFINAL returns the handle to a new TASARIMFINAL or the handle to
%      the existing singleton*.
%
%      TASARIMFINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASARIMFINAL.M with the given input arguments.
%
%      TASARIMFINAL('Property','Value',...) creates a new TASARIMFINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tasarimfinal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tasarimfinal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tasarimfinal

% Last Modified by GUIDE v2.5 20-Jan-2023 15:40:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tasarimfinal_OpeningFcn, ...
                   'gui_OutputFcn',  @Tasarimfinal_OutputFcn, ...
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


% --- Executes just before Tasarimfinal is made visible.
function Tasarimfinal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tasarimfinal (see VARARGIN)

% Choose default command line output for Tasarimfinal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tasarimfinal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tasarimfinal_OutputFcn(hObject, eventdata, handles) 
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

  files = {};
    paths = {};

    % Open file dialog to select excel files
    while true
        [file, path] = uigetfile('*.xlsx', 'Select Excel File(s)','MultiSelect','on');
        if isequal(file,0)
            break;
        elseif ischar(file)
            files{end+1} = file;
            paths{end+1} = path;
        else
            files = [files,file];
            for i=1:length(file)
                paths{end+1} = path;
            end
        end
    end

    % Check if user pressed cancel
    if isempty(files)
        disp('User selected Cancel')
        return
    end

    % Set the file names to the popup menu
    set(handles.popupmenu1, 'String', files);

    % Save the selected file to handles
    handles.selectedFiles = files;
    handles.selectedFilePaths = paths;
     I = imread('istanbulun_ilceleri.jpg');
I = imresize(I, [900 1920]);
imshow(I, 'Parent', handles.axes1);
    guidata(hObject, handles);
    
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected_item = get(handles.popupmenu1, 'String');
selected_item = selected_item{get(handles.popupmenu1, 'Value')};
[sayi , yazi , karisik] = xlsread(selected_item);
[m , n] = size(karisik);
results = [];
disp(results)
kuskulukkatsayi = 0.65
kayakatsayi = 0.5
balcikkatsayi = 0.95
toprakkatsayi = 0.7
firstkatsayi = 1.5
secondkatsayi = 1
thirdkatsayi = 0.7
fourthkatsayi = 0.5
fifthkatsayi = 0.4
birincikatsayi = 0.85
ikincikatsayi = 0.75
ucuncukatsayi = 0.57
dorduncukatsayi = 0.45

        for a = 2 : m
            if (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kuskulukkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kuskulukkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kuskulukkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kuskulukkatsayi + dorduncukatsayi)/3;
            elseif(strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kuskulukkatsayi + birincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kuskulukkatsayi + ikincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kuskulukkatsayi + ucuncukatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kuskulukkatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kuskulukkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kuskulukkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kuskulukkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kuskulukkatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kuskulukkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kuskulukkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kuskulukkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kuskulukkatsayi + dorduncukatsayi)/3;
                
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kuskulukkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kuskulukkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kuskulukkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kuskuluk') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kuskulukkatsayi + dorduncukatsayi)/3;
            end
       
     
       
            if (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kayakatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kayakatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kayakatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + kayakatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kayakatsayi + birincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kayakatsayi + ikincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kayakatsayi + ucuncukatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + kayakatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kayakatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kayakatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kayakatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + kayakatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kayakatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kayakatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kayakatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + kayakatsayi + dorduncukatsayi)/3;
                
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kayakatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kayakatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kayakatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'kaya') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + kayakatsayi + dorduncukatsayi)/3;
                end
        
       
   
         
            if (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + balcikkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + balcikkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + balcikkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + balcikkatsayi + dorduncukatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + balcikkatsayi + birincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + balcikkatsayi + ikincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + balcikkatsayi + ucuncukatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + balcikkatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + balcikkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + balcikkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + balcikkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + balcikkatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + balcikkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + balcikkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + balcikkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + balcikkatsayi + dorduncukatsayi)/3;
                
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + balcikkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + balcikkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + balcikkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'balcik') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + balcikkatsayi + dorduncukatsayi)/3;
                end
        
       
 
            if (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + toprakkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + toprakkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + toprakkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))<=20))
                results(end+1) = (firstkatsayi + toprakkatsayi + dorduncukatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + toprakkatsayi + birincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + toprakkatsayi + ikincikatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + toprakkatsayi + ucuncukatsayi)/3;
           elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=25)
                results(end+1) = (secondkatsayi + toprakkatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + toprakkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + toprakkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + toprakkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=30)
                results(end+1) = (thirdkatsayi + toprakkatsayi + dorduncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + toprakkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + toprakkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + toprakkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && (cell2mat(karisik(a , 2))<=40)
                results(end+1) = (fourthkatsayi + toprakkatsayi + dorduncukatsayi)/3;
                
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'birinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + toprakkatsayi + birincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ikinci') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + toprakkatsayi + ikincikatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'ucuncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + toprakkatsayi + ucuncukatsayi)/3;
            elseif (strcmp(karisik(a , 3) , 'toprak') == 1) && (strcmp(karisik(a , 4) , 'dorduncu') == 1) && ((cell2mat(karisik(a,2))>40))
                results(end+1) = (fifthkatsayi + toprakkatsayi + dorduncukatsayi)/3;
                end
        end
         
          high_risk_buildings = sum(results > 0.75);
          disp(high_risk_buildings)
   x = sayi(1,4)
   y = sayi(1,5)
  
if high_risk_buildings >= 0 && high_risk_buildings < 200
    % Bak?rköy ilçesini haritada ye?il nokta ile i?aretleyin
    hold on
    scatter(x, y, 'green', 'filled')
elseif high_risk_buildings >= 200 && high_risk_buildings < 400
    % Bak?rköy ilçesini haritada mavi nokta ile i?aretleyin
    hold on
    scatter(x, y, 'blue', 'filled')
elseif high_risk_buildings >= 400
    % Bak?rköy ilçesini haritada k?rm?z? nokta ile i?aretleyin
    hold on
    scatter(x, y, 'red', 'filled')
end
 guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 msgbox('Ilceleri sectikten sonra klasor ekranini kapatirsaniz ilceler yuklenecektir. Koordinat tespiti icin ilce secmelisiniz');
   


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[x,y] = ginput(1);
% T?klad??? noktan?n koordinatlar?n? yazd?r
fprintf('Tikladiginiz noktanin koordinatlari: (%.2f, %%.2f)\n', x, y);
msgbox('Bu secim opsiyoneldir, haritada istediginiz noktanin koordinatini verir. Command windowa bakiniz.');