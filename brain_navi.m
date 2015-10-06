function varargout = brain_navi(varargin)
% BRAIN_NAVI MATLAB code for brain_navi.fig
%      BRAIN_NAVI, by itself, creates a new BRAIN_NAVI or raises the existing
%      singleton*.
%
%      H = BRAIN_NAVI returns the handle to a new BRAIN_NAVI or the handle to
%      the existing singleton*.
%
%      BRAIN_NAVI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRAIN_NAVI.M with the given input arguments.
%
%      BRAIN_NAVI('Property','Value',...) creates a new BRAIN_NAVI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before brain_navi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to brain_navi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help brain_navi

% Last Modified by GUIDE v2.5 25-Aug-2015 01:17:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @brain_navi_OpeningFcn, ...
    'gui_OutputFcn',  @brain_navi_OutputFcn, ...
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


% --- Executes just before brain_navi is made visible.
function brain_navi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to brain_navi (see VARARGIN)

% Choose default command line output for brain_navi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes brain_navi wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clc

global screen_num
global out
global checkclick

screen_num = 1;
out = 1;
checkclick = 0;

set(handles.uipanel1,'Title','Step 1: Choose Option');
set(handles.popupmenu1,'String',{'Single Trial',...
    'Default Mode Connectivity'});
set(handles.importbutton,'Visible','Off');
set(handles.backbutton,'Visible','Off');
set(handles.updatebutton,'Visible','Off');
set(handles.text1,'Visible','Off');

set(handles.text2,'Visible','Off');
set(handles.text3,'Visible','Off');
set(handles.text4,'Visible','Off');
set(handles.text5,'Visible','Off');
set(handles.text6,'Visible','Off');
set(handles.text7,'Visible','Off');
set(handles.text8,'Visible','Off');
set(handles.text9,'Visible','Off');
set(handles.text10,'Visible','Off');
set(handles.text11,'Visible','Off');

set(handles.edit1,'Visible','Off');
set(handles.edit2,'Visible','Off');
set(handles.edit3,'Visible','Off');
set(handles.edit4,'Visible','Off');
set(handles.edit5,'Visible','Off');
set(handles.edit6,'Visible','Off');

% --- Outputs from this function are returned to the command line.
function varargout = brain_navi_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

global out;
out = get(hObject,'Value');

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'),...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nextbutton.
function nextbutton_Callback(hObject, eventdata, handles)
% hObject    handle to nextbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global screen_num
global out
global datacut

switch screen_num
    case 1
        set(handles.uipanel1,'Title','Step 2: Browse File/Folder');
        set(handles.popupmenu1,'Visible','Off');
        set(handles.importbutton,'Visible','On');
        switch out
            case 1
                
                set(handles.importbutton,'String','Browse File');
                
            case 2
                set(handles.importbutton,'String','Browse Directory');
        end
        screen_num = 2;
        set(handles.backbutton,'Visible','On');
    case 2
        set(handles.uipanel1,'Title','Step 2: Browse File/Folder');
    case 3
        set(handles.uipanel1,'Title','Step 3: Import Data');
        set(handles.importbutton,'String',['Import ',...
            num2str(size(handles.filename,1)),' file(s)']);
        set(handles.text1,'Visible','Off');
        screen_num = 3;
    case 4
        set(handles.uipanel1,'Title','Step 4: Personalize Parameters');
        
        set(handles.updatebutton,'Visible','On');
        
        set(handles.text1,'String','Personalize defaults');
        
        load filesearchresults.mat
        
        if totalfiles==1
            set(handles.text2,'String','Channels:');
            set(handles.text4,'String','Data Points:');
            set(handles.text6,'String','Frequency:');
        else
            set(handles.text2,'String','Minimum Channels:');
            set(handles.text4,'String','Minimum Data Points:');
            set(handles.text6,'String','Minimum Frequency:');
        end

        set(handles.text1,'String','Imported file(s) stats');
        
        load grad_data_freq.mat;
        totalchannels=mingrads;
        totaldatasize=mindatas;
        encodingfrqcy=minfreqs;
        winsiz=encodingfrqcy;
        overlap=floor(encodingfrqcy/2);
        nFFT=encodingfrqcy;
        
        set(handles.text2,'Visible','On');  %   Channels Title
        
        set(handles.edit1,'Visible','On');  %   Default value for Channels
        set(handles.edit1,'String',[num2str(1),':',num2str(totalchannels)]);
        
        set(handles.text3,'Visible','On');  %   Out of Total Channels
        set(handles.text3,'String',['/',num2str(totalchannels)]);
        
        set(handles.text4,'Visible','On');  %   Data Points Title
        
        set(handles.edit2,'Visible','On');  %   Default value for Data Points
        
        if totaldatasize>datacut
            set(handles.edit2,'String',[num2str(1),':',num2str(datacut)]);
        else
            set(handles.edit2,'String',[num2str(1),':',num2str(totaldatasize)]);
        end
        
        set(handles.text5,'Visible','On');  %   Out of Total Data Points
        set(handles.text5,'String',['/',num2str(totaldatasize)]);
        
        set(handles.text6,'Visible','On');  %   Frequency Title
        
        set(handles.edit3,'Visible','On');  %   Default Value of Frequency
        set(handles.edit3,'String',num2str(encodingfrqcy));
        
        set(handles.text7,'Visible','On');  %   Out of Original Encoded Frequency
        set(handles.text7,'String',['/',num2str(encodingfrqcy),' Hz']);
        
        set(handles.text8,'Visible','On');
        
        set(handles.text9,'Visible','On');  %   Window Size Title
        
        set(handles.edit4,'Visible','On');  %   Default Window Size
        set(handles.edit4,'String',num2str(winsiz));
        
        set(handles.text10,'Visible','On'); %   Overlap Title
        
        set(handles.edit5,'Visible','On');  %   Default Overlap Value
        set(handles.edit5,'String',num2str(overlap));
        
        set(handles.text11,'Visible','On'); %   nFFT Title
        
        set(handles.edit6,'Visible','On');  %   Default nFFT Value
        set(handles.edit6,'String',num2str(nFFT));

        screen_num=5;
        
        SF=get(handles.edit3,'String');
        SF=str2num(SF);
        winsize=get(handles.edit4,'String');
        winsize=str2num(winsize);
        overlap=get(handles.edit5,'String');
        overlap=str2num(overlap);
        nFFT=get(handles.edit6,'String');
        nFFT=str2num(nFFT);
        
        save('SF_winsize_overlap_nFFT.mat', 'SF', 'winsize', 'overlap',...
            'nFFT');
        
    case 5
        tic
        
        set(handles.uipanel1,'Title','Step 5: Generate Visualizations');
        
        set(handles.text1,'String','Calculating Coherence...');
        
        screen_num=6;
        
        set(handles.updatebutton,'Visible','Off');
        
        set(handles.text2,'Visible','Off');
        set(handles.text3,'Visible','Off');
        set(handles.text4,'Visible','Off');
        set(handles.text5,'Visible','Off');
        set(handles.text6,'Visible','Off');
        set(handles.text7,'Visible','Off');
        set(handles.text8,'Visible','Off');
        set(handles.text9,'Visible','Off');
        set(handles.text10,'Visible','Off');
        set(handles.text11,'Visible','Off');
        
        set(handles.edit1,'Visible','Off');
        set(handles.edit2,'Visible','Off');
        set(handles.edit3,'Visible','Off');
        set(handles.edit4,'Visible','Off');
        set(handles.edit5,'Visible','Off');
        set(handles.edit6,'Visible','Off');
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        load filesearchresults.mat
        load SF_winsize_overlap_nFFT.mat;
        load MEG1010regiondef.mat
        
        netout(1).name='Delta';
        netout(2).name='Theta';
        netout(3).name='Alpha';
        netout(4).name='Beta';
        netout(5).name='Hi-Beta';
        netout(6).name='Gamma';
        
        for filenumber=1:totalfiles
            fileName=['subject_',num2str(filenumber),'_hdr_data.mat'];
            load(fileName);
            disp(['processing file ', '(',num2str(filenumber),...
                '/', num2str(totalfiles), '): ',nameFile]);
            
            %%%%%%%%%%%%%%%%%%%%%%%% TODO: adaptive data setup from Step 4
            
            %   process for label organization
            
            count=1;
            lblmtx={};
            locsns=[];
            
            
            for i=1:size(region,2)
                lblmtx(count,1:2)={'-------'};
                locsns(count,1:3)=0;
                count=count+1;
                for j=1:size(region(i).sensors,2)
                    lblmtx(count,:)=[region(i).name region(i).sensors(j)];
                    ind = ~cellfun(@isempty, regexpi(lbls, ...
                        region(i).sensors(j), 'match'));
                    foundidx=xyz(ind,:);
                    locsns(count,:)=foundidx(1,:);
                    count=count+1;
                end
            end
            
            %   process for date organization
            
            cnt=1;
            
            setdata=zeros(1,size(data,2));
            for lblcount=1:size(lblmtx,1)
                indxlbl = ~cellfun(@isempty, regexpi(lbls,...
                    lblmtx(lblcount,2), 'match'));
                if sum(indxlbl)==1
                    setdata(cnt,:)=data(indxlbl,:);
                    cnt=cnt+1;
                else
                    setdata(cnt,:)=0;
                    cnt=cnt+1;
                end
            end
            
            %   set up magnetometers
            ind = 1-(~cellfun(@isempty, regexpi(lblmtx(:,2),...
                '-------', 'match')));
            ind=find(ind==1);
            
            magnetos.lbls = lblmtx(ind,2);
            magnetos.xyz = locsns(ind,:);
            magnetos.data = setdata(ind,:);
            
            %         %   downsampling of data
            %         downsampleRate=4;
            %         data = downsample(data',downsampleRate);
            %         data = data';
            
            %   frequency bands
            freqRythm(1).name='Delta';
            freqRythm(2).name='Theta';
            freqRythm(3).name='Alpha';
            freqRythm(4).name='Beta';
            freqRythm(5).name='Hi-Beta';
            freqRythm(6).name='Gamma';
            
            %   coherence computation
            Fs = SF; % Sampling frequency
            win = hanning(winsize);  % Window size
            noverlap = overlap; % overlap field
            Nfft = nFFT; % nfft constant
            
            bandCoh=[];
            
            %         listPairs = pairsGen( magnetos.lbls );
            listPairs=pairsGen(lblmtx);
            
            for c = 1:max(size(listPairs,1))
                
                x = setdata(listPairs(c,1),:);
                y = setdata(listPairs(c,2),:);
                
                if (sum(x(:))==0) || (sum(y(:))==0)
                    bandCoh(c,1:6)= 0;
                else
                    [pairCohere(c).wcoh,pairCohere(c).freq] = ...
                        mscohere(x,y,win,noverlap,Nfft,Fs);
                    
                    pairCohere(c).delta = ...
                        find((pairCohere(c).freq >= 1) & ...
                        (pairCohere(c).freq < 4));
                    pairCohere(c).theta = ...
                        find((pairCohere(c).freq >= 4) & ...
                        (pairCohere(c).freq <= 7));
                    pairCohere(c).alpha = ...
                        find((pairCohere(c).freq > 7) & ...
                        (pairCohere(c).freq < 13));
                    pairCohere(c).beta = ...
                        find((pairCohere(c).freq >= 13) & ...
                        (pairCohere(c).freq < 20));
                    pairCohere(c).hbeta = ...
                        find((pairCohere(c).freq > 20) & ...
                        (pairCohere(c).freq < 30));
                    pairCohere(c).gamma = ...
                        find(pairCohere(c).freq >= 30);
                    
                    % finding the area under  the selected band
                    pairCohere(c).wcoh_delta = ...
                        (pairCohere(c).wcoh(pairCohere(c).delta,:));
                    pairCohere(c).wcoh_theta = ...
                        (pairCohere(c).wcoh(pairCohere(c).theta,:));
                    pairCohere(c).wcoh_alpha = ...
                        (pairCohere(c).wcoh(pairCohere(c).alpha,:));
                    pairCohere(c).wcoh_beta = ...
                        (pairCohere(c).wcoh(pairCohere(c).beta,:));
                    pairCohere(c).wcoh_hbeta = ...
                        (pairCohere(c).wcoh(pairCohere(c).hbeta,:));
                    pairCohere(c).wcoh_gamma = ...
                        (pairCohere(c).wcoh(pairCohere(c).gamma,:));
                    
                    % mean of coherence in single band for each participant
                    pairCohere(c).wcoh_delta_m = ...
                        mean(pairCohere(c).wcoh_delta);
                    
                    gt1idx=find(pairCohere(c).wcoh_delta_m>1);
                    
                    if isempty(gt1idx)==0
                        pairCohere(c).wcoh_delta_m(gt1idx)=1;
                    end
                    
                    pairCohere(c).wcoh_theta_m = ...
                        mean(pairCohere(c).wcoh_theta);
                    
                    gt1idx=find(pairCohere(c).wcoh_theta_m>1);
                    
                    if isempty(gt1idx)==0
                        pairCohere(c).wcoh_theta_m(gt1idx)=1;
                    end
                    
                    pairCohere(c).wcoh_alpha_m = ...
                        mean(pairCohere(c).wcoh_alpha);
                    
                    gt1idx=find(pairCohere(c).wcoh_alpha_m>1);
                    
                    if isempty(gt1idx)==0
                        pairCohere(c).wcoh_alpha_m(gt1idx)=1;
                    end
                    
                    pairCohere(c).wcoh_beta_m = ...
                        mean(pairCohere(c).wcoh_beta);
                    
                    gt1idx=find(pairCohere(c).wcoh_beta_m>1);
                    
                    if isempty(gt1idx)==0
                        pairCohere(c).wcoh_beta_m(gt1idx)=1;
                    end
                    
                    pairCohere(c).wcoh_hbeta_m = ...
                        mean(pairCohere(c).wcoh_hbeta);
                    
                    gt1idx=find(pairCohere(c).wcoh_hbeta_m>1);
                    
                    if isempty(gt1idx)==0
                        pairCohere(c).wcoh_hbeta_m(gt1idx)=1;
                    end
                    
                    pairCohere(c).wcoh_gamma_m = ...
                        mean(pairCohere(c).wcoh_gamma);
                    
                    gt1idx=find(pairCohere(c).wcoh_gamma_m>1);
                    
                    if isempty(gt1idx)==0
                        pairCohere(c).wcoh_gamma_m(gt1idx)=1;
                    end
                    
                    % result Collection
                    bandCoh(c,1)= pairCohere(c).wcoh_delta_m;
                    bandCoh(c,2)= pairCohere(c).wcoh_theta_m;
                    bandCoh(c,3)= pairCohere(c).wcoh_alpha_m;
                    bandCoh(c,4)= pairCohere(c).wcoh_beta_m;
                    bandCoh(c,5)= pairCohere(c).wcoh_hbeta_m;
                    bandCoh(c,6)= pairCohere(c).wcoh_gamma_m;
                end
            end
            
            %   coherence of delta
            freqRythm(1).values = zeros(max(size(locsns)));
            
            for cellnum=1:max(size(listPairs))
                freqRythm(1).values (listPairs(cellnum,1),listPairs(cellnum,2))=...
                    bandCoh(cellnum,1);
                freqRythm(1).values (listPairs(cellnum,2),listPairs(cellnum,1))=...
                    bandCoh(cellnum,1);
            end
            
            %   coherence of theta
            freqRythm(2).values  = zeros(max(size(locsns)));
            
            for cellnum=1:max(size(listPairs))
                freqRythm(2).values (listPairs(cellnum,1),listPairs(cellnum,2))=...
                    bandCoh(cellnum,2);
                freqRythm(2).values (listPairs(cellnum,2),listPairs(cellnum,1))=...
                    bandCoh(cellnum,2);
            end
            
            %   coherence of alpha
            freqRythm(3).values  = zeros(max(size(locsns)));
            
            for cellnum=1:max(size(listPairs))
                freqRythm(3).values (listPairs(cellnum,1),listPairs(cellnum,2))=...
                    bandCoh(cellnum,3);
                freqRythm(3).values (listPairs(cellnum,2),listPairs(cellnum,1))=...
                    bandCoh(cellnum,3);
            end
            
            %   coherence of beta
            freqRythm(4).values = zeros(max(size(locsns)));
            
            for cellnum=1:max(size(listPairs))
                freqRythm(4).values (listPairs(cellnum,1),listPairs(cellnum,2))=...
                    bandCoh(cellnum,4);
                freqRythm(4).values (listPairs(cellnum,2),listPairs(cellnum,1))=...
                    bandCoh(cellnum,4);
            end
            
            %   coherence of hi-beta
            freqRythm(5).values  = zeros(max(size(locsns)));
            
            for cellnum=1:max(size(listPairs))
                freqRythm(5).values (listPairs(cellnum,1),listPairs(cellnum,2))=...
                    bandCoh(cellnum,5);
                freqRythm(5).values (listPairs(cellnum,2),listPairs(cellnum,1))=...
                    bandCoh(cellnum,5);
            end
            
            %   coherence of gamma
            freqRythm(6).values  = zeros(max(size(locsns)));
            
            for cellnum=1:max(size(listPairs))
                freqRythm(6).values (listPairs(cellnum,1),listPairs(cellnum,2))=...
                    bandCoh(cellnum,6);
                freqRythm(6).values (listPairs(cellnum,2),listPairs(cellnum,1))=...
                    bandCoh(cellnum,6);
            end
            
            if filenumber==1
                for band=1:6
                    netout(band).sum=freqRythm(band).values;
                end
            else
                for band=1:6
                    netout(band).sum=netout(band-1).sum+freqRythm(band).values;
                end
            end
            
            netout(1).name='Delta';
            netout(2).name='Theta';
            netout(3).name='Alpha';
            netout(4).name='Beta';
            netout(5).name='Hi-Beta';
            netout(6).name='Gamma';
            
            save(['subject_',num2str(filenumber),'_coherence.mat'],...
                'cellnum', 'freqRythm', 'fileName', 'dirselect',...
                'filenumber', 'listPairs', 'freqRythm', 'bandCoh', 'Fs',...
                'lblmtx', 'locsns', 'Nfft', 'noverlap', 'win',...
                'pairCohere', 'magnetos', 'setdata');
            
        end
        
        for files=1:filenumber
            netout(band).sum=netout(band).sum/max(netout(band).sum);
        end
        
        
        %------------------------------------------------------------------
        
        
        
        %------------------------------------------------------------------
        
        toc
        
        set(handles.text1,'String','Visualization Options');
        
        set(handles.text4,'Visible','On');
        set(handles.text4,'String','Threshold:');
        
        set(handles.edit2,'Visible','On');
        set(handles.edit2,'String','0');
        
        set(handles.updatebutton,'Visible','On');
        set(handles.updatebutton,'String','Coherence Visualization in 3D');
        
        set(handles.viXualization,'Visible','On');
        set(handles.viXualization,'String','Circular Coherence Correlation');
        
        set(handles.nextbutton,'Visible','Off');
        
        screen_num=7;
        
end

% --- Executes on button press in importbutton.
function importbutton_Callback(hObject, eventdata, handles)
% hObject    handle to importbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global out
global screen_num
global checkclick
global datacut

checkclick=0;

switch screen_num
    case 2
        switch out
            case 1
                [baseFileName, folder] = uigetfile('*tsss.fif',...
                    'Select FIF file in tSSS format only');
                if baseFileName==0 %   check if empty
                    disp('FIF file is not Selected');
                    screen_num = 2;
                else
                    set(handles.importbutton,'String',folder);
                    handles.filename(1).name=baseFileName;
                    handles.folder=folder;
                    guidata(hObject,handles);
                    screen_num = 3;
                end
                
            case 2
                %  browse control data tSSS folder
                dirselect = uigetdir;
                
                %  search for tSSS type FIF data files
                listfiles = dir([dirselect,'/*tsss.fif']);
                
                %  ONLY process directory if non-empty
                if (isempty(listfiles)) %   check if empty
                    disp('The path does not contain FIF files');
                    screen_num = 2;
                else
                    set(handles.importbutton,'String',dirselect);
                    handles.filename=listfiles; %<handles.filename(n).name>
                    handles.folder=dirselect;
                    guidata(hObject,handles);
                    screen_num = 3;
                end
        end
        set(handles.text1,'Visible','On');
        set(handles.text1,'String',[num2str(size(handles.filename,1)),'file(s) found']);
    case 3
        totalfiles=0;
        
        totgrads=0;
        totdatas=0;
        totfreqs=0;
        mingrads=0;
        mindatas=0;
        minfreqs=0;
        maxgrads=0;
        maxdatas=0;
        maxfreqs=0;
        
        if out==1
            totalfiles=1;
        else
            totalfiles=size(handles.filename,1);
        end
        
        dirselect=handles.folder;
        save('filesearchresults.mat', 'dirselect', 'totalfiles')
        
        for numfiles=1:totalfiles
            fileName=[dirselect,'\',handles.filename(numfiles).name];
            disp(['Importing file:',num2str(numfiles),'/',...
                num2str(totalfiles)]);
            
            %   read MEG file
            hdr=ft_read_header(fileName);   %   read header
            data=ft_read_data(fileName);    %   read data
            datacut=2000;
            if size(data,2)>datacut
                data=data(:,1:datacut);
            end
            handles.tempdata=size(data,2);
            
            %   fetch MEG channel positions and labels
            xyz=hdr.grad.chanpos;   %   get channel 3D coordinates
            lbls=hdr.grad.label;    %   get channel labels
            
            nameFile=handles.filename(numfiles).name;
            
            save(['subject_',num2str(numfiles),'_hdr_data.mat'], 'hdr',...
                'data', 'xyz', 'lbls', 'nameFile');
            
            totgrads(numfiles)=size(hdr.grad.label,1);
            totdatas(numfiles)=size(data,2);
            totfreqs(numfiles)=hdr.Fs;
            
        end
        
        mingrads=min(totgrads);
        mindatas=min(totdatas);
        minfreqs=min(totfreqs);
        maxgrads=max(totgrads);
        maxdatas=max(totdatas);
        maxfreqs=max(totfreqs);
        
        save('grad_data_freq.mat','totgrads','totdatas','totfreqs',...
            'mingrads','mindatas','minfreqs','maxgrads','maxdatas',...
            'maxfreqs');
        
        set(handles.importbutton,'Visible','Off');
        set(handles.text1,'Visible','On');
        set(handles.text1,'String','Data has been imported!');
        screen_num = 4;
end

% --- Executes on button press in backbutton.
function backbutton_Callback(~, eventdata, handles)
% hObject    handle to backbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global screen_num
global out

switch screen_num
    case 2
        set(handles.uipanel1,'Title','Step 1');
        set(handles.importbutton,'Visible','Off');
        set(handles.backbutton,'Visible','Off');
        set(handles.popupmenu1,'Visible','On');
        set(handles.popupmenu1,'ListboxTop',out);
        set(handles.text1,'Visible','Off');
        screen_num = 1;
    case 3
        set(handles.uipanel1,'Title','Step 2: Browse File/Folder');
        set(handles.popupmenu1,'Visible','Off');
        set(handles.importbutton,'Visible','On');
        switch out
            case 1
                set(handles.importbutton,'String','Browse File');
            case 2
                set(handles.importbutton,'String','Browse Directory');
        end
        screen_num = 2;
        set(handles.backbutton,'Visible','On');
        set(handles.text1,'Visible','Off');
        
    case 4
        set(handles.uipanel1,'Title','Step 3: Import Data');
        set(handles.text1,'Visible','Off');
        screen_num = 3;
        set(handles.importbutton,'Visible','On');
        
        set(handles.updatebutton,'Visible','Off');
        
        set(handles.text2,'Visible','Off');
        set(handles.text3,'Visible','Off');
        set(handles.text4,'Visible','Off');
        set(handles.text5,'Visible','Off');
        set(handles.text6,'Visible','Off');
        set(handles.text7,'Visible','Off');
        set(handles.text8,'Visible','Off');
        set(handles.text9,'Visible','Off');
        set(handles.text10,'Visible','Off');
        set(handles.text11,'Visible','Off');
        
        set(handles.edit1,'Visible','Off');
        set(handles.edit2,'Visible','Off');
        set(handles.edit3,'Visible','Off');
        set(handles.edit4,'Visible','Off');
        set(handles.edit5,'Visible','Off');
        set(handles.edit6,'Visible','Off');
    case 5
        set(handles.uipanel1,'Title','Step 4: Personalize Parameters');
        set(handles.updatebutton,'Visible','On');
        screen_num = 4;
        set(handles.text2,'Visible','On');
        set(handles.text3,'Visible','On');
        set(handles.text4,'Visible','On');
        set(handles.text5,'Visible','On');
        set(handles.text6,'Visible','On');
        set(handles.text7,'Visible','On');
        set(handles.text8,'Visible','On');
        set(handles.text9,'Visible','On');
        set(handles.text10,'Visible','On');
        set(handles.text11,'Visible','On');
        
        set(handles.edit1,'Visible','On');
        set(handles.edit2,'Visible','On');
        set(handles.edit3,'Visible','On');
        set(handles.edit4,'Visible','On');
        set(handles.edit5,'Visible','On');
        set(handles.edit6,'Visible','On');
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in updatebutton.
function updatebutton_Callback(hObject, eventdata, handles)
% hObject    handle to updatebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global screen_num

switch screen_num
    case 4
        catchval=get(handles.edit3,'String');
        numval=str2num(catchval);
        numval_half=floor(numval/2);
        
        set(handles.edit4,'String',catchval);
        set(handles.edit5,'String',num2str(numval_half));
        set(handles.edit6,'String',catchval);
        screen_num=5;
    case 7
        %   3d plot for coherence visualization
        figure
        
        cohThresh=get(handles.edit2,'String');
        cohThresh=str2double(cohThresh);
        
        if size(handles.filename,1)==1
            load('subject_1_coherence.mat','freqRythm','lblmtx',...
                'listPairs', 'bandCoh','locsns');
            load('subject_1_hdr_data','xyz');
        end
        
        for subplotnum=1:size(freqRythm,2)
            
            subplot(2,3,subplotnum), ...
                plot3(xyz(:,1),xyz(:,2),xyz(:,3),'g.'),...
                title(freqRythm(subplotnum).name);
            hold all
            
            for i=1:size(listPairs,1)
                
                initlbl=lblmtx(listPairs(i,1));
                termlbl=lblmtx(listPairs(i,2));
                
                if strcmp(initlbl,'-------')==1 || ...
                        strcmp(termlbl,'-------')==1
                    
                else
                    if (bandCoh(i,subplotnum)>cohThresh)
                        line([locsns(listPairs(i,1),1);locsns(listPairs(i,2),1)],...
                            [locsns(listPairs(i,1),2);locsns(listPairs(i,2),2)],...
                            [locsns(listPairs(i,1),3);locsns(listPairs(i,2),3)],'Color',...
                            [1-bandCoh(i,subplotnum) 1-bandCoh(i,subplotnum) 1-bandCoh(i,subplotnum)],...
                            'LineWidth',4);
                        
                    end
                end
                
            end
            
            hold off
            
        end
end



% --- Executes on key press with focus on edit2 and none of its controls.
function edit2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on key press with focus on edit3 and none of its controls.
function edit3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in viXualization.
function viXualization_Callback(hObject, eventdata, handles)
% hObject    handle to viXualization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


load('subject_1_coherence.mat','freqRythm','lblmtx');

threshval=get(handles.edit2,'String');
threshval=str2num(threshval);

%   circular correlation plot for coherence visualization
for subplotnum=1:size(freqRythm,2)
    gt_thresh=(freqRythm(subplotnum).values>threshval);
    valmtx=zeros(size(freqRythm(subplotnum).values));
    valmtx(gt_thresh)=freqRythm(subplotnum).values(gt_thresh);
    viXchemaball(valmtx,lblmtx), title(freqRythm(subplotnum).name);
%     saveas(gcf,freqRythm(subplotnum).name,'epsc')
%     saveas(gcf,[freqRythm(subplotnum).name,'.png'])
end
