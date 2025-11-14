clear; close all; clc;

%% Load data
trainData = readtable('DailyDelhiClimateTrain.csv');
testData  = readtable('DailyDelhiClimateTest.csv');

y_train = trainData.meantemp;
y_test  = testData.meantemp;

%% Model fitting
noLags = 10;
N = length(y_train);

% X_train = lagged values
X_train = zeros(N - noLags, noLags);
Y_train = y_train(noLags+1:end);

for i = 1:noLags
    X_train(:, i) = y_train(noLags - i + 1 : end - i);
end

model = fitlm(X_train, Y_train);

%% Prediction
y_all = [y_train; zeros(size(y_test))];

for t = 1:length(y_test)
    lastVals = y_all(noLags + t - (1:noLags));
    lastVals = lastVals(:)';
    pred = predict(model, lastVals);
    y_all(N + t) = pred;
end

pred_test = y_all(N+1:end);

%% Results
rmse = sqrt(mean((pred_test - y_test).^2));
fprintf("RMSE = %d\n", rmse);

figure;
plot(y_test); hold on;
plot(pred_test);
legend('Actual', 'Prediction');
xlabel('Day');
ylabel('Mean Temperature');
grid on;
title('Autoregressive Baseline');
