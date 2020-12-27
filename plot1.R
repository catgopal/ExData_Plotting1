
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


# Creating required subset of data for plotting
UCIML_sub <- subset(UCIML_data, Date == "2007-02-01" | Date == "2007-02-02")

# Creating plot1

hist(UCIML_sub$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts",
     main = "Global Active Power", ylim = c(0,1200))

# Saving plot to a PNG file

dev.copy(png, file = "plot1.png")
dev.off()
