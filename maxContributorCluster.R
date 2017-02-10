maxContributorCluster <- function(){
        source("samsungData.R"); source("myplclust.R")
        samsungData <- samsungData()
        samsungData <- transform(samsungData, activity = factor(activity))
        sub1 <- subset(samsungData, subject == 1)  
        svd1 = svd(scale(sub1[,-c(1, 2)])) #remove subject/activity identifier
        
        maxContrib <- which.max(svd1$v[,2])
        distanceMatrix <- dist(sub1[, c(12:14, maxContrib)])
        hclustering <- hclust(distanceMatrix)
        myplclust(hclustering, lab.col = unclass(sub1$activity))
}