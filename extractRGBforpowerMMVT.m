
%TODO add regexp to extract target name from filename 

clear all 

filename = uigetfile('*.csv'); 
file = readtable(filename); 

% get channel information. 
labels = load('labels_15s_001.mat'); 
labels = deblank(labels.labels);
num_ch = height(file); 

% get DBS target info from filename. 
braintarget = '(l|r)(VCVS|SCC)';
[start_idx_br, end_idx_br] = regexp(filename,braintarget);
DBStarget = extractBetween(filename,start_idx_br,end_idx_br);
DBStarget = DBStarget{1}; 
%% 

x = table2array(file(:,1)); 
y = table2array(file(:,2)); 
z = table2array(file(:,3)); 
pre_stim = table2array(file(:,4)); 
stim = table2array(file(:,5)); 
post_stim1 = table2array(file(:,6)); 
post_stim2 = table2array(file(:,7));

%% 
condition = 'pre_stim'; 

T = plot3Delecs_extractcolors(x,y,z,pre_stim,num_ch,labels); 

name = sprintf('%s_f130_%s.csv',DBStarget,condition); 
writetable(T,name,'WriteVariableNames',0); 


%% Theta stim
stim_window = 'stim'; 
plot3Delecs_extractcolors(x,y,z,stim,num_ch,labels) 


name = sprintf('%s_f130_%s.csv',DBStarget,stim_window ); 
writetable(T,name,'WriteVariableNames',0); 

%% Theta post1 
stim_window = 'post_stim1'; 
plot3Delecs_extractcolors(x,y,z,post_stim1,num_ch,labels) 

name = sprintf('%s_f130_%s.csv',DBStarget,stim_window);  
writetable(T,name,'WriteVariableNames',0); 

%% Theta post2

stim_window = 'post_stim2'; 
plot3Delecs_extractcolors(x,y,z,post_stim2,num_ch,labels) 


name = sprintf('%s_f130_%s.csv',DBStarget,stim_window); 
writetable(T,name,'WriteVariableNames',0); 









