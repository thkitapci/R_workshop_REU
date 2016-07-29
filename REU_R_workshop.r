setwd("/home/thkitapci/Desktop/R_workshop_REU/")
library(lsr)

iris_data_set=read.csv("iris.csv")

#Check the top of the table 
head(iris_data_set)



#Some scatter plots
plot(iris_data_set$Sepal.Length,iris_data_set$Sepal.Width)


#Let split the dataset by species
split_by_species=split(iris_data_set,iris_data_set$Species)
head(split_by_species[[2]])

#same plot for just 1 species

plot(split_by_species$setosa$Sepal.Length,split_by_species$setosa$Sepal.Width)

#Plot histograms

par(mfrow=c(2,2))  #generate a 2x2 grid for plots
hist(iris_data_set$Sepal.Length)
hist(iris_data_set$Sepal.Width)
hist(iris_data_set$Petal.Length)
hist(iris_data_set$Petal.Width)

mean(iris_data_set$Sepal.Length)
sd(iris_data_set$Sepal.Length)

#Do the same stuff using a loop

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



##############################################

#####################
#Simulate data
dev.off()
set.seed(0)
par(mfrow=c(1,2))

A=rnorm(500,5,1)
B=rnorm(500,5.1,1)

hist(A,xlab="A")
hist(B,xlab="B")
t.test(A,B)
#cohensD(A,B)
m1=rnorm(200,5,1)
m2=rnorm(200,5.1,1)

A=c(A,m1)
B=c(B,m2)

hist(A,xlab="A")
hist(B,xlab="B")
t.test(A,B)
#cohensD(A,B)
m3=rnorm(200,5,1)
m4=rnorm(200,5.5,1)
A=c(A,m3)
B=c(B,m4)

hist(A,xlab="A")
hist(B,xlab="B")
t.test(A,B)
#cohensD(A,B)


###################################3
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

#################################
#################################
#PCA Principal component analysis
##################################
dev.off()
#install.packages("FactoMineR")
library(FactoMineR)


iris_data_set=read.csv("iris.csv")

subset_of_iris=iris_data_set[, 1:5]
ir.pca <- PCA(subset_of_iris,quali.sup = 5) #quali.sup indicated the index for qualitative variable
plot(ir.pca,habillage=5) #habillage=5 means color the individuals by the habillage parameter



