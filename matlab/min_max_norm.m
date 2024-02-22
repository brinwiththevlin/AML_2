function result = min_max_norm(X)
    % column wise min max nonrmalization
    for i=1:size(X,2)
        temp = X(:,i);
        temp =  (temp - min(temp)) / (max(temp - min(temp)));
        X(:,i) = temp;
    end
    result = X*100;
end
