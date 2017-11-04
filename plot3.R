# Load the data

NEI <- readRDS("data2.rds")
SCC <- readRDS("data1.rds")

# keep only the data we'll need : 

matrix3 <- select(NEI, c(type, year))
matrix3 <- data.frame(table(matrix3, useNA = "no"))

# Conside year as factor

matrix3$year <- as.numeric(as.character(matrix3$year))

# Create and save the plot

png(filename = "plot3.png",
    width = 480, height = 480)

# Base plot : 

ggplot(matrix3, aes(x = year, y=Freq)) + geom_line(aes(color = type)) + labs(title = "Pollutant evolution by type", xlab = "year") + theme(legend.position = "bottom", legend.title = element_text(face = "bold"))

dev.off()
