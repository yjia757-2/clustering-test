library(dplyr)
library(dataset)
library(ggplot2)
library(cluster) 
library(fpc)

tool <- read.csv("Old_Data.csv", stringsAsFactors = FALSE) %>% select(-Zone, -State, -GPO, -IDN, -Covered)
tool <- na.omit(tool)
tool <- scale(tool)

fit <- kmeans(tool, 4, nstart = 10)
fit
clusplot(tool, fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)
plotcluster(tool, fit$cluster)
