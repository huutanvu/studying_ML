# Data Preprocessing

# Import dataset
dataset = read.csv('~/studying_ML/Datasets/ML_a_z/Salary_Data.csv')

# Splitting the dataset into training and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE) # training_set = dataset[split,]
test_set = subset(dataset, split == FALSE) # test_set = dataset[!split,]

# Fitting Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualizing the Training set results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, 
                 y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') + 
  xlab('Year of experience') +
  ylab('Salary')