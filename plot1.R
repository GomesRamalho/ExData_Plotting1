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

# Creates a histogram with title, x label and set red color to bars
hist(dt2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close device
dev.off()
