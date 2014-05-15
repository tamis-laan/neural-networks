joints = extract_joints('example_file.txt')
features =  extract_group_features_sitting(joints,ones(1782,1));
windowed_features = window_features(features,3);
%elm_train(features,0,10,'sig')