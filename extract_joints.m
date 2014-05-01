function [joints]=extract_joints(filename) 
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