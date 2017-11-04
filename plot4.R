# Load the data

NEI <- readRDS("data2.rds")
SCC <- readRDS("data1.rds")

# keep only the data we'll need : 

myData <- merge(SCC, NEI, by="SCC")
myData <- myData[grep("Coal", myData$EI.Sector), ]

# Create and save the plot

png(filename = "plot4.png",
    width = 480, height = 480)

# Base plot : 

plot(table(myData$year, useNA = "no"), type = "l", col = "blue", xlab = "year", ylab = "Coal frequency", main = "Coal Pollution Evolution")

dev.off()
