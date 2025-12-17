# Forecasting temperature data from multivariate Daily Climate time series data

![MATLAB](https://img.shields.io/badge/MATLAB-R2023b-orange)
![Deep Learning Toolbox](https://img.shields.io/badge/Toolbox-Deep%20Learning-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 📌 Project Overview

This project investigates the forecasting capabilities of various machine learning architectures—ranging from statistical baselines to modern deep learning models—for predicting daily mean temperatures. Using a daily climate dataset from New Delhi (2013–2017), the study compares the effectiveness of **Autoregressive (AR)** models against **Recurrent Neural Networks (RNNs)**, **Long Short-Term Memory (LSTM)** networks, and **Transformer** architectures.

The goal is to determine the impact of **historical context length**, **multivariate inputs**, and **model architecture** on forecasting accuracy in climate time series characterized by strong seasonality and complex interactions.

## 📊 Dataset

The study utilizes the **Daily Climate Time Series** dataset for New Delhi.
[Climate Dataset](https://www.kaggle.com/datasets/sumanthvrao/daily-climate-time-series-data)
* **Period:** January 1, 2013 – April 24, 2017.
* **Resolution:** Daily.
* **Variables:** Mean Temperature, Atmospheric Pressure, Humidity, and Wind Speed.
* **Preprocessing:**
    * Outliers handled via **STL decomposition** and interpolation.
    * Data normalized using **Z-score standardization** (statistics computed on training data only to prevent leakage).

## 🏗️ Models Implemented

We implemented and evaluated four families of models in both **Univariate** (Temperature only) and **Multivariate** (All variables) settings:

1. **Autoregressive (AR):** A statistical baseline using lagged inputs.
2. **RNN:** Simple recurrent network with 16 hidden units.
3. **LSTM:** Designed to capture long-term temporal dependencies using gating mechanisms.
4. **Transformer:** An attention-based architecture modeling global dependencies without recurrence.

## 📈 Key Findings

* **LSTMs** proved to be the most robust model for univariate forecasting, handling seasonality and long-term dependencies effectively.
* **Transformers** and **AR** models excelled in the multivariate setting, effectively exploiting cross-variable interactions.
* **RNNs** showed significant instability, particularly when input dimensionality increased.
* While deep learning models offered superior stability, simple autoregressive baselines remained highly competitive for short-term predictions.

## 🛠️ Prerequisites & Usage

### Requirements
To run the code, you will need **MATLAB** (Recommended: R2021a or later) with the following toolboxes:
* **Deep Learning Toolbox** (for LSTM, RNN, and Transformer layers)
* **Statistics and Machine Learning Toolbox** (for data normalization and evaluation metrics)
* **Signal Processing Toolbox** (optional, for specific decomposition tasks)

### Setup & Execution
1. **Clone the repository**
2. **Install necessary dependencies**
3. **Run the model** 
