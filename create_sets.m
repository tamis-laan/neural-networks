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
%% 
% clc
% clear all
% 
% data_folder='Joints';
% 
% filecodes='filecodes';
% 
% train_size=0.7;
% 
% file_num=10;
%% 
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

train_set=[];
features_window=[];

for i=1:size(joints_cell,1)*train_size

    start=joints_cell{i}{1,2};
    finish=joints_cell{i}{size(joints_cell{i},1),2};
    window=floor((finish-start)/10);
    j=1;
    features_cell=[mood(i)];
    for k=start:window:finish-2*window
        counter=0;
        features_window=zeros(1,14);
        while joints_cell{i}{j+counter,2}<k+window
            features_window_new=extract_frame_feature_sitting(joints_cell{i}, j+counter);
            counter=counter+1;
            j=j+1;
            features_window=features_window+features_window_new;
        end
      features_window=features_window./counter;
      features_cell=[features_cell features_window];
    end
    train_set=[train_set; features_cell];
    
end


test_set=[];
features_window=[];

for i=1:size(joints_cell,1)*(1-train_size)

    start=joints_cell{i}{1,2};
    finish=joints_cell{i}{size(joints_cell{i},1),2};
    window=floor((finish-start)/10);
    j=1;
    features_cell=[mood(i)];
    for k=start:window:finish-2*window
        counter=0;
        features_window=zeros(1,14);
        while joints_cell{i}{j+counter,2}<k+window
            features_window_new=extract_frame_feature_sitting(joints_cell{i}, j+counter);
            counter=counter+1;
            j=j+1;
            features_window=features_window+features_window_new;
        end
      features_window=features_window./counter;
      features_cell=[features_cell features_window];
    end
    test_set=[test_set; features_cell];
    
end
 end