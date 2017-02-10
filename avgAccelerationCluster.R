avgAccelerationCluster <- function(){
        source("samsungData.R"); source("myplclust.R")
        samsungData <- samsungData()
        samsungData <- transform(samsungData, activity = factor(activity))
        sub1 <- subset(samsungData, subject == 1)  
        
        
        #Clustering based just on average acceleration
        
        distanceMatrix <- dist(sub1[,1:3])
        hclustering <- hclust(distanceMatrix)
        myplclust(hclustering, lab.col = unclass(sub1$activity))
        
}