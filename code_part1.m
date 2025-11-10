clear; close all; clc;

%% Load Data
trainData = readtable('DailyDelhiClimateTrain.csv');
testData  = readtable('DailyDelhiClimateTest.csv');

%% Visualizations
figure;

subplot(4,1,1);
plot(trainData.date, trainData.meantemp, '-b');
ylabel('Mean Temp (°C)'); 
title('Daily Mean Temperature');

subplot(4,1,2);
plot(trainData.date, trainData.humidity, '-g');
ylabel('Humidity (%)'); 
title('Daily Humidity');

subplot(4,1,3);
plot(trainData.date, trainData.wind_speed, '-r');
ylabel('Wind Speed (m/s)'); 
title('Daily Wind Speed');

subplot(4,1,4);
plot(trainData.date, trainData.meanpressure, '-k');
ylabel('Pressure (mbar)'); 
xlabel('Date');
mu = mean(trainData.meanpressure);
sigma = std(trainData.meanpressure);
ylim([870, 1084]); % World records, outliers supposed error of measure (7 bar obviously imposible)
title('Daily Mean Pressure');

summary(trainData(:, 2:end));

%% Time-Series Decomposition

TT = timetable(trainData.date, trainData.meantemp);
TT.Properties.VariableNames = ["meantemp"];
decomp = trenddecomp(TT);

trend     = decomp.meantemp_LongTerm;
seasonal  = decomp.meantemp_Seasonal;
residual  = decomp.meantemp_Remainder;

figure;

subplot(4,1,1);
plot(TT.Time, TT.meantemp, 'k');
title('Original Series'); ylabel('Temp (°C)');

subplot(4,1,2);
plot(TT.Time, trend, 'r');
title('Long-Term Trend');

subplot(4,1,3);
plot(TT.Time, seasonal, 'b');
title('Seasonal Component');

subplot(4,1,4);
plot(TT.Time, residual, 'g');
title('Remainder (Residual)');
xlabel('Date');

%% Autocorrelation Analysis
y = trainData.meantemp;
figure;
autocorr(y, 'Numlags', 365);
title('Autocorrelation of Mean Temperature');

%% Split data Vizualisation
figure;
plot(trainData.date, trainData.meantemp, 'b'); 
hold on;
plot(testData.date, testData.meantemp, 'r');
xlabel('Date'); ylabel('Mean Temperature (°C)');
legend('Training Set', 'Test Set');
title('Train/Test Data Partition');
grid on;
