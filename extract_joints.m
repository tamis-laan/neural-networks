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

    joints=cell(frame,2);
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
                joints{frame,1}(k,l)=fscanf(fileID,'%f/n');
               end
               fgets(fileID);
               joints{frame,2}=fscanf(fileID,'Color frame: %d/n');

            end
            
            aux=fscanf(fileID, '%s/n');
            
            if strcmp(aux, 'Tracking')==1
                fgets(fileID);
                joints{frame,2}=fscanf(fileID,'Color frame: %d/n');
            else
                joints{frame,2}=fscanf(fileID,'Color frame: %d/n');
            end
            
        end
    end

    fclose(fileID);
end