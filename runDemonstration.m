    % Initialization
clear ; close all;

% Load training data
load('data/merkmale7.mat')
[X, mu, sigma] = normalizeFeatures(X);

options = {'Minimum Distance (Euclid)', 'Minimum Distance (Mahalanobis)', ...
           'K-Means', 'Naive Bayes', 'Neural Network'};
choice = menu('Choose an algorithm:', options);

switch (choice)
    case 1
        Mahalanobis = false;
        classifier = minimumDistance(Mahalanobis);
    case 2
        Mahalanobis = true;
        classifier = minimumDistance(Mahalanobis);
    case 3
        classifier = kMeans(2);
    case 4
        classifier = naiveBayes();
    case 5
        hiddenLayerSize = 5;
        classifier = neuralNetwork(hiddenLayerSize);
end

classifier = train(classifier, X, y);
printf('Finished training...\n');

pred = predict(classifier, X);
printf('Finished prediction...\n');

[tc, fc, tt, ft] = evaluateResult(X, y, pred);
printEvaluation(tc, tt, fc, ft);

if yes_or_no('Do you want to plot result? ')
    if (strcmp (class (classifier), 'kMeans')) || (strcmp (class (classifier), 'minimumDistance'))
        centroids = getCentroids(classifier);
    else
        centroids = [];
    end
    plotResult({tc, fc, tt, ft}, centroids);
end