file <- "household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep=";", dec=".", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
sub_hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]

sub_hpc$date_time <- strptime(paste(sub_hpc$Date, sub_hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot2_chart <- function() {
    plot(sub_hpc$date_time,sub_hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
}

plot2_chart()

png("plot2.png", width=480, height=480)
plot2_chart()
dev.off()

