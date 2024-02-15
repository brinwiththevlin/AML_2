function conf_matrix = parzen(pos_label, data, poly)
    string_label = data{:,end};
    Y = strcmp(string_label, pos_label);
    X =table2array(data(:, 1:end-1));
    
    nPlus = sum(Y);
    nMinus = length(Y) - nPlus;
    
    aPlus = zeros(length(Y),1);
    aMinus = zeros(length(Y),1);
    
    

    for i=1:length(Y)
        if Y(i) == 1
            aPlus(i) = 1/nPlus;
        else
            aMinus(i) = 1/nMinus;
        end
    end
    alpha = aPlus - aMinus;
    n = size(X, 1);
    K = zeros(n, n);
    
    for i = 1:n
        for j = 1:n
            if poly == false
                K(i, j) = dot(X(i, :), X(j, :));
            else
                K(i, j) = polykernel(X(i, :), X(j, :));
            end
        end
    end
    
    b = (aPlus'*K*aPlus - aMinus'*K*aMinus)/2;
    h = sign(K*alpha - b);
    
    Y = Y*2 -1;
    conf_matrix = confusionmat(Y,h);

end