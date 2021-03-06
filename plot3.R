# Set path files
setwd("C:/Users/gomes/Downloads")

# Read file
dt <- read.table('household_power_consumption.txt', header=T, sep=';',na.strings="?")

# Creates a colunm with date + time
dt$datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

# Creates a subset with data just 02 days 
dt2 <- dt[as.Date(dt$datetime) %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# Creates a png file
png(filename='plot1.png', width=480, height=480)

# Creates a graph with each line with a color 
with(dt2, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
  colors <- c("black", "red", "blue")
  variables <- paste0("Sub_metering_", 1:3)
# Loop to draw each line with a diferent color  
  for (i in seq_along(variables)) {
    var <- variables[i] 
    data <- dt2[[var]]
    lines(dt2$datetime, data, col=colors[i])
  }
# Creates a legend on top
legend("topright", legend=variables, col=colors, lty="solid" )

# Close device
dev.off()

