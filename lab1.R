log(-1/5,10)*3
(log(10)-1/5)*3
mystring="Hello World"
print(mystring)

#create new object
x<-1
y=2
x=x+y
z=y*x
z

#save
ls()

#remove specific data
rm(x)

#remove all 
rm(list = ls())

sin(pi^2)

var.1=5
var_1=7
x=1
print(ls())
print(ls(pattern="var"))

#getting help
help("ls")
?ls

#getting keyword
apropos("med")

Gender<-"Female"
height<<-152
Weight=81
3->f
23.5->>x
b<-seq(from=0,to=5)
c<-seq(from=0, to=10,by=2)
v=2L
w<<--2+5i
a<-charToRaw("Hello")

num1=0.956786
num2=7.8345901
print(round(num1,2))
print(round(num2,3))

d<-seq(from=0, to=20)
print(d^2)

?paste
demo(graphics)
demo(image)

data=read.csv("C:/Users/HP/Documents/DS/seattle-weather.csv",header=TRUE )
n=dim(data)[1]
n
getwd()

data=data[n:1,]
data

x=matrix(rnorm(1,2),4,3)
x

print ( t ( x ) , 3 )

install.packages("tidyverse")
library(tidyverse)

ggplot(data)+geom_point(mapping=aes(x=precipitation,y=wind))

#find rows and columns
nrow(data)
ncol(data)
#first 10 rows
print(head(data, 10))
#last 10 rows
print(tail(data, 10))

data
data[['precipitation']]  # or print(data$ColumnName)

head(data)#by default 6 rows
view(data)
mean(data$temp_max)
summary(data)
