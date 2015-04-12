plot1 <- function (){
  #set working directory
  setwd("C:/Users/Kevin/Data_Science/datasciencecoursera/Exploratory_Data_Analysis")
  
  library("data.table")
  #read data
  powerdata <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
    
  setwd("C:/Users/Kevin/Data_Science/datasciencecoursera/ExData_Plotting1")
  
  data <- data.table(powerdata)
                     
  #subset data of interest
  power <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
  
  #fix class and grab global active
  Global_Active <- as.numeric(power$Global_active_power)
  
  #plot
  par(mar=c(5,6,4,2),bg="grey96")
  png("plot1.png", width=480, height=480)
  hist(Global_Active, main = "Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
  dev.off()
  
  
}