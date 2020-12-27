
# Setting appropriate working directory

setwd("C:/Users/tgopal/OneDrive - Macquarie Group/Personal Folders/Desktop/TM1 + R/R for Data Science/EDA/Project 1")

# Loading required data

UCIML_data <- read.table("C:/Users/tgopal/OneDrive - Macquarie Group/Personal Folders/Downloads/household_power_consumption.txt",
                         sep = ";", header = TRUE)

#Converting Data and variables into appropriate formats for further analyss
UCIML_data$Date <- as.Date(UCIML_data$Date, format = "%d/%m/%Y")
UCIML_data$Global_active_power <- as.numeric(UCIML_data$Global_active_power)
UCIML_data$Global_reactive_power <- as.numeric(UCIML_data$Global_reactive_power)
UCIML_data$Voltage <- as.numeric(UCIML_data$Voltage)
UCIML_data$Global_intensity <- as.numeric(UCIML_data$Global_intensity)
UCIML_data$Sub_metering_1 <- as.numeric(UCIML_data$Sub_metering_1)
UCIML_data$Sub_metering_2 <- as.numeric(UCIML_data$Sub_metering_2)
UCIML_data$Time <- strptime(UCIML_data$Time, format = "%H:%M:%S")

# Creating required subset of data for plotting
UCIML_sub <- subset(UCIML_data, Date == "2007-02-01" | Date == "2007-02-02")
UCIML_sub[1:1440, "Time"] <- format(UCIML_sub[1:1440, "Time"], "2007-02-01 %H:%M:%S" )
UCIML_sub[1441:2880, "Time"] <- format(UCIML_sub[1441:2880, "Time"], "2007-02-02 %H:%M:%S" )

# Creating plot3

with(UCIML_sub, plot(Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "", main = "Energy sub- metering"))
with(UCIML_sub, lines(Time, Sub_metering_1))
with(UCIML_sub, lines(Time, Sub_metering_2, col = "red"))
with(UCIML_sub, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Saving plot to a PNG file

dev.copy(png, file = "plot3.png")
dev.off()

