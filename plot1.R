file <- "household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep=";", dec=".", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
sub_hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]

plot1_chart <- function() {
    hist(sub_hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", las = 1)
}

plot1_chart()
    
png("plot1.png", width=480, height=480)
plot1_chart()
dev.off()
