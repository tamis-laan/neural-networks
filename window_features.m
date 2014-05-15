function [ windowed_features ] = window_features( features, window_size )

    number_of_features = size(features,1)
    length_of_feature  = size(features,2)
    
    windowed_features = [];
    
    for i=1:(number_of_features-window_size)
        new_feature = features(i);
        for j=1:window_size
            new_feature = [new_feature,features( i+j,2:end)];
        end
        windowed_features = [windowed_features;new_feature];
        
    end
    size(windowed_features)
end

