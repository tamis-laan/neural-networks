%%	Load Files
train_files = {'./data/coordinates 5-5-2014 17-6-53.txt',...
               './data/coordinates 5-5-2014 0-7-54.txt',...
               './data/coordinates 5-5-2014 0-40-27.txt',...
               './data/coordinates 5-5-2014 0-44-14.txt',...
               './data/coordinates 5-5-2014 0-55-5.txt',...
               './data/coordinates 5-5-2014 0-7-54.txt',...
               './data/coordinates 5-5-2014 17-32-47.txt',...
               './data/coordinates 5-5-2014 17-27-19.txt',...
               './data/coordinates 6-5-2014 2-8-47.txt'}
train_labels = [0,1,1,0,0,1,0,0,1];
train_dataset = process_files(train_files,train_labels,20);

test_files = {'./data/coordinates 6-5-2014 2-5-49.txt',...
              './data/coordinates 6-5-2014 2-17-57.txt',...
              './data/coordinates 6-5-2014 1-15-53.txt',...
              './data/coordinates 6-5-2014 1-10-28.txt',...
              './data/coordinates 5-5-2014 0-2-56.txt',...
              './data/coordinates 5-5-2014 17-21-53.txt'}
test_labels  = [1,0,1,1,0,0];
test_dataset = process_files(test_files,test_labels,20);

%% Train for different number of neurons and save results

x  = []
y1 = []
y2 = []
for i=1:4:101
    x = [x,i]

    mtra = 0;
    mtea = 0;
    for j=1:40
        [~,~,train_accuracy,testing_accuracy] = ELM(train_dataset,test_dataset,1,i,'sig');
        mtra=max(mtra,train_accuracy);
        mtea=max(mtea,testing_accuracy);
    end
    
    y1 = [y1,mtra];
    y2 = [y2,mtea];
end

%% Plot results
hold on
plot(x,y1,'b')
plot(x,y2,'r')
hold off

%% Single case test

  [~,~,train_accuracy,testing_accuracy] = ELM(train_dataset,test_dataset,1,50,'sig')