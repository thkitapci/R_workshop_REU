#R workshop for REU 2016
#Author T. Hamdi Kitapci



#setwd("/home/thkitapci/Desktop/R_workshop_REU/")
#Replace setwd with the directory on your system



#Load the R build-in database "iris" from a file
iris_data_set=read.csv("iris.csv")

#Check the top of the table 
head(iris_data_set)



#Some scatter plots
plot(iris_data_set$Sepal.Length,iris_data_set$Sepal.Width)


#Let split the dataset by species
split_by_species=split(iris_data_set,iris_data_set$Species)
head(split_by_species[[2]]) #Look at the top of the table containing one of the species 

#same plot for just 1 species 

plot(split_by_species$setosa$Sepal.Length,split_by_species$setosa$Sepal.Width)
#Here the correlation between those 2 variables can be seen better



#Plot histograms
#Plotting the histogram of your data is an important "first look" to your data

par(mfrow=c(2,2))  #generate a 2x2 grid for plots
hist(iris_data_set$Sepal.Length)
hist(iris_data_set$Sepal.Width)
hist(iris_data_set$Petal.Length)
hist(iris_data_set$Petal.Width)

mean(iris_data_set$Sepal.Length)
sd(iris_data_set$Sepal.Length)

#Do the same stuff using a loop 
#Loops in R is not very efficient but the idea of loops applies to any programming language and this is a good practice
#to learn about loops

names=colnames(iris_data_set)[1:4]
names
for (i in names)
{
	hist(iris_data_set[[i]],xlab=i,main=i)
  #print (sprintf("%s mean value is %s",i,mean(iris_data_set[[i]]))) ##print the mean value of each dataset on the screen
}


#boxplot
dev.off()
boxplot(iris_data_set$Sepal.Length,xlab="Sepal.length")





###########################################



#This is an example of using t-test in R
#Here I am simulating two datasets sampled from a normal distribution and perform t-test
#As you can see in the simulation as I increase the sample size the p-value of the t-test becomes significant
#This is an important observation the sample mean and standart deviation is not changed but an increase in the sample size can create a significant p-value. 
#p-value's should be always evaluated with caution. Read about "effect size" to learn more about statistical testing. A simple effect size calculation can be done in R using the cohenD() function of the lsr package.

#!!!!!!!!!!!!!!!!VERY IMPORTAN NOTE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 

#Statistical significance does not necessarily implies biological significance!!!!!!!!!!!!

#Simulate data
dev.off()
set.seed(0) #Set a seed for reproducible results for the random number generation
par(mfrow=c(1,2))

A=rnorm(500,5,1)
B=rnorm(500,5.1,1)

hist(A,xlab="A")
hist(B,xlab="B")
t.test(A,B)

m1=rnorm(200,5,1)   #COllect more data
m2=rnorm(200,5.1,1)

A=c(A,m1) #add the collected new data to the previous dataset
B=c(B,m2)

hist(A,xlab="A")
hist(B,xlab="B")
t.test(A,B) #t-test is becoming significant

m3=rnorm(200,5,1) #COllect even more data
m4=rnorm(200,5.5,1)
A=c(A,m3)
B=c(B,m4)

hist(A,xlab="A")
hist(B,xlab="B")
t.test(A,B) #even more significant is this real or an artifact of increased sample size ?



###################################
#Linear regression
####################3
#Use R build-in dataset mtcars
dev.off()
head(mtcars)
plot(mtcars$wt,mtcars$mpg)

#Add a linear regression to see if wt can "predict the "mpg" in a linear way

myLinearReg=mtcars$mpg~mtcars$wt

lm(myLinearReg)
abline(lm(myLinearReg),col="red")

summary(lm(myLinearReg))

plot(lm(myLinearReg))  #Plot diagnostic plots for Linear regression


############
# example for linear regression 
#Linear regression seems to be working fine but it does not!

t=seq(0,10,0.1)
z<-t+sin(5*t)
plot(t,z)
abline(lm(t~z),col="red")
summary(lm(t~z))
plot(lm(t~z))
#You can see from the diagnostic plots of residuals and QQ plots that linear regresion is a bad fit for the data in this case!




#################################
#################################
#PCA Principal component analysis
#This is a very simple and very powerful tool for analyzing datasets with more than 3 features (can be used with less than 3 features as well)
##################################
dev.off()
#install.packages("FactoMineR")
library(FactoMineR)


iris_data_set=read.csv("iris.csv")

####
####Starting PCA analysis

subset_of_iris=iris_data_set[1:5]
ir.pca <- PCA(subset_of_iris,quali.sup = 5) #quali.sup indicated the index for qualitative variable
plot(ir.pca,habillage=5) #habillage=5 means color the individuals by the habillage parameter



