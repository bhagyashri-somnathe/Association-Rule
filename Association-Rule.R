#Prepare rules for the all the data sets 

#1) Try different values of support and confidence. Observe the change in number of rules for different support,confidence values

#2) Change the minimum length in apriori algorithm

#3) Visulize the obtained rules using different plots 


library(Matrix)
library(arules)

data()
data("Groceries")
summary(Groceries)

inspect(Groceries[1:10])
itemFrequencyPlot(Groceries,topN =20)

## try association rules 

groceries_rules <- apriori(Groceries,parameter = list(support =0.01,confidence = 0.20,minlen =3))
## set of 80 rules 

inspect(head(sort(groceries_rules,by ="lift")))
 #[1] {citrus fruit,other vegetables}   => {root vegetables}    0.01037112 0.3591549 

## lets try to reduce rules

groceries_rules1 <- apriori(Groceries,parameter = list(support =0.011,confidence = 0.40,minlen =2))
## set of 49 rules

inspect(tail(sort(groceries_rules1,by ="lift")))
##[1] {chicken}        => {whole milk} 0.01759024 0.4099526  1.604411 173  

groceries_rules2 <- apriori(Groceries,parameter = list(support =0.02,confidence = 0.30,minlen =3))
## set of 5 rules 

inspect(groceries_rules2,by ="lift")
#[1] {root vegetables,other vegetables} => {whole milk}       0.02318251 0.4892704 

library(arulesViz)

window()

plot(groceries_rules1,method = "grouped")
plot(groceries_rules2,method = "grouped")
