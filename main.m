% joints = extract_joints('example_file.txt');
% features =  extract_group_features_sitting(joints,ones(1782,1));
% windowed_features = window_features(features,3);
% elm_train(windowed_features,0,50,'sig')
% elm_predict(windowed_features(10,2:end))

%%

[train_set, test_set]=create_sets('filecodes', 'Joints', 0.7, 50);


%%
[~, acc]=elm_train(train_set,1,50,'sig')
[~, acc2]=elm_predict(test_set(:,2:end));