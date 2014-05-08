%   joints = extract_joints('data')
%visualize_raw_joints_movie(joints)
%visualize_raw_joints(joints,1)
%features = extract_group_features(joints,1)

data = [0 0 0 ; 1 1 0; 1 0 1; 0 1 1]
elm_train(data,0,10,'sig')
out = elm_predict([0 1])
