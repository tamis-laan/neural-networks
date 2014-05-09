% joints = extract_joints('coordinates 7-5-2014 0-30-46.txt');
% dictionary=read_labels('Synchronization DB -Final');
% visualize_raw_joints_movie(joints);

video='00000.mov'
obj=VideoReader('video');
numFrames=get(obj,'NumberOfFrames')

for k = 1 : numFrames  %fill in the appropriate number
  this_frame = read(obj, k);
  thisfig = figure();
  thisax = axes('Parent', thisfig);
  image(this_frame, 'Parent', thisax);
  title(thisax, sprintf('Frame #%d', k));
end

% % visualize_raw_joints(joints,1)
% features = extract_group_features(joints,1);

% data = [0 0 0 ; 1 1 0; 1 0 1; 0 1 1]
% elm_train(data,0,10,'sig')
% out = elm_predict([0 1])
