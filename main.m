

[train_set, test_set]=create_sets('filecodes', 'Joints', 0.7, 50);

% 
% %%
% elm_train(train_set,1,50,'sig')
% previsao=elm_predict(test_set(:,2:end));