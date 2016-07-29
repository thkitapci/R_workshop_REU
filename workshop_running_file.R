
setwd("/home/thkitapci/Desktop/R_workshop_REU/")
iris_data_set=read.csv("iris.csv")

head(iris_data_set)

plot(iris_data_set$Sepal.Length,iris_data_set$Sepal.Width)

par(mfrow=c(2,2))
hist(iris_data_set$Sepal.Length,xlab="Sepal Lenght",main="The Title")
hist(iris_data_set$Sepal.Width,xlab="Sepal Width",main="")
hist(iris_data_set$Petal.Length,xlab = "Petal Length",main="")
hist(iris_data_set$Petal.Width)

names=colnames(iris_data_set[1:4])
names
par(mfrow=c(2,2))
for (i in names)
{
  print (i)
  hist(iris_data_set[[i]])  
}




#Simulate data
dev.off()
set.seed(0)
par(mfrow=c(1,2))

A=rnorm(500,5,1)
B=rnorm(500,5.1,1)
hist(A,xlab="A")
hist(B,xlab="B")
t.test(A,B)








