# Load the data

NEI <- readRDS("data2.rds")
SCC <- readRDS("data1.rds")

# keep only the data we'll need : 

matrix <- data.frame(table(NEI$year, useNA = "no"))
names(matrix) <- c("year", "pollutant")

# Conside year as factor

matrix$year <- as.numeric(as.character(matrix$year))

# Create and save the plot

png(filename = "plot2.png",
    width = 480, height = 480)

# Base plot : 

plot(table(subset(NEI, NEI$fips == "24510")$year, useNA = "no"), type = "l", col = "blue", xlab = "year", ylab = "pollutant", main = "Pollutant frequency evolution in Baltimore")

dev.off()
