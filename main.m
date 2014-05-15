joints = extract_joints('example_file.txt')
features =  extract_group_features_standing(joints,ones(1782,1));
elm_train(features,0,10,'sig')