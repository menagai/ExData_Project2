#################################################################
## Plot 2 from Project 2 of the coursera course                ##
##      "Exploratory Data Analysis"                            ##
##                                                             ##
## Question: Have total emissions from PM2.5 decreased in the  ##
##   Baltimore City, Maryland (fips == "24510") from 1999 to   ##
##   2008? Use the base plotting system to make a plot         ## 
##   answering this question.                                  ##
##                                                             ##   
## input: dataset of PM2.5 emission from the Environmental     ##
##        Protection Agency from the years 1999, 2002, 2005    ##
##        and 2008 (summarySCC_PM25.rds and                    ##
##        Source_Classification_Code.rds)                      ##
##                                                             ##
## output: a .png file, that answer the question above         ##
##                                                             ##
## author: Micael Eiji Nagai                                   ##
##                                                             ##
## date: 06/02/2015                                            ##
#################################################################
dir <- './/plots'
if( !file.exists(dir))dir.create(dir)

NEI <- readRDS('summarySCC_PM25.rds')
NEI <- subset(NEI, fips == '24510')

tmp <- aggregate( x=list(Emissions = NEI$Emissions), by = list(year = NEI$year), FUN = mean)

png(paste0(dir,'//plot2.png'))
with( tmp, {
    par(bty = 'l')
    plot( Emissions ~ year, type = 'l'
       , ylab = expression(paste(PM[2.5], ' Emission (tons)'))
       , xlab = 'Year', main = expression( paste( PM[2.5],
           ' emission of Baltimore City over the years 1999 to 2008')))
})
dev.off()
