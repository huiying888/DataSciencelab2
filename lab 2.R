# Activity 1: Data Exploration
str(Carseats)
?Carseats
Carseats
#Calculate descriptive statistics using describe()
describe(Carseats)
describe(Carseats,Sales,CompPrice,Income) #select columns by name
describe(Carseats,Sales:Income) #select all columns between sales and incomes(include)
describe(Carseats,-(Sales:Income)) #select all column except sales until income

#test manually
normality(Carseats)
normality(Carseats,Sales,CompPrice,Income) #select columns by name
normality(Carseats,Sales:Income) #select all columns between sales and incomes(include)
normality(Carseats,-(Sales:Income)) #select all column except sales until income



#plot normality
plot_normality(Carseats,Sales,CompPrice)

#calculate correlate
correlate(Carseats)
correlate(Carseats,Sales,CompPrice,Income) #select columns by name
correlate(Carseats,Sales:Income) #select all columns between sales and incomes(include)
correlate(Carseats,-(Sales:Income)) #select all column except sales until income


#plot correlate
Carseats %>%
  correlate() %>%
  plot()

correlate(Carseats,Sales,Price) %>%
  plot()

#EDA based on target variable
categ <- target_by(Carseats,US)

#EDA when target variable is categorical, predictor is numerical
cat_num<-relate(categ,Sales)
cat_num
summary(cat_num)
plot(cat_num)

#EDA when target variable is categorical, predictor is categorical
cat_cat<-relate(categ,ShelveLoc)
cat_cat
summary(cat_cat)
plot(cat_cat)

#EDA when target variable is numerical, predictor is numerical
num<-target_by(Carseats,Sales)
num_num<-relate(num,Price)
num_num
summary(num_num)
plot(num_num)

#EDA when target variable is numerical, predictor is categorical

num_cat<-relate(num,ShelveLoc)
num_cat
summary(num_cat)
plot(num_cat)

str(Churn_Train)
?(Churn_Train)

getwd()
churn<-read.csv("C:/Users/HP/Documents/DS/Churn_Train.csv")

#check for missing values for monthly charge
churn$Monthly.Charges
sum(is.na(churn$Monthly.Charges)) #sum of missing value

#check for missing values for dataset
sum(is.na(churn))
summary(is.na(churn))

#mean_value <- mean(Churn_Train, na.rm = TRUE)
#data_with_imputed_mean <- ifelse(is.na(Churn_Train), mean_value, Churn_Train)

#replace the missing value
churn <- churn %>%
  mutate(Total.Charges=replace(Total.Charges,is.na(Total.Charges),median(Total.Charges,na.rm=TRUE)))
is.na(churn$Total.Charges)
summary(is.na(churn))


churn
#Calculate descriptive statistics using describe()
describe(churn)
describe(churn,Tenure,Monthly.Charges,Total.Charges) #select columns by name
describe(churn,Tenure:Monthly.Charges) 
describe(churn,-(Tenure:Monthly.Charges)) 

#test manually
normality(churn)
normality(churn,Tenure,Monthly.Charges,Total.Charges) #select columns by name
normality(churn,Tenure:Monthly.Charges) 
normality(churn,-(Tenure:Monthly.Charges))



#plot normality
plot_normality(churn,Monthly.Charges,Total.Charges)

#calculate correlate
correlate(churn)
correlate(churn,Tenure,Monthly.Charges,Total.Charges) #select columns by name
correlate(churn,Tenure:Monthly.Charges) 
correlate(churn,-(Tenure:Monthly.Charges))


#plot correlate
churn %>%
  correlate() %>%
  plot()

correlate(churn,Monthly.Charges,Total.Charges) %>%
  plot()

#EDA based on target variable
churn$Payment.Method <- as.factor(churn$Payment.Method)
categ <- target_by(churn,Payment.Method)

#EDA when target variable is categorical, predictor is numerical
cat_num<-relate(categ,Monthly.Charges)
cat_num
summary(cat_num)
plot(cat_num)

#EDA when target variable is categorical, predictor is categorical
churn$Paperless.Billing <- as.factor(churn$Paperless.Billing)
cat_cat<-relate(categ,Paperless.Billing)
cat_cat
summary(cat_cat)
plot(cat_cat)

#EDA when target variable is numerical, predictor is numerical
num<-target_by(churn,Monthly.Charges)
num_num<-relate(num,Total.Charges)
num_num
summary(num_num)
plot(num_num)

#EDA when target variable is numerical, predictor is categorical

num_cat<-relate(num,Payment.Method)
num_cat
summary(num_cat)
plot(num_cat)

churn %>%
  eda_web_report(target="Total.Charges",subtitle="Churn_Train",
                 output_dir="C:/Users/HP/Documents/DS",output_file="EDA.pdf",theme="blue",
                 output_format = "pdf" )
