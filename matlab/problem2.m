data = readtable('./data/iris-1.csv', 'Delimiter', ',', 'ReadVariableNames', false);
[test_data, train_data] = test_train_split(data, .2); 
labels = {'Iris-setosa', 'Iris-versicolor', 'Iris-virginica'};

 for i = 1:length(labels)
   disp(labels(i));
   disp("normalized features");
   confusion_matrix = parzen2a(labels(i), train_data, test_data);
   disp(confusion_matrix);
   disp("normalized distances");
   confusion_matrix2 = parzen2b(labels(i), train_data, test_data);
   disp(confusion_matrix2);
end