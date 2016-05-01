function p = predict(Theta1, Theta2, X)
% Predict the label of an input data with a trained neural network.
% Usage: p = predict(Theta1, Theta2, X) outputs the predicted label of X given
% the trained weights of a neural network (Theta1, Theta2)

    m = size(X, 1);
    num_labels = size(Theta2, 1);

    h1 = sigmoid([ones(m, 1) X] * Theta1');
    h2 = sigmoid([ones(m, 1) h1] * Theta2');
    [_, p] = max(h2, [], 2);
end