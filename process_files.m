function all_wfs = process_files(files,labels,window_size)
    all_wfs = []
    for i=1:size(labels,2)
        files{i}
        joints = extract_joints(files{i})
        if labels(i)==0
            features = extract_group_features_sitting(joints,0);
        end
        if labels(i)==1
            features = extract_group_features_sitting(joints,1);
        end
        wf = window_features(features,window_size);
        all_wfs = [all_wfs;wf];
    end
end

