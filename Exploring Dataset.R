#05/08/2025

?read.csv()

#Method 1 : Select the file manually
stats <- read.csv(file.choose())
stats

#Method 2 : Set WD and Read Data
setwd("C:\\Users\\ECE-LAB\\Downloads")
getwd()
rm(stats)
stats <- read.csv("Copy of 50_Startups.csv")
stats

#----------------Exploring dataset
stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
head(stats, n=10)
tail(stats, n=8)
str(stats)
summary(stats)

stats[3,3]
stats[3,"Profit"]
stats["New York",3]