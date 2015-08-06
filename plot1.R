source("read.R")

# Get data
df <- read()

png("plot1.png")

hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()