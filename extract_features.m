function features=extract_features(joints)

features=cell(size(joints,1),1);

for i=1:size(joints,1)
    
    % Hand distance
    features{i}(1)=abs(joints{i}(12,1)-joints{i}(8,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(2)=abs(joints{i}(12,2)-joints{i}(8,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(3)=abs(joints{i}(12,3)-joints{i}(8,3))/(joints{i}(4,2)-joints{i}(20,2));
    
    % Elbow distance
    features{i}(4)=abs(joints{i}(10,1)-joints{i}(6,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(5)=abs(joints{i}(10,2)-joints{i}(6,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(6)=abs(joints{i}(10,3)-joints{i}(6,3))/(joints{i}(4,2)-joints{i}(20,2));
    
    % Elbow angle
    a=joints{i}(7,:)-joints{i}(6,:);
    b=joints{i}(5,:)-joints{i}(6,:);
    features{i}(7)=atan2(norm(cross(a,b)), dot(a,b));
    a=joints{i}(11,:)-joints{i}(10,:);
    b=joints{i}(9,:)-joints{i}(10,:);
    features{i}(8)=atan2(norm(cross(a,b)), dot(a,b));
    
    % Shoulder distance
    features{i}(9)=abs(joints{i}(5,1)-joints{i}(9,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(10)=abs(joints{i}(5,2)-joints{i}(9,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(11)=abs(joints{i}(5,3)-joints{i}(9,3))/(joints{i}(4,2)-joints{i}(20,2));
    
    % Shoulder orientation
    features{i}(12)=(joints{i}(9,1)-joints{i}(3,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(13)=(joints{i}(9,2)-joints{i}(3,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(14)=(joints{i}(9,2)-joints{i}(3,3))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(15)=(joints{i}(5,1)-joints{i}(3,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(16)=(joints{i}(5,2)-joints{i}(3,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(17)=(joints{i}(5,3)-joints{i}(3,3))/(joints{i}(4,2)-joints{i}(20,2));
    
    % Feet distance
    features{i}(18)=abs(joints{i}(20,1)-joints{i}(16,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(19)=abs(joints{i}(20,2)-joints{i}(16,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(20)=abs(joints{i}(20,3)-joints{i}(16,3))/(joints{i}(4,2)-joints{i}(20,2));
    
    % Feet orientation
    features{i}(21)=(joints{i}(20,1)-joints{i}(19,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(22)=(joints{i}(20,2)-joints{i}(19,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(23)=(joints{i}(20,2)-joints{i}(19,3))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(24)=(joints{i}(16,1)-joints{i}(15,1))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(25)=(joints{i}(16,2)-joints{i}(15,2))/(joints{i}(4,2)-joints{i}(20,2));
    features{i}(26)=(joints{i}(16,3)-joints{i}(15,3))/(joints{i}(4,2)-joints{i}(20,2));
    
    %Head angles
    a=joints{i}(4,:)-joints{i}(3,:);
    b=joints{i}(2,:)-joints{i}(3,:);
    features{i}(27)=atan2(norm(cross(a,b)), dot(a,b));
    a=joints{i}(4,:)-joints{i}(3,:);
    b=joints{i}(9,:)-joints{i}(3,:);
    features{i}(28)=atan2(norm(cross(a,b)), dot(a,b));
    
end
end