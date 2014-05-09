function [dictionary]=read_labels(filename)

    [~,~,data]=xlsread(filename,1);

    for i=2:size(data,1)
        dictionary(i-1, 2) = data(i, 1);
        dictionary(i-1, 3) = data(i,3);
    end

    [~,~,data]=xlsread(filename,2);

    for i=2:size(data,1)
        if dictionary{i-1, 2} == data{i, 7}
            dictionary(i-1, 1) = data(i, 6);
        end
    end

    for i=1:size(dictionary,1)
        if strcmp(dictionary(i,3),' Anxiety') == 1
            dictionary{i,4} = 1;
        end
        if strcmp(dictionary(i,3),' Depression') == 1
            dictionary{i,4} = 2;
        end
        if strcmp(dictionary(i,3),' Amusement') == 1
            dictionary{i,4} = 3;
        end
        if strcmp(dictionary(i,3),' Amused') == 1
            dictionary{i,4} = 3;
        end
    end

end