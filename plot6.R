# Load the data

NEI <- readRDS("data2.rds")
SCC <- readRDS("data1.rds")

# keep only the data we'll need : 

myData <- merge(SCC, NEI, by="SCC")
matrix4 <- select(myData, c(fips, year))
matrix4 <- subset(matrix4, matrix4$fips == "24510" | matrix4$fips == "06037")
matrix4 <- data.frame(table(matrix4, useNA = "no"))

# Conside year as factor

matrix4$year <- as.numeric(as.character(matrix4$year))

# Create and save the plot

png(filename = "plot6.png",
    width = 480, height = 480)

# ggplot plot : 

ggplot(matrix4, aes(x = year, y=Freq)) + geom_line(aes(color = fips)) + labs(title = "Pollutant evolution by type", xlab = "year") + theme(legend.position = "bottom", legend.title = element_text(face = "bold"))

dev.off()
