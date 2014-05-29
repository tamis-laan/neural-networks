filecodes='filecodes';

data_folder='Joints';

data_spread=0.5;


%%

data_files=dir(fullfile(data_folder, '*.txt'));

labels=read_labels(filecodes);

joints_cell=cell(size(data_files,1),1);

for i=1:size(data_files,1)
   
    joints_cell{i}=extract_joints(data_files(i).name);
    
    
    
    
end