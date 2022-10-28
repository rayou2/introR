# Intro to R Lesson 
# Oct 18th, 2022

# Interacting with R

#Part 1 (1.1)
## I am adding 3 and 5. R is fun!
3+5
x <- 3
y <- 5
x + y
number <- x + y

#exercise
x <- 5
y <- 10
x + y
number <- x + y

# Part 2 (1.2)
# Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <- c('ecoli','human','corn')
species

# Forgot to put quotes around corn
species <- c('ecoli','human','corn')

# exercise
combined <- c(glengths, species)

# Create a character vector and store the vector as a variable called 'expression'
expression <- c('low','high','medium','high','low','medium','high')

# Turn 'expression' vector into a factor
expression <- factor(expression)

# exercise
samplegroup <- c('CTL','KO','OE','KO','CTL','OE','OE','CTL','KO')
samplegroup <- factor(samplegroup)

# Create a data frame and store it as a variable called 'df'
df <- data.frame(species,glengths)

# exercise 
titles <- c('Catch-22','Pride and Prejudice','Nineteen Eighty Four')
pages <- c(453,432,328)
favorite_books <- data.frame(titles,pages)

# Create a list and it can combine many different variables into one list
list1 <- list(species, df, number)

# exercise
list2 <- list(species,glengths,number)

# Part 3 (1.3)
getwd()

glengths <- c(glengths, 90) # adding at the end 
glengths <- c(30, glengths) # adding at the beginning 

sqrt(81)
sqrt(glengths)

round(3.14159)

?round
args(round)

round(3.14159, digits = 2)
round(3.14159, 2)

# exercise
mean(glengths)
test <- c(1, NA, 2, 3, NA, 4)
mean(test, na.rm = TRUE)
sort(glengths, decreasing = TRUE)

# custom functions
square_it <- function(x){
  square <- x * x
  return(square)
}
square_it(5)

# exercise 
multiply_it <- function(x, y){
  multiply <- x * y
  return(multiply)
}
multiply_it(x=4, y=6)

# Part 4 (1.4)
?read.csv

metadata <- read.csv(file = "data/mouse_exp_design.csv")

# exercise 1
proj_summary <- read.table(file = 'data/project-summary.txt', header = TRUE, row.names = 1)
proj_summary

head(metadata)

# exercise 2
class(glengths) 
# numeric 
class(metadata) 
# data.frame
summary(proj_summary) 
# 0.005345
length(samplegroup)
# 9
dim(proj_summary)
# 9, 8
str(rownames(metadata))
# chr [1:12] "sample1" "sample2" "sample3" "sample4" "sample5" "sample6" ...
sum(lengths(colnames(proj_summary)))
# 8

# practice
temp_conv <- function(temp_f) {
  temp_c = (temp_f -32)* 5 / 9;
  temp_k = temp_c + 273.15
  return(temp_k)
}

round(temp_conv(70), digits = 1)

# Part 2
# 2.1

# Let's start by creating a vector called age
age <- c(15, 22, 45, 52, 73, 81)
age[5]
age[-5]
age[c(3,5,6)] ## nested or 
## create a vector first then select 
idx <- c(3, 5, 6) # create vector of the elements of interest
age[idx]
# To select a sequence of continuous values from the vector
age[1:4]
age[4:1]

# exercise
alphabets <- c('C','D','X','L','F')
alphabets[c(1,2,5)]
alphabets[-3]
alphabets[5:1]

# logical operators
age > 50
age > 50 | age < 18
age
age[age >50 | age < 18] ## nested or
## create a vector first then select
idx <- age > 50 | age < 18
age[idx]

# which function to output the indices where the values are TRUE
which(age > 50 | age < 18)
age[which(age > 50 | age< 18)] ## nested or 
## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

expression[expression == 'high']  ## This will only return those elements in the factor equal to "high"

# exercise 
samplegroup != "KO"
samplegroup[samplegroup != 'KO']

# To view the integer assignments under the hood you can use str()
expression
str(expression)

# To relevel the categories 
expression <- factor(expression, levels = c('low','medium','high'))  # you can re-factor a factor
str(expression)

# exercise
samplegroup
str(samplegroup)
samplegroup <- factor(samplegroup, levels = c('KO','CTL','OE'))
str(samplegroup)

# Part 2.2
sessionInfo() # Print version information about R, the OS and attached or loaded packages 
# OR
search() # Gives a list of attached packages

install.packages('ggplot2')
library(ggplot2)
search()

# exercise
install.packages('tidyverse')

# Part 2.3
