# Data Preprocessing

# Import dataset
dataset = read.csv('~/studying_ML/Datasets/ML_a_z/Data.csv')

# How to deal with missing data
dataset$Age = ifelse(is.na(dataset$Age), 
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

# How to deal with categorical data
# Use factor function
dataset$Country = factor(dataset$Country, 
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))

# Splitting dataset to training and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,
                     SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE) # training_set = dataset[split,]
test_set = subset(dataset, split == FALSE) # test_set = dataset[!split,]

# Feature Scaling
# factor() is not numeric => Cannot be just scale(training_set)
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])
