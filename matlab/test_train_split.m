function [test, train] = test_train_split(data, holdout)
    % data: The dataset to be split
    % holdout: The ratio of data to be held out for testing (e.g., 0.2 for 20%)
    
    % Shuffle the data
    shuffled_indices = randperm(size(data, 1));
    shuffled_data = data(shuffled_indices, :);
    
    % Calculate the number of samples for testing
    num_test_samples = round(holdout * size(data, 1));
    
    % Split the data
    test = shuffled_data(1:num_test_samples, :);
    train = shuffled_data(num_test_samples+1:end, :);
end