function [train_set, test_set]=create_sets(filecodes, data_folder, train_size, file_num)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   filecodes - name of the .xls file that is to be openned with
%               read_labels
%   data_folder - name of the folder where the .txt files are
%
%   train_size - size of the train set, from 0 to 1
%
%   file_num - ammount of files you want to use (test+train sets)
%s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data_files=dir(fullfile(data_folder, '*.txt'));

rand_seq=randperm(size(data_files,1));

labels=read_labels(filecodes);

joints_cell=cell(file_num,1);

for i=1:file_num
   
    temp_name=data_files(rand_seq(i)).name;
    joints_cell{i}=extract_joints(strcat(data_folder,'/',temp_name));
    warning off
    for j=1:size(labels,1)
        if strcmp(temp_name,strcat(labels{j,1},'.txt')) == 1
            
            mood(i)= labels{j,4};
            
        end
    end
    warning on
    
end

train_set=extract_group_features_sitting(joints_cell{1}, mood(1));

for i=2:size(joints_cell,1)*train_size

    features_train=extract_group_features_sitting(joints_cell{i}, mood(i));
    
    train_set=[train_set; features_train];
    
end


test_set=extract_group_features_sitting(joints_cell{i+1},mood(i+1));

for i=i+2:size(joints_cell,1)
   
    features_test=extract_group_features_sitting(joints_cell{i}, mood(i));
    
    test_set=[test_set; features_test];
    
end

end