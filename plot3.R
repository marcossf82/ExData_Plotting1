data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 69516, as.is = TRUE);

data <- rbind( data[data$Date == "1/2/2007" , ] , data[ data$Date == "2/2/2007" , ]);

library(dplyr);

time_serie <- select(data, Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3);

time_serie <- mutate(time_serie, Time = paste(Date, Time));

time_serie <- select(time_serie, -Date);

windows();

pars = list(xlab = "", xaxt = "n", ylab = "Energy sub metering", col = c("blue", "black", "red"))

ts.plot(time_serie, gpars = pars)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

p <- c(1, length(data$Global_active_power)/2, length(data$Global_active_power));

axis(1, at = p, labels = c("Thu", "Fri", "Sat"));

dev.copy(png, "plot3.png");

dev.off();