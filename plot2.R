# Script for Plot 2

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
sub_df[,3] <- as.numeric(sub_df[,3])

# Set plot margins
par(mar=c(3.0,4.1,4.1,2.1))

# Plot
plot(sub_df$Global_active_power, xaxt = "n", ylab = "Global Active Power (kilowatts)", type = "l")
wd <- seq.Date(sub_df$Date[1], sub_df$Date[length(sub_df$Date)], by="day")
axis(1, at=c(1, 1440, 2881), labels=weekdays(wd, abbreviate = TRUE))

# Generate PNG file
dev.print(png, file="plot2.png", width=480, height=480)
dev.off()
