function conf_matrix = parzen(pos_label, train_data, test_data, poly)
    train_labels = strcmp(train_data{:, end}, pos_label);
    test_labels = strcmp(test_data{:, end}, pos_label);
    
    train_features = table2array(train_data(:, 1:end-1));
    test_features = table2array(test_data(:, 1:end-1));

    nPlus = sum(train_labels);
    nMinus = length(train_labels) - nPlus;

    aPlus = zeros(length(train_labels), 1);
    aMinus = zeros(length(train_labels), 1);

    for i i) = 1 / nPlus;
        else
            aMinus(i) = 1 / nMinus;
        end= 1:length(train_labels)
        if train_labels(i) == 1
            aPlus(
    end

    alpha = aPlus - aMinus;
    n_train = size(train_features, 1);
    n_test = size(test_features,1);
    K_train = zeros(n_train);
    K_both = zeros(n_train, n_test);

    for i = 1:n_train
        for j = 1:n_train
            if poly == false
                K_train(i, j) = dot(train_features(i, :), train_features(j, :));
            else
                K_train(i, j) = polykernel(train_features(i, :), train_features(j, :));
            end
        end
    end
    
    for i = 1:n_train
        for j = 1:n_test
            if poly == false
                K_both(i, j) = dot(train_features(i, :), test_features(j, :));
            else
                K_both(i, j) = polykernel(train_features(i, :), test_features(j, :));
            end
        end
    end

    b = (aPlus' * K_train * aPlus - aMinus' * K_train * aMinus) / 2;
    h = sign(K_both' * alpha - b);

    conf_matrix = confusionmat(test_labels * 2 - 1, h);
end
