# Script for Plot 1

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

# Histogram
hist(sub_df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Generate PNG file
dev.print(png, file="plot1.png", width=480, height=480)
dev.off()

            