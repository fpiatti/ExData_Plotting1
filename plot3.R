# Script for Plot 3

# Load libraries
library(lubridate)

# Load data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Convert factor dates to date format
df$Date <- dmy(df$Date)

# Subset readings from Feb 1-2, 2007
n1 <- which(df$Date == "2007-02-01" & df$Time == "00:00:00")
n2 <- which(df$Date == "2007-02-03" & df$Time == "00:00:00")
sub_df <- df[n1:n2,]

# Convert format of readings to numeric
sub_df[,7] <- as.numeric(sub_df[,7])
sub_df[,8] <- as.numeric(sub_df[,8])
sub_df[,9] <- as.numeric(sub_df[,9])

# Set plot margins
par(mar=c(3.0,4.1,4.1,2.1))

# Plot
plot(sub_df$Sub_metering_1, xaxt = "n", ylab = "Energy sub metering", type = "l", col = "black")
lines(sub_df$Sub_metering_2, type = "l", col = "red")
lines(sub_df$Sub_metering_3, type = "l", col = "blue")
axis(1, at=c(1, 1440, 2881), labels=weekdays(wd, abbreviate = TRUE))
legend(1900, 40, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("blue", "red", "black"), bty = "n")

# Generate PNG file
dev.print(png, file="plot3.png", width=480, height=480)
dev.off()
