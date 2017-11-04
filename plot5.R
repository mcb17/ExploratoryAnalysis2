# Load the data

NEI <- readRDS("data2.rds")
SCC <- readRDS("data1.rds")

# keep only the data we'll need : 

myData <- merge(SCC, NEI, by="SCC")
myData <- myData[grep("Onroad", myData$Data.Category), ]

# Create and save the plot

png(filename = "plot5.png",
    width = 480, height = 480)

# Base plot : 

plot(table(subset(myData, myData$fips == "24510")$year, useNA = "no"), type = "l", col = "blue", xlab = "year", ylab = "pollutant", main = "Pollutant frequency evolution in Baltimore for motor vehicules")

dev.off()
