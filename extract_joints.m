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

[~,~,data]=xlsread(filename);

%% Frame counter
frame=0;
for i=1:size(data,1)
%     for j=1:size(data,2)
        if strcmp(data{i,1}, 'Tracked Skeleton Frame: ')== 1
            frame = frame+1;
        end
        
%     end
end

%% Joint Extraction

joints=cell(frame,1);
frame=0;

for i=1:size(data,1)
%     for j=1:size(data,2)
        if strcmp(data{i,1}, 'Tracked Skeleton Frame: ')== 1
            frame = frame+1;
            joints{frame}=zeros(20,3);
            for k=1:20
                for l=1:3
                   joints{frame}(k,l)=data{i+2*k,l+4};
                end
            end
        end
        
%     end
end
        

%%

end