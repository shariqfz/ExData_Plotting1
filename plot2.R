#Load complete data
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

data$date.time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

#Convert Time character to datetime class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, "%T")
df <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot2.png", width = 480, height = 480)
plot(df$date.time, 
     as.numeric(df$Global_active_power), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
