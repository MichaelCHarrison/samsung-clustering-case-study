maxAccelerationPlot <- function(){
        source("samsungData.R")
        samsungData <- samsungData()
        samsungData <- transform(samsungData, activity = factor(activity))
        sub1 <- subset(samsungData, subject == 1)  
        
        #Plotting max acceleration for the first subject
        
        par(mfrow = c(1,2))
        plot(sub1[,10], pch = 19, col = sub1$activity, ylab = names(sub1)[12])
        plot(sub1[,10], pch = 19, col = sub1$activity, ylab = names(sub1)[13])
}