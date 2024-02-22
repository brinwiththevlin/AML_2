% Read the data from the file
data = readtable('./data/iris-1.csv', 'Delimiter', ',', 'ReadVariableNames', false);
[test_data, train_data] = test_train_split(data, .2); 
labels = {'Iris-setosa', 'Iris-versicolor', 'Iris-virginica'};

 for i = 1:length(labels)
   disp(labels(i));
   disp("K0");
   confusion_matrix = parzen(labels(i), train_data, test_data, false);
   disp(confusion_matrix);
   disp("polynomial kernel");
   confusion_matrix2 = parzen(labels(i), train_data, test_data, true);
   disp(confusion_matrix2);
end
