install.packages(c("randomForest","caTools"))
library(randomForest)
library(caTools)

setwd("C:\\Users\\ECE-LAB\\Downloads")
getwd()
data <- read.csv("classicification.csv",stringsAsFactors = TRUE)

head(data)
set.seed(123)
split = sample.split(data$Class,SplitRatio = 0.7)
train_data = subset(data, split == TRUE)
test_data = subset(data, split == FALSE)

rf_model <- randomForest(Class ~., data = train_data, ntree = 100, importance = TRUE)
print(rf_model)

predictions <- predict(rf_model, test_data)

confusion_matrix <- table(test_data$Class,predictions)
print(confusion_matrix)

accuracy <- sum(diag(confusion_matrix))/sum(confusion_matrix)
cat("Accuracy : ", round(accuracy*100,2),"%\n")

importance(rf_model)
varImpPlot(rf_model)