## For plotting the tree graph from C50 model
# by Gui Lin
# Date: 2018-04

source("src/lib-setup.R")
require("C50")
require("partykit")

# plot without preprocess to better visualize the graph

# comment out as model has already trained. 
# set.seed(1)
# mod_c50_5 <- C5.0(x = trainingSet%>%select(-Class) %>% mutate(hasReadme=as.factor(hasReadme)) %>% select(-parent),
#      y=trainingSet$Class,
#      trials = 50,
#      rules=FALSE,
#      winnow = "FALSE")
# confusionMatrix(predict(mod_c50_5,newdata = trainingSet%>%select(-Class) %>% mutate(hasReadme=as.factor(hasReadme)) %>% select(-parent)),trainingSet$Class,mode=c('everything'))
# confusionMatrix(predict(mod_c50_5,newdata = data_two_class_test%>%select(-Class) %>% mutate(hasReadme=as.factor(hasReadme)) %>% select(-parent)),data_two_class_test$Class,mode=c('everything'))
# saveRDS(mod_c50_5 ,file="data/20180420_mod_c50_5.RDS")


# for plotting the tree
mod_c50_5 <- readRDS(file="data/20180420_mod_c50_5.RDS")
pdf(file="data/20180420_mod_c50_5.pdf", width=100/2.54, height=60/2.54)
# plot the whole tree
plot(mod_c50_5)
myTree2 <- C50:::as.party.C5.0(mod_c50_5)
# plot the partial tree by specifying the node number, i.e., 217
plot(myTree2[217])
dev.off()

pdf(file="data/20180420_mod_c50_5_b.pdf", width=100/2.54, height=60/2.54)