data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
data$date.time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, "%T")
sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

sub1 <- as.numeric(sub$Sub_metering_1)
sub2 <- as.numeric(sub$Sub_metering_2)
sub3 <- as.numeric(sub$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(sub$date.time, sub1, col = "black", type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(sub$date.time, sub2, col = "red", type = "l")
lines(sub$date.time, sub3, col = "blue", type = "l")
legend('topright','groups'
       ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       col=c('black','red','blue'))
dev.off()