#Ex4
# Set path files
setwd("C:/Users/gomes/Downloads")

# Read file
dt <- read.table('household_power_consumption.txt', header=T, sep=';',na.strings="?")

# Creates a colunm with date + time
dt$datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

# Creates a subset with data just 02 days 
dt2 <- dt[as.Date(dt$datetime) %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# Creates a png file
png(filename='plot4.png', width=480, height=480)

# Format plot space to receive 2 x 2 plots
par(mfrow=c(2, 2))

# Graph 1+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Creates a graph with parameter "type=1" for line.
with(dt2, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# Graph 2+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Creates a graph with parameter "type=1" for line.
with(dt2, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# Graph 3+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

# Graph 4+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
with(dt2, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()
