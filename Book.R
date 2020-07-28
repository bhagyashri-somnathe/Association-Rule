library(arules)
library(Matrix)

book_data <- read.csv(file.choose())

## data available in binary format so need to use matrix

book_rules <- apriori(as.matrix(book_data),parameter = list(support = 0.02,confidence = 0.5,minlen=5))

## set of 186 rules

inspect(sort(book_rules,by="lift")) 
## [1]   {CookBks,DoItYBks,ArtBks,ItalCook}           => {ItalArt}  0.0250  0.6849315

inspect(head(sort(book_rules,by="lift")))
## [1] {CookBks,DoItYBks,ArtBks,ItalCook} => {ItalArt}  0.0250  0.6849315  14.122299

inspect(tail(sort(book_rules,by="lift")))
## [1] {CookBks,DoItYBks,GeogBks,ItalCook}        => {ChildBks} 0.0270  0.7826087 

## all above rule we get with higher confidence value

## Now lets try to reduce rules count

book_rules1 <- apriori(as.matrix(book_data,parameter=list(support = 0.02, confidence = 0.30,minlen= 4)))

#book_rules1
#set of 7 rules 

inspect(sort(book_rules1,by ="lift"))
# [1] {ItalCook}         => {CookBks}  0.1135  1.0000000  2.320186 227  

library(arulesViz)
window()
plot(book_rules,method = "scatter")
plot(book_rules,method = "grouped")


window()
plot(book_rules1,method = "grouped")

