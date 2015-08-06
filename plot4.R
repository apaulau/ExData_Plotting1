source("read.R")

# Get data
df <- read()

# Line colors
colors <- c("black", "red", "blue")

png("plot4.png")

par(mfcol = c(2, 2))

with(df, {
    plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    
    plot(datetime, Sub_metering_1, type = "l", col = colors[1], ylab = "Energy sub meeting", xlab = "")
    lines(datetime, Sub_metering_2, col = colors[2])
    lines(datetime, Sub_metering_3, col = colors[3])
    legend("topright", col = colors, legend = names(df)[5:7], lwd = 1, bty = "n")
    
    plot(datetime, Voltage, type = "l", xaxt = "n")
    
    plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", xaxt = "n")
})

dev.off()