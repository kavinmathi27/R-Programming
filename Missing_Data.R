#12/08/2025

dataset <- read.csv(file.choose())
dataset

dataset[!complete.cases(dataset),]
#filtering: using $
dataset$Salary == NA

#filtering: using is.na() for missing data
is.na(dataset$Salary)
dataset[is.na(dataset$Salary),]

#reomving record with missing data
dataset_backup <- dataset
dataset[!complete.cases(dataset),]

dataset[is.na(dataset$Salary),]
dataset[!is.na(dataset$Salary),]
dataset <- dataset[!is.na(dataset$Salary),]
dataset

dataset[!complete.cases(dataset),]

#Replacing missing Data : Median Imputation Method
dataset[!complete.cases(dataset),]

median(dataset[,"Age"], na.rm=TRUE)

median(dataset(dataset$))