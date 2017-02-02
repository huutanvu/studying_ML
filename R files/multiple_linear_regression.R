# Data Preprocessing

# Import dataset
dataset = read.csv('~/studying_ML/Datasets/ML_a_z/50_Startups.csv')

# Splitting the dataset into training and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE) # training_set = dataset[split,]
test_set = subset(dataset, split == FALSE) # test_set = dataset[!split,]
