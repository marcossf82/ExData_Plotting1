data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 69516, as.is = TRUE);

data <- rbind( data[data$Date == "1/2/2007" , ] , data[ data$Date == "2/2/2007" , ]);

library(dplyr);

data <- mutate(data, Global_active_power = as.numeric(Global_active_power));

data <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"));

windows();

plot.ts(data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n");

p <- c(1, length(data$Global_active_power)/2, length(data$Global_active_power));
 
axis(1, at = p, labels = c("Thu", "Fri", "Sat"));

dev.copy(png, "plot2.png");

dev.off();