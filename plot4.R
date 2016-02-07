file <- "household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep=";", dec=".", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
sub_hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]

sub_hpc$date_time <- strptime(paste(sub_hpc$Date, sub_hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2), mar = c(4,4,1,2), oma = c(0,0,2,0))

plot1_chart <- function() {
  plot(sub_hpc$date_time,sub_hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
}

plot2_chart <- function() {
  plot(sub_hpc$date_time, sub_hpc$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub meeting", xlab = "")
  lines(sub_hpc$date_time, sub_hpc$Sub_metering_2, type="l", col="red")
  lines(sub_hpc$date_time, sub_hpc$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = "0")
}

plot3_chart <- function() {
  plot(sub_hpc$date_time,sub_hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
}

plot4_chart <- function() {
  plot(sub_hpc$date_time,sub_hpc$Global_reactive_power, type = "l", xlab = "datetime")
}

plot1_chart()
plot2_chart()
plot3_chart()
plot4_chart()

png("plot3.png", width=480, height=480)
plot1_chart()
plot2_chart()
plot3_chart()
plot4_chart()
dev.off()

