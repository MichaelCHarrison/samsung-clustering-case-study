avgAccPlot <- function(){
        source("samsungData.R")
        samsungData <- samsungData()
        
        #Plotting average acceleration for first subject
        
        par(mfrow = c(1,2), mar = c(5,4,1,1))
        samsungData <- transform(samsungData, activity = factor(activity))
        sub1 <- subset(samsungData, subject == 1) #Set subject number 
        plot(sub1[,1], col = sub1$activity, ylab = names(sub1)[3])
        plot(sub1[,2], col = sub1$activity, ylab = names(sub1)[4])
        legend("bottomright", legend = unique(sub1$activity), col = unique(sub1$activity),
               pch = 1)
        
}