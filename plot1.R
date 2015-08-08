data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 69516, as.is = TRUE);

data <- rbind( data[data$Date == "1/2/2007" , ] , data[ data$Date == "2/2/2007" , ]);

library(dplyr);

data <- mutate(data, Global_active_power = as.numeric(Global_active_power));

data <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"));

windows();

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power");

dev.copy(png, "plot1.png");

dev.off();