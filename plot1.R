p1d <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep =";")
p1d$Date <- as.Date(p1d$Date, "%d/%m/%Y")
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
p1d <- p1d[p1d$Date %in% d1:d2,]
png("plot1.png", height = 480, width = 480)
hist(p1d$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()