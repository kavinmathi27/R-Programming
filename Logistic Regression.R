setwd("C:\\Users\\ECE-LAB\\Downloads")
getwd()
dataset <- read.csv("Social_Network_Ads.csv")
dataset
View(dataset)
dataset = dataset[, 3:5]

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])

#Fitting logistic Regression to the training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

#Predicting the test set results
prob_pred = predict(classifier, type = 'response', nexdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

#Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

