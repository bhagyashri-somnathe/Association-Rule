library(Matrix)
library(arules)

movie_data <- read.transactions(file.choose(),format = "basket")
inspect(movie_data[2:8])
summary(movie_data)
itemFrequencyPlot(movie_data,topN = 12)


## Create rules for Movies data :

movie_rules <- apriori(movie_data,parameter = list(support = 0.10, confidence = 0.60 , minlen = 2))
## set of 2 rules 
inspect(sort(movie_rules,by ="lift")) 

movie_rules1 <- apriori(movie_data,parameter = list(support = 0.05, confidence = 0.20 , minlen = 3))
## set of 22 rules
inspect(sort(movie_rules1,by ="lift"))

movie_rules2 <- apriori(movie_data,parameter = list(support = 0.5, confidence = 0.30 , minlen = 4))
## set of 0 rules

movie_rules3 <- apriori(movie_data,parameter = list(support = 0.101010, confidence = 0.50 , minlen = 2))
##set of 2 rules 
inspect(sort(movie_rules3,by ="lift"))

window()

install.packages("arulesViz")
library(arulesViz)
install.packages("gridGraphviz")

plot(movie_rules,method = "scatterplot")
plot(movie_rules,method = "grouped")
plot(movie_rules,method = "graph")

