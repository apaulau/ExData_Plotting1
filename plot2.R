source("read.R")

# Get data
df <- read()

png("plot2.png")

plot(x=df$datetime, y=df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()