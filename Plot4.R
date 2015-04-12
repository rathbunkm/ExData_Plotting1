plot4 <- function (){
  #set working directory
  setwd("C:/Users/Kevin/Data_Science/datasciencecoursera/Exploratory_Data_Analysis")
  
  library("data.table")
  #read data
  powerdata <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
  
  setwd("C:/Users/Kevin/Data_Science/datasciencecoursera/ExData_Plotting1")
  
  data <- data.table(powerdata)
  
  #subset data of interest
  power <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
  
  #adjust date&time
  power$DateTime <- paste(power$Date, power$Time)
  power$DateTime <- as.Date(power$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  #initialize png file
  png("plot4.png", width=480, height=480)
  
  #background color to light grey, make 2x2 display of charts
  par(mar=c(5,4,4,2),bg="grey96", mfcol=c(2,2))
  
  #plot 1
  plot(power$Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
  axis(1,at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
  
  #plot 2
  plot(power$Sub_metering_1, type="l", 
       ylab="Energy sub metering", xlab="", xaxt="n")
  lines(power$Sub_metering_2, col="red")
  lines(power$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"),bty="n", 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  axis(1,at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
  
  #plot 3
  plot(power$Voltage, type="l", 
       ylab="Voltage", xlab="datetime", xaxt="n")
  axis(1,at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
  
  #plot 4
  plot(power$Global_reactive_power, type="l", 
       ylab="Global_reactive_power", xlab="datetime", xaxt="n")
  axis(1,at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat")) 
  
  
  dev.off()
  
}