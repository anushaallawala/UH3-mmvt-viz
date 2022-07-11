
filename = uigetfile('*.xlsx'); 
file = xlsread(filename); 

% from oscar for brain region names that need to be highlighted. 
labels = {'OFC','vmPFC','dlPFC','ACC'};
alpha = file(3,:); 
x = length(alpha); 
y = length(alpha); 
c = alpha; 

theta = file(2,:); 

figure() 
h = scatter(x,y,10,c); 
Cdata = h.CData; 
cmap = colormap(redblue)
colormap parula
%% 

colormap(redblue) 

scalar = theta; 
colormap(redblue) 
colorbar
cmap = colormap;
scalarclamped = scalar;
scalarclamped(scalar < climits(1)) = climits(1);
scalarclamped(scalar > climits(2)) = climits(2);
rgb = interp1(linspace(climits(1), climits(2), size(cmap, 1)), ...
              cmap, ...
              scalarclamped); 

          
T = array2table(rgb,'VariableNames',{'r','g','b'},...
    'RowNames',{'rostralanteriorcingulate-lh','lateralorbitofrontal-lh','superiorfrontal-lh',...
    'caudalanteriorcingulate-lh','rostralanteriorcingulate-rh','medialorbitofrontal-lh','medialorbitofrontal-rh',...
    'lateralorbitofrontal-rh','superiorfrontal-rh','caudalanteriorcingulate-rh'});
name = 'test_brain_xai_theta.csv'; 
writetable(T,name,'WriteRowNames',true); 
%% 


