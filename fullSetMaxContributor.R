fullSetMaxContributor <- function(){
        source("samsungData.R")
        samsungData <- samsungData()
        samsungData <- transform(samsungData, activity = factor(activity))
        sub1 <- subset(samsungData, subject == 1)  
        svd1 = svd(scale(sub1[,-c(1, 2)])) #remove subject/activity identifier
        
        plot(svd1$v[,2], pch = 19)
}