function [features] = extract_group_features_standing(joints,label)
        features = [];
    for i = 1:length(joints) 
        features = [features;extract_group_feature_standing(joints,label(i),i)];
    end
end

function out = extract_group_feature_standing(joints,label,frame)
    disp('hello')
    %%Extract joint data
    HipCenter       = joints{frame}(1,:);
    Spine           = joints{frame}(2,:);
    ShoulderCenter  = joints{frame}(3,:);
    Head            = joints{frame}(4,:);
    ShoulderLeft    = joints{frame}(5,:);
    ElbowLeft       = joints{frame}(6,:);
    WristLeft       = joints{frame}(7,:);
    HandLeft        = joints{frame}(8,:);
    ShoulderRight   = joints{frame}(9,:);
    ElbowRight      = joints{frame}(10,:);
    WristRight      = joints{frame}(11,:);
    HandRight       = joints{frame}(12,:);
    HipLeft         = joints{frame}(13,:);
    KneeLeft        = joints{frame}(14,:);
    AnkleLeft       = joints{frame}(15,:);  
    FootLeft        = joints{frame}(16,:);
    HipRight        = joints{frame}(17,:);
    KneeRight       = joints{frame}(18,:);
    AnkleRight      = joints{frame}(19,:);
    FootRight       = joints{frame}(20,:);
    %% Extract Features
                        t   = Spine-HipCenter;
    hip_spine               = t/norm(t);
                        t   = ShoulderCenter-Spine;
    spine_shoulders         = t/norm(t);
                        t   = Head-ShoulderCenter;
    shoulders_head          = t/norm(t);
                        t   = ShoulderLeft-ShoulderCenter;
    shoulders_shoulderleft  = t/norm(t);
                        t   = ShoulderRight-ShoulderCenter;
    shoulders_shoulderright = t/norm(t);
    
    body_angle              = acos( ( (ShoulderCenter-HipCenter)/norm(ShoulderCenter-HipCenter) ) * [0,1,0]' )/pi * 180;
    
                        t1  = (ShoulderLeft-ElbowLeft)/norm(ShoulderLeft-ElbowLeft);
                        t2  = (WristLeft-ElbowLeft)/norm(WristLeft-ElbowLeft);
    elbow_angle_left        = acos(t1*t2')/pi * 180;
    
                        t1  = (ElbowLeft-WristLeft)/norm(ElbowLeft-WristLeft);
                        t2  = (HandLeft-WristLeft)/norm(HandLeft-WristLeft);
    hand_angle_left        = acos(t1*t2')/pi * 180;
    
                        t1  = (ShoulderRight-ElbowRight)/norm(ShoulderRight-ElbowRight);
                        t2  = (WristRight-ElbowRight)/norm(WristRight-ElbowRight);
    elbow_angle_right       = acos(t1*t2')/pi * 180;
    
                        t1  = (ElbowRight-WristRight)/norm(ElbowRight-WristRight);
                        t2  = (HandRight-WristRight)/norm(HandRight-WristRight);
    hand_angle_right        = acos(t1*t2')/pi * 180;
    
    out = [label,hip_spine,spine_shoulders,shoulders_head,shoulders_shoulderleft,shoulders_shoulderright,body_angle,elbow_angle_left,hand_angle_left,elbow_angle_right,hand_angle_right]

end

