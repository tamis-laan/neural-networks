joints = extract_joints('coordinates 6-5-2014 1-15-53.txt');
% features =  extract_group_features_sitting(joints,ones(1782,1));
% windowed_features = window_features(features,3);
% elm_train(windowed_features,0,50,'sig')
% elm_predict(windowed_features(10,2:end))

% %%
% 
% [train_set, test_set]=create_sets('filecodes', 'Joints', 0.7, 10);
% 
% 
% %%
% elm_train(train_set,1,50,'sig')
% previsao=elm_predict(test_set(:,2:end));