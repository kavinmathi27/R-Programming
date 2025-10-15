#Multiple Linear Regression
setwd("C:\\Users\\ECE-LAB\\Downloads")
getwd()
dataset <- read.csv("50_Startups.csv")
dataset
View(dataset)
dataset = dataset[, 3:5]

#Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

library(caTools)
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])

#Filling Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)
summary(regressor)

#Predicting the Test set Results
y_pred = predict(regressor, newdata = test_set)
y_pred