fullSetSVD <- function(){
        source("samsungData.R")
        samsungData <- samsungData()
        samsungData <- transform(samsungData, activity = factor(activity))
        sub1 <- subset(samsungData, subject == 1)  
        
        svd1 = svd(scale(sub1[,-c(1, 2)])) #remove subject/activity identifier
        par(mfrow = c(1,2))
        plot(svd1$u[,1], col = sub1$activity, pch = 19)
        plot(svd1$u[,2], col = sub1$activity, pch = 19)
}