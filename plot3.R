
DF <- read.table(unz('household_power_consumption.zip', 'household_power_consumption.txt'),
				 sep = ';', na.string = '?', header = TRUE, stringsAsFactors=FALSE)
DF <- subset(DF, Date %in% c('1/2/2007', '2/2/2007'))
DF <- transform(DF, datetime = as.character(paste(Date, Time)))
DF <- transform(DF, datetime = strptime(datetime, '%d/%m/%Y %H:%M:%S'))

png(filename='plot3.png')
Sys.setlocale('LC_TIME', 'C')

with(DF, plot(datetime, Sub_metering_1, type='l', col='black',
			  main='', xlab='', ylab='Energy sub metering'))
with(DF, lines(datetime, Sub_metering_2, col='red'))
with(DF, lines(datetime, Sub_metering_3, col='blue'))

legend('topright', legend=paste('Sub_metering_', c(1, 2, 3), sep=''), col=c('black', 'red', 'blue'), lty=1)

dev.off()

