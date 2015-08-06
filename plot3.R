source("read.R")

# Get data
df <- read()

# Line colors
colors <- c("black", "red", "blue")

png("plot3.png")

plot(df$datetime, df$Sub_metering_1, col = colors[1], type = "l", ylab = "Energy sub meeting", xlab = "")
lines(df$datetime, df$Sub_metering_2, col = colors[2])
lines(df$datetime, df$Sub_metering_3, col = colors[3])
legend("topright", col = colors, legend = names(df)[5:7], lwd = 1)

dev.off()
