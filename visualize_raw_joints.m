function [] = visualize_raw_joints(joints,frame)
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
  
    axis square
    campos([0,0,0]);
    camup([0,1,0]);
    hold on;
    t = [HipCenter;HipRight];
    line(t(:,1),t(:,2),t(:,3));
    t = [HipRight;KneeRight];
    line(t(:,1),t(:,2),t(:,3));
    t = [KneeRight;AnkleRight];
    line(t(:,1),t(:,2),t(:,3));
    t = [AnkleRight;FootRight];
    line(t(:,1),t(:,2),t(:,3));
    t = [HipCenter;HipLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [HipLeft;KneeLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [KneeLeft;AnkleLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [AnkleLeft;FootLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [HipCenter;Spine];
    line(t(:,1),t(:,2),t(:,3));
    t = [Spine;ShoulderCenter];
    line(t(:,1),t(:,2),t(:,3));
    t = [ShoulderCenter;Head];
    line(t(:,1),t(:,2),t(:,3));
    t = [ShoulderCenter;ShoulderLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [ShoulderLeft;ElbowLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [ElbowLeft;WristLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [WristLeft;HandLeft];
    line(t(:,1),t(:,2),t(:,3));
    t = [ShoulderRight;ElbowRight];
    line(t(:,1),t(:,2),t(:,3));
    t = [ElbowRight;WristRight];
    line(t(:,1),t(:,2),t(:,3));
    t = [WristRight;HandRight];
    line(t(:,1),t(:,2),t(:,3));
    t = [ShoulderCenter;ShoulderRight];
    line(t(:,1),t(:,2),t(:,3));
    
    scatter3(   [HipCenter(1),Spine(1),ShoulderCenter(1),Head(1),ShoulderLeft(1),ShoulderRight(1),ElbowLeft(1),ElbowRight(1),WristLeft(1),WristRight(1),HandLeft(1),HandRight(1),HipLeft(1),HipRight(1),KneeLeft(1),KneeRight(1),AnkleLeft(1),AnkleRight(1),FootLeft(1),FootRight(1)],...
                [HipCenter(2),Spine(2),ShoulderCenter(2),Head(2),ShoulderLeft(2),ShoulderRight(2),ElbowLeft(2),ElbowRight(2),WristLeft(2),WristRight(2),HandLeft(2),HandRight(2),HipLeft(2),HipRight(2),KneeLeft(2),KneeRight(2),AnkleLeft(2),AnkleRight(2),FootLeft(2),FootRight(2)],...
                [HipCenter(3),Spine(3),ShoulderCenter(3),Head(3),ShoulderLeft(3),ShoulderRight(3),ElbowLeft(3),ElbowRight(3),WristLeft(3),WristRight(3),HandLeft(3),HandRight(3),HipLeft(3),HipRight(3),KneeLeft(3),KneeRight(3),AnkleLeft(3),AnkleRight(3),FootLeft(3),FootRight(3)]);
    hold off;
end

