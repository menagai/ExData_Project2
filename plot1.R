#################################################################
## Plot 1 from Project 2 of the coursera course                ##
##      "Exploratory Data Analysis"                            ##
##                                                             ##
## Question: Have total emissions from PM2.5 decreased         ##
##           in the United States from 1999 to 2008?           ##
##           Using the base plotting system, make a plot       ##
##           showing the total PM2.5 emission from all         ##
##           sources for each of the years 1999, 2002,         ##
##           2005, and 2008.                                   ##
##                                                             ##
## input: dataset of PM2.5 emission from the Environmental     ##
##        Protection Agency from the years 1999, 2002, 2005    ##
##        and 2008 (summarySCC_PM25.rds and                    ##
##        Source_Classification_Code.rds)                      ##
##                                                             ##
## output: a .png file, on the plots directory (./plots), that ##
##         answer the question above                           ##
##                                                             ##
## author: Micael Eiji Nagai                                   ##
##                                                             ##
## date: 06/02/2015                                            ##
#################################################################

NEI <- readRDS('summarySCC_PM25.rds')

png('./plot1.png')
with(NEI, {
    par(bty = 'l')
    plot( Emissions ~ year, col = rgb(0,0,0,0.7)
       , ylab = expression(paste(PM[2.5], ' Emission (tons)'))
       , xlab = 'Year', main = expression( paste( PM[2.5],
           ' emission from USA over the years 1999 to 2008')))
    })
dev.off()
