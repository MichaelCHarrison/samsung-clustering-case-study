maxAccelerationCluster <- function(){
        source("samsungData.R"); source("myplclust.R")
        samsungData <- samsungData()
        samsungData <- transform(samsungData, activity = factor(activity))
        sub1 <- subset(samsungData, subject == 1)  
        
        #Clustering based on maximum acceleration
        
        distanceMatrix <- dist(sub1[,12:14]) #max acceleration columns
        hclustering <- hclust(distanceMatrix)
        myplclust(hclustering, lab.col = unclass(sub1$activity))
}