p1d <-
  read.table(
    "household_power_consumption.txt", header = TRUE, na.strings = "?", sep =
      ";"
  )
p1d$Date <- as.Date(p1d$Date, "%d/%m/%Y")
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
p1d <- p1d[p1d$Date %in% d1:d2,]
p1d$newdate <- paste(p1d$Date, p1d$Time)
p1d$newdate <- as.POSIXct(p1d$newdate)
png("plot3.png", width = 480, height = 480)
plot(
  p1d$newdate, p1d$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering"
)
lines(p1d$newdate, p1d$Sub_metering_2, col = "red")
lines(p1d$newdate, p1d$Sub_metering_3, col = "blue")
legend(
  "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = 1, lwd = 2.5, col = c("black", "red", "blue")
)
dev.off()
