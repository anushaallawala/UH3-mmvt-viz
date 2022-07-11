function [T] = plot3Delecs_extractcolors(x,y,z,condition,num_ch,labels) 

figure() 
h = scatter3(x,y,z,70,'filled','CData',condition,'MarkerEdgeColor','k'); 


Cdata = h.CData; 
%%%%%%%%%% change these 
cmap = colormap(redblue); %can change 'bluewhitered' to 'redblue' 
cmin = min(Cdata(:)); %can change this to -100, -50, etc. 
cmax = max(Cdata(:)); %can change this to 100,50, etc. 
%%%%%%%%%
m = length(cmap); 
idx = fix((Cdata-cmin)/(cmax-cmin)*m)+1; 
RGB = squeeze(ind2rgb(idx,cmap)); 
tmp = 1:num_ch; tmp = tmp' ; 
RGB = [tmp,RGB]; 

colorbar 
caxis([-3 3])

T = array2table(RGB,'VariableNames',{'Electrodes','RGB1','RGB2','RGB3'});
T.(1) = labels; 

end 