clear
clc

filename = 'coordinates 5-5-2014 0-2-56.txt';

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


