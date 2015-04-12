plot2 <- function (){
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
  png("plot2.png", width=480, height=480)
  
  #background color to light grey
  par(bg="grey96")
  plot(power$Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
  axis(1,at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
  dev.off()
  
}