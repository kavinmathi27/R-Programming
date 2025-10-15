install.packages(c("rpart","rpart.plot","caTools"))
library(rpart)
library(rpart.plot)
library(caTools)

setwd("C:\\Users\\ECE-LAB\\Downloads")
getwd()
data <- read.csv("classicification.csv",stringsAsFactors = TRUE)

library(caTools)
set.seed(123)
split = sample.split(data$Class,SplitRatio = 0.7)
train_data = subset(data, split == TRUE)
test_data = subset(data, split == FALSE)
model <- rpart (Class ~., data = train_data, method="class")

rpart.plot(model)

predictions <- predict(model, test_data, type = "class")

confusion_matrix <- table(test_data$Class,predictions)
print(confusion_matrix)

accuracy <- sum(diag(confusion_matrix))/sum(confusion_matrix)
cat("Accuracy : ", round(accuracy*100,2),"%\n")
