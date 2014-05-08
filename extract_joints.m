function [joints]=extract_joints(filename) 

%Dictionary:
%
% 1 - Hip Center
% 2 - Spine
% 3 - ShoulderCenter
% 4 - Head
% 5 - Shoulder Left
% 6 - Elbow Left
% 7 - Wrist Left
% 8 - Hand Left
% 9 - Shoulder Right
% 10 - Elbow Right
% 11 - Wrist Right
% 12 - Hand Right
% 13 - Hip Left
% 14 - Knee Left
% 15 - Ankle Left
% 16 - Foot Left
% 17 - Hip Right
% 18 - Knee Right
% 19 - Ankle Right
% 20 - Foot Right

frame=0;

fileID=fopen(filename);

while feof(fileID) ~= 1
    
    track=fscanf(fileID, '%s/n');
    fgets(fileID);
    
    if strcmp(track, 'Tracked')==1
        frame = frame + 1;
    end
end

joints=cell(frame,1);
frame=0;

fclose(fileID);

fileID=fopen(filename);

while feof(fileID) ~= 1
    
    track=fscanf(fileID, '%s/n');
    fgets(fileID);
    
    if strcmp(track, 'Tracked')==1
        frame = frame + 1;
        joints{frame}=zeros(20,3);
        for k=1:20
           fscanf(fileID, '%d %d %d %s/n');
           for l=1:3
            joints{frame}(k,l)=fscanf(fileID,'%f/n');
           end
        end
    end
end

fclose(fileID);
end