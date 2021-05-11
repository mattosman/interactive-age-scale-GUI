function varargout = interactive_age_scale_GUI(varargin)
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%% Written by Matt Osman, version 1.1, Oct. 2016 %%%%%%%%%%%%%%
% %%%%%%%%%%%%%% for questions Contact: osmanm@mit.edu %%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%% Massachussetts Institute of Technology %%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%% Woods Hole Oceanographic Institution %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%% Please see the User's Manual PDF for %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%% full instructions on the use of this GUI %%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
% interactive_age_scale_GUI MATLAB code for interactive_age_scale_GUI.fig
%      interactive_age_scale_GUI, by itself, creates a new interactive_age_scale_GUI or raises the existing
%      singleton*.
%
%      H = interactive_age_scale_GUI returns the handle to a new interactive_age_scale_GUI or the handle to
%      the existing singleton*.
%
%      interactive_age_scale_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in interactive_age_scale_GUI.M with the given input arguments.
%
%      interactive_age_scale_GUI('Property','Value',...) creates a new interactive_age_scale_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interactive_age_scale_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interactive_age_scale_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interactive_age_scale_GUI

% Last Modified by GUIDE v2.5 22-May-2017 13:08:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interactive_age_scale_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @interactive_age_scale_GUI_OutputFcn, ...
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

% --- Executes just before interactive_age_scale_GUI is made visible.
function interactive_age_scale_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interactive_age_scale_GUI (see VARARGIN)

% Choose default command line output for interactive_age_scale_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% set(handles.pushbutton_pan_left,'KeyPressFcn',@pan_tie_left_right) ;
% set(handles.axes1,'KeyPressFcn',@pan_tie_left_right) ;

% UIWAIT makes interactive_age_scale_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interactive_age_scale_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu_depth.
function popupmenu_depth_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_depth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_depth


function edit_toggle_year_Callback(hObject, eventdata, handles)
% hObject    handle to edit_toggle_year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_toggle_year as text
%        str2double(get(hObject,'String')) returns contents of edit_toggle_year as a double


% --- Executes during object creation, after setting all properties.
function edit_toggle_year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_toggle_year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Pan tie point left or right%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function edit_move_tie_Callback(hObject, eventdata, handles)
% hObject    handle to edit_move_tie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_move_tie as text
%        str2double(get(hObject,'String')) returns contents of edit_move_tie as a double


% --- Executes during object creation, after setting all properties.
function edit_move_tie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_move_tie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_pan_left.
function pushbutton_pan_left_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_pan_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tie_point_value = str2num(get(handles.edit_move_tie,'String'));

    [closest_tie_point, index] = Find_closest_point(tie_point_value,handles.tieFile); % index only the tie points (those w/ values)
        handles.index = index;  % most important to save - the index locates the tie point in tieFile
                  
                     if handles.index > 1
                          handles.tieFile(handles.index - 1) = handles.tieFile(handles.index);
                          handles.tieFile(handles.index) = 0;
                                handles.index = handles.index - 1; % now need to update index as well since keeps looping when arrows are pressed            
                     elseif handles.index <= 1
                          h = errordlg('Warning! Can''t move any further left!','Warning!');
                     end
                         
                guidata(hObject, handles); % stores filename into the handles catergoryer
                     
                % delete the current plots of ties
     delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));
     
                    
                % plot revised ties, i.e., without previously deleted point
                [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c, handles.axes3a, handles.axes3b, handles.axes3c, ...
                    handles.axes4a, handles.axes4b, handles.axes4c, handles.axes5a, handles.axes5b, handles.axes5c] =...
                    plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3,...
                    handles.y4, handles.y5, handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5);
              
        
% --- Executes on button press in pushbutton_pan_right.
function pushbutton_pan_right_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_pan_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tie_point_value = str2num(get(handles.edit_move_tie,'String'));

    [closest_tie_point, index] = Find_closest_point(tie_point_value,handles.tieFile); % index only the tie points (those w/ values)
        handles.index = index;  % most important to save - the index locates the tie point in tieFile

                     if handles.index < length(handles.tieFile)
                          handles.tieFile(handles.index + 1) = handles.tieFile(handles.index);
                          handles.tieFile(handles.index) = 0;
                                handles.index = handles.index + 1; % now need to update index as well since keeps looping when arrows are pressed            
                     elseif handles.index >= length(handles.tieFile)
                          h = errordlg('Warning! Can''t move any further right!','Warning!');
                     end           
                     guidata(hObject, handles); % stores filename into the handles catergory
                     
                % delete the current plots of ties
     delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));
     
                % plot revised ties, i.e., without previously deleted point
                [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c, handles.axes3a, handles.axes3b, handles.axes3c,... 
                    handles.axes4a, handles.axes4b, handles.axes4c, handles.axes5a, handles.axes5b, handles.axes5c] =...
                plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3,  handles.y4,  handles.y5,...
                    handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5);
          

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Create new annual tie session%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in pushbutton_create_new_session.
function pushbutton_create_new_session_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_create_new_session (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.tieFile = zeros(length(handles.x),1); % call all new files new_tie_file
guidata(hObject, handles); % if saving the handles object outside of the loop, need to write to 'guidata' function

     delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));
    
     h = msgbox('New file created!');
     if ishandle(h)
        pause(1.5); delete(h) % wait 1.5 second to delete the message
     end
     
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Load a previous tie session%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pushbutton_load_previous_session.
function pushbutton_load_previous_session_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_load_previous_session (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

     delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
     delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
     delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));
     
    tieFile_name = uigetfile('*.mat');
    tieFile_file = load(tieFile_name,'tieFile','depth');
        
        % added in 4-6-17 to fix offset issue if length of previous tieFile
        % is not the same as the length of the dataset previously being
        % looked at.  This could arise if data is being added sequentially.
        if length(tieFile_file) < length(handles.x)
                button = questdlg(['Warning! The length of the tieFile you are loading in is less than the length of the current dataset you are dating.',...
                    ' As a check for consistency between the tieFile and the dataset, the minimum depth of the tieFile being loaded in is ', num2str(min(tieFile_file.depth)), ' and the minimum depth of the dataset currently being analyzed is ',num2str(min(handles.x)),'.',...
                    ' Would you like to pad the tieFile being loaded in with zeros, to make the length of the tieFile being loaded in consistent with the dataset being analyzed?'],...
                    ['Warning!'],'Yes','No','No'); 
                 if strcmp(button,'Yes')
                        zero_pad = zeros(length(handles.x)-length(tieFile_file.depth),1); 
                        tieFile_file.depth = handles.x; % redefine the depth in tieFile_file as depth
                        tieFile_file.tieFile = vertcat(tieFile_file.tieFile,zero_pad); % MOST IMPORTANT - pad the tieFile with zeros!
                            h = msgbox(['tieFile successfully padded with zeros. Proceed with caution.']);
                            if ishandle(h)
                                pause(2); delete(h);
                            end
                 elseif strcmp(button,'No')
                        h = msgbox(['tieFile not padded. Proceed with caution.']);
                            if ishandle(h)
                                pause(2); delete(h);
                            end
                 end
                
        end
                   
handles.tieFile = tieFile_file.tieFile;

[handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c, handles.axes3a, handles.axes3b, handles.axes3c,...
    handles.axes4a, handles.axes4b, handles.axes4c, handles.axes5a, handles.axes5b, handles.axes5c] = ...
plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3,  handles.y4, ...
    handles.y5, handles.axes1, handles.axes2, handles.axes3, handles.axes4,  handles.axes5);

guidata(hObject, handles); % stores filename into the handles catergory


% also must plot the old ties
    function [axes1a, axes1b, axes1c, axes2a, axes2b, axes2c, axes3a, axes3b, axes3c, axes4a, axes4b, axes4c, axes5a, axes5b, axes5c] =...
            plot_tieFile(x, tieFile, y1, y2, y3, y4, y5, axes1, axes2, axes3, axes4, axes5)
                
                        
        x = [x x];   % this may have to change, so we don't pass this along
        locate_prior_ties = tieFile ~= 0;

            axes(axes1);
            	hold on
                axes1a = plot(x(locate_prior_ties,:),[-inf inf],'-r');
                axes1b = plot(x(locate_prior_ties,1), y1(locate_prior_ties,1),'or');
                axes1c = text(x(locate_prior_ties,1) + 0.03, y1(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','red','Fontsize',11);
                hold off
            axes(axes2);
            	hold on
                axes2a = plot(x(locate_prior_ties,:),[-inf inf],'-r');
                axes2b = plot(x(locate_prior_ties,1), y2(locate_prior_ties,1),'or');
                axes2c = text(x(locate_prior_ties,1) + 0.03, y2(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','red','Fontsize',11);
                hold off
            axes(axes3);
            	hold on
                axes3a = plot(x(locate_prior_ties,:),[-inf inf],'-r');
                axes3b = plot(x(locate_prior_ties,1), y3(locate_prior_ties,1),'or');
                axes3c = text(x(locate_prior_ties,1) + 0.03, y3(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','red','Fontsize',11);
                hold off
            axes(axes4);
            	hold on
                axes4a = plot(x(locate_prior_ties,:),[-inf inf],'-r');
                axes4b = plot(x(locate_prior_ties,1), y4(locate_prior_ties,1),'or');
                axes4c = text(x(locate_prior_ties,1) + 0.03, y4(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','red','Fontsize',11);
                hold off
            axes(axes5);
                hold on
                axes5a = plot(x(locate_prior_ties,:),[-inf inf],'-r');
                axes5b = plot(x(locate_prior_ties,1), y5(locate_prior_ties,1),'or');
                axes5c = text(x(locate_prior_ties,1) + 0.03, y5(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','red','Fontsize',11);
            hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Add in New Annual Tie Point%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pushbutton_new_tie.
function pushbutton_new_tie_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_new_tie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exist = isfield(handles,'tieFile');
if exist == 0
    h = errordlg('Warning! You need to create a new tie session or load in a previous tie session first!','Warning!');
    return
elseif exist == 1
    prompt = {'Enter decimal-year to tie:'};
    handles.input_year = inputdlg(prompt); % note that input_year is a string

    [x_ginput y_ginput] = ginput(1);
    [handles.x_closest,handles.index] = Find_closest_point(x_ginput,handles.x); % index is the index of the data series
        h = msgbox(['Tie placed at ',num2str(handles.x_closest),' m']);
            if ishandle(h)
                pause(1.5); delete(h) % wait 1 second to delete the message 
            end
            % tie dot + year, vertical line
            axes(handles.axes1);
                hold on; plot(handles.x_closest, handles.y1(handles.index), 'or'); 
                text(handles.x_closest+.03, handles.y1(handles.index),handles.input_year,'color','red','Fontsize',11); 
                line([handles.x_closest handles.x_closest], [-inf inf], 'Color', [1 0 0], 'LineStyle','-'); hold off
            axes(handles.axes2);
                hold on; plot(handles.x_closest, handles.y2(handles.index), 'or'); 
                text(handles.x_closest+.03, handles.y2(handles.index),handles.input_year,'color','red','Fontsize',11); 
                line([handles.x_closest handles.x_closest], [-inf inf], 'Color', [1 0 0], 'LineStyle','-'); hold off
            axes(handles.axes3)
                hold on; plot(handles.x_closest, handles.y3(handles.index), 'or'); 
                text(handles.x_closest+.03, handles.y3(handles.index),handles.input_year,'color','red','Fontsize',11); 
                line([handles.x_closest handles.x_closest], [-inf inf], 'Color', [1 0 0], 'LineStyle','-');hold off
            axes(handles.axes4)
                hold on; plot(handles.x_closest, handles.y4(handles.index), 'or'); 
                text(handles.x_closest+.03, handles.y4(handles.index),handles.input_year,'color','red','Fontsize',11); 
                line([handles.x_closest handles.x_closest], [-inf inf], 'Color', [1 0 0], 'LineStyle','-');hold off
            axes(handles.axes5)
                hold on; plot(handles.x_closest, handles.y5(handles.index), 'or'); 
                text(handles.x_closest+.03, handles.y5(handles.index),handles.input_year,'color','red','Fontsize',11); 
                line([handles.x_closest handles.x_closest], [-inf inf], 'Color', [1 0 0], 'LineStyle','-');hold off

                %            handles.x_closest(floor(input_year)) = x_closest(floor(input_year)); % save as decimal

                    % save the points in a vector the size of the data, where the tie points
                    % are situated at x_closest - we will use these points to
                    % move around later   
                            tmp = abs(handles.x - handles.x_closest);
                            [idx, idx] = min(tmp); % this should locate the value of 0
                                handles.tieFile(idx) = str2double(handles.input_year);

                        guidata(hObject, handles); % if saving the handles object outside of the loop, need to write to 'guidata' function
    end
    
                function [x_closest,index] = Find_closest_point(x_ginput,x_data)
                   [a, b]=min((x_data-x_ginput).^2);
                   x_closest = x_data(b);
                   index = b;

                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Delete point in data series%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% --- Executes on button press in pushbutton_delete_tie.
function pushbutton_delete_tie_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_delete_tie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exist = isfield(handles,'tieFile');
if exist == 0
    h = errordlg('Warning! You need to create a new tie session or load in a previous tie session first!','Warning!');
    return
elseif exist == 1
[x_ginput y_ginput] = ginput(1);

locate_prior_ties = handles.tieFile ~= 0;
% prior_ties_indices = find(handles.tieFile ~= 0);
x = handles.x;
x(~locate_prior_ties) = 0;
    [x_closest, index] = Find_closest_point(x_ginput,x); % index only the tie points (those w/ values)
        
    button = questdlg(['You have chosen the tie for the year ',num2str(handles.tieFile(index)),'. Delete this tie?'],['Delete tie point'],'Ok','Cancel','Cancel');
        if strcmp(button,'Ok')
                handles.tieFile(index) = 0;
                    guidata(hObject, handles); % stores filename into the handles catergory
                h = msgbox(['Tie deleted!']);
                if ishandle(h)
                    pause(1); delete(h)
                end

                % delete the current plots of ties
                 delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                 delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
                 delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                 delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
                 delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                 delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
                 delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                 delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
                 delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                 delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));

                % re-do the plot of ties, without deleted point
                [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c,...
                    handles.axes3a, handles.axes3b, handles.axes3c, handles.axes4a, handles.axes4b, handles.axes4c,...
                    handles.axes5a, handles.axes5b, handles.axes5c] =...
                plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3, handles.y4, handles.y5,...
                    handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5);
               
                guidata(hObject, handles);
                                    
        elseif strcmp(button,'Cancel')
                return
        end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Load in Main Data-series%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%           

% --- Executes on button press in pushbutton_load_data.
function pushbutton_load_data_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Goal get the filename we want to read, set the popup menu so the string
% reflect the column name, then  update the popup so whenever you change
% them it will update the axis

handles.fileName_MainFile = uigetfile('*.xlsx');
guidata(hObject, handles); % stores filename into the handles catergory

setPopupmenuString(handles.popupmenu_chem1, eventdata, handles) % set the popup menu strings - create custom function for this below
setPopupmenuString(handles.popupmenu_chem2, eventdata, handles) % set the popup menu strings - create custom function for this below
setPopupmenuString(handles.popupmenu_chem3, eventdata, handles) % set the popup menu strings - create custom function for this below
setPopupmenuString(handles.popupmenu_chem4, eventdata, handles) % set the popup menu strings - create custom function for this below
setPopupmenuString(handles.popupmenu_chem5, eventdata, handles) % set the popup menu strings - create custom function for this below
setPopupmenuString(handles.popupmenu_depth, eventdata, handles) 

set(handles.popupmenu_chem1,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))')
set(handles.popupmenu_chem2,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))')
set(handles.popupmenu_chem3,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))')
set(handles.popupmenu_chem4,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))')
set(handles.popupmenu_chem5,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))')
set(handles.popupmenu_depth,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))')

set(handles.radiobutton_raw,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))') % updateAxes is the callback when you use those buttons
set(handles.radiobutton_smooth,'Callback','interactive_age_scale_GUI(''updateAxes'',gcbo,[],guidata(gcbo))')

    % needed to run the above code on execution of pushbutton_load_data
    function setPopupmenuString(hObject, eventdata, handles) % when comes in will be as hObject (keeping w/ format)
        fileName = handles.fileName_MainFile;
        [numbers, colNames] = xlsread(fileName);
        set(hObject,'string',colNames); % either popupmenuX or Y, set the string to the cell array = colNames
            
            % now we have all the components necessary to do updateAxis; remember that
            % updateAxis is going to get the columns we need to plot, we'll get those
            % from the popupmenus, then we're going to get the fileName which is
            % already stored in the handles structure, we're actually going to retrieve
            % the data with this readExcelColumns, and finally we're going to plot it!
            % now let's make updateAxes - 
        
            function updateAxes(hObject, eventdata, handles)
                chem1_ColNum  = get(handles.popupmenu_chem1,'value'); % that should tell us what column number (words) we're dealing with
                chem2_ColNum  = get(handles.popupmenu_chem2,'value'); % that should tell us what column number (words) we're dealing with
                chem3_ColNum  = get(handles.popupmenu_chem3,'value'); % that should tell us what column number (words) we're dealing with
                chem4_ColNum  = get(handles.popupmenu_chem4,'value'); % that should tell us what column number (words) we're dealing with
                chem5_ColNum  = get(handles.popupmenu_chem5,'value'); % that should tell us what column number (words) we're dealing with
                depth_ColNum  = get(handles.popupmenu_depth,'value'); % that should tell us what column number (words) we're dealing with
                % now need fileName
                fileName = handles.fileName_MainFile;
                [y1] = readExcelColumns(fileName, chem1_ColNum); % needed to create this function earlier!
                [y2] = readExcelColumns(fileName, chem2_ColNum); % needed to create this function earlier!
                [y3] = readExcelColumns(fileName, chem3_ColNum); % needed to create this function earlier!
                [y4] = readExcelColumns(fileName, chem4_ColNum); % needed to create this function earlier!
                [y5] = readExcelColumns(fileName, chem5_ColNum); % needed to create this function earlier!
                [x] = readExcelColumns(fileName, depth_ColNum); % needed to create this function earlier!
                     handles.x  = x; 
                     handles.y1 = y1; 
                     handles.y2 = y2; 
                     handles.y3 = y3; 
                     handles.y4 = y4;
                     handles.y5 = y5;% save for when we add break
                     guidata(hObject, handles); % if saving the handles object outside of the loop, need to write to 'guidata' function
                                          
                flagWantsRaw = get(handles.radiobutton_raw,'value');
                flagWantsNormalized = get(handles.radiobutton_smooth,'value');
                    exist = isfield(handles,'tieFile');
                    exist_val_x_deep = isfield(handles,'val_x_deep'); % could also do lower ...
                        
                    if exist == 0
                            
                            if flagWantsRaw
                                if exist_val_x_deep == 0 % conditional takes care of the situation where a tieFile has been loaded, but the x-lim has not been set
                                    plot(handles.axes1, x, y1, '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)]); 
                                    plot(handles.axes2, x, y2, '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)]); 
                                    plot(handles.axes3, x, y3, '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)]); 
                                    plot(handles.axes4, x, y4, '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)]); 
                                    plot(handles.axes5, x, y5, '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)]); 
                                elseif exist_val_x_deep == 1
                                    plot(handles.axes1, x, y1, '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes2, x, y2, '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes3, x, y3, '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes4, x, y4, '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes5, x, y5, '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                end
                            elseif flagWantsNormalized
                                if exist_val_x_deep == 0 % conditional takes care of the situation where a tieFile has been loaded, but the x-lim has not been set
                                    plot(handles.axes1, x, smooth(y1,5), '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)]); 
                                    plot(handles.axes2, x, smooth(y2,5), '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)]); 
                                    plot(handles.axes3, x, smooth(y3,5), '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)]); 
                                    plot(handles.axes4, x, smooth(y4,5), '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)]); 
                                    plot(handles.axes5, x, smooth(y5,5), '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)]); 
                                elseif exist_val_x_deep == 1
                                    plot(handles.axes1, x, smooth(y1,5), '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes2, x, smooth(y2,5), '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes3, x, smooth(y3,5), '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes4, x, smooth(y4,5), '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes5, x, smooth(y5,5), '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                end
                            end
                            
                        elseif exist == 1
                            if flagWantsRaw
                               
                                if exist_val_x_deep == 0 % conditional takes care of the situation where a tieFile has been loaded, but the x-lim has not been set
                                    plot(handles.axes1, x, y1, '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)]); 
                                    plot(handles.axes2, x, y2, '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)]); 
                                    plot(handles.axes3, x, y3, '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)]); 
                                    plot(handles.axes4, x, y4, '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)]); 
                                    plot(handles.axes5, x, y5, '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)]); 
                                elseif exist_val_x_deep == 1
                                    plot(handles.axes1, x, y1, '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes2, x, y2, '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes3, x, y3, '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes4, x, y4, '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes5, x, y5, '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                end
                                
                                delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));

                                [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c, handles.axes3a, handles.axes3b, handles.axes3c,...
                                    handles.axes4a, handles.axes4b, handles.axes4c, handles.axes5a, handles.axes5b, handles.axes5c] = ...
                                plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3,  handles.y4, ...
                                    handles.y5, handles.axes1, handles.axes2, handles.axes3, handles.axes4,  handles.axes5);
                                
                                guidata(hObject, handles);
                                
                            elseif flagWantsNormalized
                                
                                if exist_val_x_deep == 0 % conditional takes care of the situation where a tieFile has been loaded, but the x-lim has not been set
                                    plot(handles.axes1, x, smooth(y1,5), '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)]); 
                                    plot(handles.axes2, x, smooth(y2,5), '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)]); 
                                    plot(handles.axes3, x, smooth(y3,5), '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)]); 
                                    plot(handles.axes4, x, smooth(y4,5), '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)]); 
                                    plot(handles.axes5, x, smooth(y5,5), '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)]); 
                                elseif exist_val_x_deep == 1
                                    plot(handles.axes1, x, smooth(y1,5), '-k'); set(handles.axes1,'ylim',[min(y1) prctile(y1,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes2, x, smooth(y2,5), '-k'); set(handles.axes2,'ylim',[min(y2) prctile(y2,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes3, x, smooth(y3,5), '-k'); set(handles.axes3,'ylim',[min(y3) prctile(y3,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes4, x, smooth(y4,5), '-k'); set(handles.axes4,'ylim',[min(y4) prctile(y4,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                    plot(handles.axes5, x, smooth(y5,5), '-k'); set(handles.axes5,'ylim',[min(y5) prctile(y5,97.5)],'xlim',[handles.val_x_lower,handles.val_x_deep]); 
                                end
                                
                                delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
                                delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                                delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));

                                [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c, handles.axes3a, handles.axes3b, handles.axes3c,...
                                    handles.axes4a, handles.axes4b, handles.axes4c, handles.axes5a, handles.axes5b, handles.axes5c] = ...
                                plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3,  handles.y4, ...
                                    handles.y5, handles.axes1, handles.axes2, handles.axes3, handles.axes4,  handles.axes5);
                            
                                guidata(hObject, handles);
                                
                            end
                        end
                        
                    % function to read in the Excel Columns - will also use
                    % for loading tie points
                            function [data] = readExcelColumns(fileName, ColNum)
                                file = xlsread(fileName);
                                data = file(:,ColNum);
                               
                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%Load Absolute Tie Points%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in pushbutton_load_absolute_ties.
function pushbutton_load_absolute_ties_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_load_absolute_ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.fileName_AbsoluteTiesFile = uigetfile('*.xlsx');
guidata(hObject, handles); % stores filename into the handles catergory

    setPopupmenuString_Ties(handles.popupmenu_depth_absolute_ties, eventdata, handles) % set the popup menu strings - create custom function for this below
    setPopupmenuString_Ties(handles.popupmenu_age_absolute_ties, eventdata, handles) % set the popup menu strings - create custom function for this below
    set(handles.popupmenu_depth_absolute_ties,'Callback','interactive_age_scale_GUI(''updateAxes_ties'',gcbo,[],guidata(gcbo))')
    set(handles.popupmenu_age_absolute_ties,'Callback','interactive_age_scale_GUI(''updateAxes_ties'',gcbo,[],guidata(gcbo))')

    function setPopupmenuString_Ties(hObject, eventdata, handles) % when comes in will be as hObject (keeping w/ format)
        fileName = handles.fileName_AbsoluteTiesFile;
        [numbers, colNames] = xlsread(fileName);
        set(hObject,'string',colNames); % either popupmenuX or Y, set the string to the cell array = colNames

        % needed to run the above code on execution of pushbutton_load_ties
%     function setPopupmenuString(hObject, eventdata, handles) % when comes in will be as hObject (keeping w/ format)
%         fileName = handles.fileName;
%         [numbers, colNames] = xlsread(fileName);
%         set(hObject,'string',colNames); % either popupmenuX or Y, set the string to the cell array = colNames

                function updateAxes_ties(hObject, eventdata, handles)
                ties_ColNum  = get(handles.popupmenu_depth_absolute_ties,'value'); % that should tell us what column number (words) we're dealing with
                age_ColNum  = get(handles.popupmenu_age_absolute_ties,'value'); % that should tell us what column number (words) we're dealing with
                % now need fileName
                fileName = handles.fileName_AbsoluteTiesFile;
                handles.ties = readExcelColumns(fileName, ties_ColNum); % needed to create this function earlier!    
                handles.age = readExcelColumns(fileName, age_ColNum); % needed to create this function earlier!    
                     guidata(hObject, handles); % if saving the handles object outside of the loop, need to write to 'guidata' function


% --- Executes on button press in pushbutton_plot_absolute_ties.
function pushbutton_plot_absolute_ties_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_plot_absolute_ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

     exist = isfield(handles,'ties');
        if exist == 0
            h = errordlg('Warning! You need to load in the file containing the absolute tie points first!','Warning!');
            return
        elseif exist == 1
            
             delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','red'})); 
             delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','red'}));
             delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','red'})); 
             delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','red'}));
             delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','red'})); 
             delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','red'}));
             delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','red'})); 
             delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','red'}));
             delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','red'})); 
             delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','red'}));

                % find the chemical values [conc] of whatever data is being
                % displayed at the moment
                    ties = [handles.ties handles.ties]; % used for plotting
                    age = handles.age;
                    
                    for i = 1:length(ties(:,1))
                        tmp = abs(handles.x - ties(i,1));
                        [idx, idx] = min(tmp);
                            closest_y1(i,1) = handles.y1(idx);
                            closest_y2(i,1) = handles.y2(idx);
                            closest_y3(i,1) = handles.y3(idx);
                            closest_y4(i,1) = handles.y4(idx);
                            closest_y5(i,1) = handles.y5(idx);
                    end
                        
                        axes(handles.axes1);
                        	hold on; 
                            plot(ties, repmat([-inf inf],[size(ties,1),1]), '--b'); 
                            plot(ties, closest_y1,'ob');
                            text(ties(:,1)+.03, closest_y1, num2str(age),'color','blue','Fontsize',11);
                            hold off;
                        axes(handles.axes2);
                            hold on; 
                            plot(ties, repmat([-inf inf],[size(ties,1),1]), '--b');
                            plot(ties, closest_y2,'ob');
                            text(ties(:,1)+.03, closest_y2, num2str(age),'color','blue','Fontsize',11);
                            hold off;
                        axes(handles.axes3);
                            hold on; 
                            plot(ties, repmat([-inf inf],[size(ties,1),1]), '--b'); % [-inf inf]
                            plot(ties, closest_y3,'ob');
                            text(ties(:,1)+.03, closest_y3, num2str(age),'color','blue','Fontsize',11);
                            hold off;
                        axes(handles.axes4);
                            hold on; 
                            plot(ties, repmat([-inf inf],[size(ties,1),1]), '--b'); 
                            plot(ties, closest_y4,'ob');
                            text(ties(:,1)+.03, closest_y4, num2str(age),'color','blue','Fontsize',11);
                            hold off;
                        axes(handles.axes5);
                            hold on; 
                            plot(ties, repmat([-inf inf],[size(ties,1),1]), '--b'); 
                            plot(ties, closest_y5,'ob');
                            text(ties(:,1)+.03, closest_y5, num2str(age),'color','blue','Fontsize',11);
                            hold off;
                        
        end



% --- Executes on selection change in popupmenu_depth_absolute_ties.
function popupmenu_depth_absolute_ties_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_depth_absolute_ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_depth_absolute_ties contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_depth_absolute_ties


% --- Executes during object creation, after setting all properties.
function popupmenu_depth_absolute_ties_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_depth_absolute_ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_age_absolute_ties.
function popupmenu_age_absolute_ties_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_age_absolute_ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_age_absolute_ties contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_age_absolute_ties


% --- Executes during object creation, after setting all properties.
function popupmenu_age_absolute_ties_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_age_absolute_ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%Edit Domain of Depth Series%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% --- Executes during object creation, after setting all properties.
function popupmenu_depth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_depth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on popupmenu_depth and none of its controls.
function popupmenu_depth_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_depth (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


function edit_domain_shallow_Callback(hObject, eventdata, handles)
% hObject    handle to edit_domain_shallow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_domain_shallow as text
%        str2double(get(hObject,'String')) returns contents of edit_domain_shallow as a double


% --- Executes during object creation, after setting all properties.
function edit_domain_shallow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_domain_shallow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_domain_deep_Callback(hObject, eventdata, handles)
% hObject    handle to edit_domain_deep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_domain_deep as text
%        str2double(get(hObject,'String')) returns contents of edit_domain_deep as a double


% --- Executes during object creation, after setting all properties.
function edit_domain_deep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_domain_deep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_set_x_domain.
function pushbutton_set_x_domain_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_set_x_domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.val_x_lower = str2num(get(handles.edit_domain_shallow,'String'));
handles.val_x_deep = str2num(get(handles.edit_domain_deep,'String'));
    if handles.val_x_lower > handles.val_x_deep
        h = msgbox('Shallow Limit > Deeper Limit! - Change the order of your values');
            if ishandle(h)
                pause(3); delete(h);
            end
        return
    end
set(handles.axes1,'xlim',[handles.val_x_lower,handles.val_x_deep])
set(handles.axes2,'xlim',[handles.val_x_lower,handles.val_x_deep])
set(handles.axes3,'xlim',[handles.val_x_lower,handles.val_x_deep])
set(handles.axes4,'xlim',[handles.val_x_lower,handles.val_x_deep])
set(handles.axes5,'xlim',[handles.val_x_lower,handles.val_x_deep])

guidata(hObject, handles); %


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Edit Domain of Chem1%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popupmenu_chem1.
function popupmenu_chem1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_chem1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_chem1


% --- Executes during object creation, after setting all properties.
function popupmenu_chem1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_min_chem1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min_chem1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min_chem1 as text
%        str2double(get(hObject,'String')) returns contents of edit_min_chem1 as a double


% --- Executes during object creation, after setting all properties.
function edit_min_chem1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min_chem1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_max_chem1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max_chem1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max_chem1 as text
%        str2double(get(hObject,'String')) returns contents of edit_max_chem1 as a double


% --- Executes during object creation, after setting all properties.
function edit_max_chem1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max_chem1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_set_y_domain_chem1.
function pushbutton_set_y_domain_chem1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_set_y_domain_chem1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_chem1_min = str2num(get(handles.edit_min_chem1,'String'));
val_chem1_max = str2num(get(handles.edit_max_chem1,'String'));
    if val_chem1_min > val_chem1_max
        h = msgbox('Y-min > Y-max! - Change the order of your values');
            if ishandle(h)
                pause(3); delete(h);
            end
        return
    end
set(handles.axes1,'ylim',[val_chem1_min,val_chem1_max])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Edit Domain of Chem2%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popupmenu_chem2.
function popupmenu_chem2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_chem2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_chem2


% --- Executes during object creation, after setting all properties.
function popupmenu_chem2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_min_chem2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min_chem2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min_chem2 as text
%        str2double(get(hObject,'String')) returns contents of edit_min_chem2 as a double


% --- Executes during object creation, after setting all properties.
function edit_min_chem2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min_chem2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_max_chem2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max_chem2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max_chem2 as text
%        str2double(get(hObject,'String')) returns contents of edit_max_chem2 as a double


% --- Executes during object creation, after setting all properties.
function edit_max_chem2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max_chem2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_set_y_domain_chem2.
function pushbutton_set_y_domain_chem2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_set_y_domain_chem2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_chem2_min = str2num(get(handles.edit_min_chem2,'String'));
val_chem2_max = str2num(get(handles.edit_max_chem2,'String'));
    if val_chem2_min > val_chem2_max
        h = msgbox('Y-min > Y-max! - Change the order of your values');
            if ishandle(h)
                pause(3); delete(h);
            end
        return
    end
set(handles.axes2,'ylim',[val_chem2_min,val_chem2_max])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Edit Domain of Chem3%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on selection change in popupmenu_chem3.
function popupmenu_chem3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_chem3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_chem3


% --- Executes during object creation, after setting all properties.
function popupmenu_chem3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_min_chem3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min_chem3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min_chem3 as text
%        str2double(get(hObject,'String')) returns contents of edit_min_chem3 as a double


% --- Executes during object creation, after setting all properties.
function edit_min_chem3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min_chem3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_max_chem3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max_chem3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max_chem3 as text
%        str2double(get(hObject,'String')) returns contents of edit_max_chem3 as a double


% --- Executes during object creation, after setting all properties.
function edit_max_chem3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max_chem3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_set_y_domain_chem3.
function pushbutton_set_y_domain_chem3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_set_y_domain_chem3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_chem3_min = str2num(get(handles.edit_min_chem3,'String'));
val_chem3_max = str2num(get(handles.edit_max_chem3,'String'));
    if val_chem3_min > val_chem3_max
        h = msgbox('Y-min > Y-max! - Change the order of your values');
            if ishandle(h)
                pause(3); delete(h);
            end
        return
    end
set(handles.axes3,'ylim',[val_chem3_min,val_chem3_max])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Edit Domain of Chem4%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popupmenu_chem4.
function popupmenu_chem4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_chem4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_chem4


% --- Executes during object creation, after setting all properties.
function popupmenu_chem4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_min_chem4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min_chem4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min_chem4 as text
%        str2double(get(hObject,'String')) returns contents of edit_min_chem4 as a double


% --- Executes during object creation, after setting all properties.
function edit_min_chem4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min_chem4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_max_chem4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max_chem4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max_chem4 as text
%        str2double(get(hObject,'String')) returns contents of edit_max_chem4 as a double


% --- Executes during object creation, after setting all properties.
function edit_max_chem4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max_chem4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_set_y_domain_chem4.
function pushbutton_set_y_domain_chem4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_set_y_domain_chem4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_chem4_min = str2num(get(handles.edit_min_chem4,'String'));
val_chem4_max = str2num(get(handles.edit_max_chem4,'String'));
    if val_chem4_min > val_chem4_max
        h = msgbox('Y-min > Y-max! - Change the order of your values');
            if ishandle(h)
                pause(3); delete(h);
            end
        return
    end
set(handles.axes4,'ylim',[val_chem4_min,val_chem4_max])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Edit Domain of Chem5%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on selection change in popupmenu_chem5.
function popupmenu_chem5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_chem5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_chem5


% --- Executes during object creation, after setting all properties.
function popupmenu_chem5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_chem5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_min_chem5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min_chem5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min_chem5 as text
%        str2double(get(hObject,'String')) returns contents of edit_min_chem5 as a double


% --- Executes during object creation, after setting all properties.
function edit_min_chem5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min_chem5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_max_chem5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max_chem5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max_chem5 as text
%        str2double(get(hObject,'String')) returns contents of edit_max_chem5 as a double


% --- Executes during object creation, after setting all properties.
function edit_max_chem5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max_chem5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_set_y_domain_chem5.
function pushbutton_set_y_domain_chem5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_set_y_domain_chem5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_chem5_min = str2num(get(handles.edit_min_chem5,'String'));
val_chem5_max = str2num(get(handles.edit_max_chem5,'String'));
    if val_chem5_min > val_chem5_max
        h = msgbox('Y-min > Y-max! - Change the order of your values');
            if ishandle(h)
                pause(3); delete(h);
            end
        return
    end
set(handles.axes5,'ylim',[val_chem5_min,val_chem5_max])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Shift Tie Point Ages%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in pushbutton_shift_ties.
function pushbutton_shift_ties_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_shift_ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exist = isfield(handles,'tieFile');
if exist == 0
    h = errordlg('Warning! You need to create a new tie session or load in a previous tie session first!','Warning!');
    return
elseif exist == 1
    
    choice = questdlg(['Would you like to Shift or Delete a group of tie points?'], ...
        ['Shift or delete tie points?'],'Shift','Delete','Cancel','Cancel');
    
    if strcmp(choice,'Shift') % if this is correct, continue to the oldest tie point

        h = msgbox(['Choose the youngest tie point to shift.']);
            if ishandle(h)
                pause(3); delete(h);
            end

        locate_prior_ties = handles.tieFile ~= 0;
        % prior_ties_indices = find(handles.tieFile ~= 0);
        x = handles.x;

        [x_ginput_youngest y_ginput_youngest] = ginput(1);
        x(~locate_prior_ties) = 0;
            [x_closest_youngest, index_youngest] = Find_closest_point(x_ginput_youngest,x); % index only the tie points (those w/ values)

        button1 = questdlg(['You have chosen the youngest tie as the year ',num2str(handles.tieFile(index_youngest)),...
            '. Is this correct?'],['Locate youngest tie point'],'Yes','No','No');

            if strcmp(button1,'Yes') % if this is correct, continue to the oldest tie point

               h = msgbox(['Now choose the oldest tie point to shift.']);
                if ishandle(h)
                    pause(3); delete(h);
                end

               [x_ginput_oldest y_ginput_oldest] = ginput(1);
                    [x_closest_oldest, index_oldest] = Find_closest_point(x_ginput_oldest,x); % index only the tie points (those w/ values)

               button2 = questdlg(['You have chosen the oldest tie as the year ',num2str(handles.tieFile(index_oldest)),...
                    '. Is this correct?'],['Locate oldest tie point to shift'],'Yes','No','No');

                if strcmp(button2,'Yes') % if this is correct, continue to the oldest tie point

                % add in warning to repick the 2nd point if it is not older
                % than the younger point
                    if handles.tieFile(index_youngest) < handles.tieFile(index_oldest)
                        h = errordlg('Warning! The "youngest age" selected appears to be older than the "oldest age" selected! Please start over','Warning!');
                        return
                    elseif handles.tieFile(index_youngest) >= handles.tieFile(index_oldest)

                        % replot values to be shifted as green points
                        [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c,...
                            handles.axes3a, handles.axes3b, handles.axes3c, handles.axes4a, handles.axes4b, handles.axes4c,...
                            handles.axes5a, handles.axes5b, handles.axes5c] = ...
                        plot_tieFile_shift_ties(handles.x, index_youngest, index_oldest, handles.tieFile, handles.y1, handles.y2, handles.y3, handles.y4, handles.y5,...
                            handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5);

                        % input the numeric value to shift points by - 
                        shift = {['Input numeric value to add (input positive number) or subtract (input negative number) all the tie point ages in the range of ',...
                            num2str(handles.tieFile(index_oldest)),' to ',num2str(handles.tieFile(index_youngest)),' by:']};
                        handles.shift = inputdlg(shift); % note that input_year is a string
                            handles.shift = str2double(handles.shift); % convert to numeric value

                    % index all values less than the youngest tie point and all
                    % values greater than the oldest tie point
                        for i = index_youngest:index_oldest % the for loop only index values by the indexed values chosen interactively
                            if handles.tieFile(i) >= handles.tieFile(index_oldest) && handles.tieFile(i) <= handles.tieFile(index_youngest) && handles.tieFile(i) ~= 0
                                handles.tieFile(i) = handles.tieFile(i) + handles.shift;
                            end
                        end

                        guidata(hObject, handles); % stores filename into the handles category

                        h = msgbox(['Age shift successful!']);
                            if ishandle(h)
                                pause(3); delete(h);
                            end
                        % delete the current plots of ties
                        delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));

                        % re-do the plot of ties, without deleted point
                        [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c,...
                            handles.axes3a, handles.axes3b, handles.axes3c, handles.axes4a, handles.axes4b, handles.axes4c,...
                            handles.axes5a, handles.axes5b, handles.axes5c] = ...
                        plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3, handles.y4, handles.y5,...
                            handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5);

                        guidata(hObject, handles); % append updates to handles block

                    end   

                elseif strcmp(button2,'No')
                        h = msgbox(['Age shift cancelled, please try again.']);
                            if ishandle(h)
                                pause(2); delete(h);
                            end
                        return
                end

            %%%%%%%%%%%%%%%%%%%%%%%        

            elseif strcmp(button1,'No')
                    h = msgbox(['Age shift cancelled, please try again.']);
                        if ishandle(h)
                            pause(2); delete(h);
                        end
                    return
            end
            
    elseif strcmp(choice,'Delete')
        
        h = msgbox(['Choose the youngest tie point to delete.']);
            if ishandle(h)
                pause(3); delete(h);
            end

        locate_prior_ties = handles.tieFile ~= 0;
        % prior_ties_indices = find(handles.tieFile ~= 0);
        x = handles.x;

        [x_ginput_youngest y_ginput_youngest] = ginput(1);
        x(~locate_prior_ties) = 0;
            [x_closest_youngest, index_youngest] = Find_closest_point(x_ginput_youngest,x); % index only the tie points (those w/ values)

        button1 = questdlg(['You have chosen the youngest tie as the year ',num2str(handles.tieFile(index_youngest)),...
            '. Is this correct?'],['Locate youngest tie point'],'Yes','No','No');

            if strcmp(button1,'Yes') % if this is correct, continue to the oldest tie point

               h = msgbox(['Now choose the oldest tie point to delete.']);
                if ishandle(h)
                    pause(3); delete(h);
                end

               [x_ginput_oldest y_ginput_oldest] = ginput(1);
                    [x_closest_oldest, index_oldest] = Find_closest_point(x_ginput_oldest,x); % index only the tie points (those w/ values)

               button2 = questdlg(['You have chosen the oldest tie as the year ',num2str(handles.tieFile(index_oldest)),...
                    '. Is this correct?'],['Locate oldest tie point'],'Yes','No','No');

                if strcmp(button2,'Yes') % if this is correct, continue to the oldest tie point

                % add in warning to repick the 2nd point if it is not older
                % than the younger point
                    if handles.tieFile(index_youngest) < handles.tieFile(index_oldest)
                        h = errordlg('Warning! The "youngest age" selected appears to be older than the "oldest age" selected! Please start over','Warning!');
                        return
                    elseif handles.tieFile(index_youngest) >= handles.tieFile(index_oldest)

                        % replot values to be shifted as green points
                        [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c,...
                            handles.axes3a, handles.axes3b, handles.axes3c, handles.axes4a, handles.axes4b, handles.axes4c,...
                            handles.axes5a, handles.axes5b, handles.axes5c] = ...
                        plot_tieFile_shift_ties(handles.x, index_youngest, index_oldest, handles.tieFile, handles.y1, handles.y2, handles.y3, handles.y4, handles.y5,...
                            handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5);

                            h = msgbox(['Deleting points.']);
                            if ishandle(h)
                                pause(2); delete(h);
                            end

                    % index all values less than the youngest tie point and all
                    % values greater than the oldest tie point
                        for i = index_youngest:index_oldest % the for loop only index values by the indexed values chosen interactively
                            handles.tieFile(i) = 0; % set to 0
                        end
                        guidata(hObject, handles); % stores filename into the handles category

                        h = msgbox(['Tie deletion successful!']);
                            if ishandle(h)
                                pause(3); delete(h);
                            end
                        % delete the current plots of ties
                        delete(findobj(handles.axes1, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes1, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes2, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes2, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes3, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes3, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes4, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes4, 'type', 'text','-and','-not',{'Color','blue'}));
                        delete(findobj(handles.axes5, 'type', 'line','-and','-not',{'Color','black'},'-and','-not',{'Color','blue'})); 
                        delete(findobj(handles.axes5, 'type', 'text','-and','-not',{'Color','blue'}));

                        % re-do the plot of ties, without deleted point
                        [handles.axes1a, handles.axes1b, handles.axes1c, handles.axes2a, handles.axes2b, handles.axes2c,...
                            handles.axes3a, handles.axes3b, handles.axes3c, handles.axes4a, handles.axes4b, handles.axes4c,...
                            handles.axes5a, handles.axes5b, handles.axes5c] = ...
                        plot_tieFile(handles.x, handles.tieFile, handles.y1, handles.y2, handles.y3, handles.y4, handles.y5,...
                            handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5);

                        guidata(hObject, handles); % append updates to handles block

                    end   

                elseif strcmp(button2,'No')
                        h = msgbox(['Tie deletion cancelled, please try again.']);
                            if ishandle(h)
                                pause(2); delete(h);
                            end
                        return
                end

            %%%%%%%%%%%%%%%%%%%%%%%        

            elseif strcmp(button1,'No')
                    h = msgbox(['Tie deletion cancelled, please try again.']);
                        if ishandle(h)
                            pause(2); delete(h);
                        end
                    return
            end        
        
    elseif strcmp(choice,'Cancel')
        return
    end
        
end

    function [axes1a, axes1b, axes1c, axes2a, axes2b, axes2c, axes3a, axes3b, axes3c, axes4a, axes4b, axes4c, axes5a, axes5b, axes5c] =...
            plot_tieFile_shift_ties(x, index_youngest, index_oldest, tieFile, y1, y2, y3, y4, y5, axes1, axes2, axes3, axes4, axes5)
        % this function is essentially the same as plot_tieFile, except it only indexes values in the indexed range of 
        % index_youngest to index_oldest, and plots over those values as the color green
                                
        x = [x x];   % this may have to change, so we don't pass this along
        locate_prior_ties = tieFile ~= 0;
        % now, remove values <index_youngest and >index_oldest
        locate_prior_ties(1:(index_youngest-1)) = false; 
        locate_prior_ties((index_oldest+1):end) = false; 

        axes(axes1);
        	hold on
            axes1a = plot(x(locate_prior_ties,:),[-inf inf],'-g');
            axes1b = plot(x(locate_prior_ties,1), y1(locate_prior_ties,1),'og');
            axes1c = text(x(locate_prior_ties,1) + 0.03, y1(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','green','Fontsize',11);% ,'FontWeight','bold');
            hold off
        axes(axes2);
            hold on
            axes2a = plot(x(locate_prior_ties,:),[-inf inf],'-g');
            axes2b = plot(x(locate_prior_ties,1), y2(locate_prior_ties,1),'og');
            axes2c = text(x(locate_prior_ties,1) + 0.03, y2(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','green','Fontsize',11);%,'FontWeight','bold');
            hold off
        axes(axes3);
            hold on
            axes3a = plot(x(locate_prior_ties,:),[-inf inf],'-g');
            axes3b = plot(x(locate_prior_ties,1), y3(locate_prior_ties,1),'og');
            axes3c = text(x(locate_prior_ties,1) + 0.03, y3(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','green','Fontsize',11);%,'FontWeight','bold');
            hold off
        axes(axes4);
            hold on
            axes4a = plot(x(locate_prior_ties,:),[-inf inf],'-g');
            axes4b = plot(x(locate_prior_ties,1), y4(locate_prior_ties,1),'og');
            axes4c = text(x(locate_prior_ties,1) + 0.03, y4(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','green','Fontsize',11);%,'FontWeight','bold');
            hold off
        axes(axes5);
            hold on
            axes5a = plot(x(locate_prior_ties,:),[-inf inf],'-g');
            axes5b = plot(x(locate_prior_ties,1), y5(locate_prior_ties,1),'og');
            axes5c = text(x(locate_prior_ties,1) + 0.03, y5(locate_prior_ties,1),num2str(tieFile(locate_prior_ties)),'color','green','Fontsize',11);%,'FontWeight','bold');
            hold off            
            
        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%Save the Tie Points & Interpolate%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton_load_ties.
prompt = {'Save filename as:'};
tieFile_name = inputdlg(prompt); % note that input_year is a string
tieFile = handles.tieFile;

% output depth upon saving
depth = handles.x;

% interpolate the ties
    interpolated_ties = tieFile;
        interpolated_ties(interpolated_ties == 0) = nan;
        nans_interpolated_ties = isnan(interpolated_ties);
        interpolated_ties(nans_interpolated_ties) = interp1(handles.x(~nans_interpolated_ties), interpolated_ties(~nans_interpolated_ties), handles.x(nans_interpolated_ties),'linear');
          
        
save(char(strcat(cell(tieFile_name),'.mat')),'tieFile','interpolated_ties','depth');
% h = msgbox(['File successfully saved. To view the interpolated time-scale,',strcat('see the variable "interpolated_ties" in -"', cell(tieFile_name), '.mat".')],'Success!');
% pause(5); delete(h)

% Option to view the age-depth scale
    button = questdlg(['File successfully saved. To view the interpolated time-scale vector,',strcat('see the variable "interpolated_ties" in "', cell(tieFile_name), '.mat".'),...
        'Would you like to plot the age-depth scale of the file ',strjoin(strcat(cell(tieFile_name),'.mat?'))],...
        ['Success!'],'Yes','No','No');
            if strcmp(button,'Yes')
                locateTies = tieFile ~= 0;
                tie_points = tieFile(locateTies);
                depth_points = depth(locateTies);
                    figure
                    a = plot(interpolated_ties,depth,'-k');
                        hold on
                    b = plot(tie_points,depth_points,'or');
                        title('Age-Depth Scale')
                        xlabel('Age')
                        ylabel('Depth')
                        legend([b a],'Tie Points','Interpolated Points')
                            set(gca,'Fontsize',14)
            elseif strcmp(button,'No')
                    return
            end       
