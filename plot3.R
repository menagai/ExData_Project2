#################################################################
## Plot 3 from Project 2 of the coursera course                ##
##      "Exploratory Data Analysis"                            ##
##                                                             ##
## Question:Of the four types of sources indicated by the type ##
##       (point, nonpoint, onroad, nonroad) variable, which of ##
##       these four sources have seen decreases in emissions   ##
##       from 1999–2008 for Baltimore City? Which have seen    ##
##       increases in emissions from 1999–2008? Use the        ##
##       ggplot2 plotting system to make a plot answer this    ##
##       question.                                             ##
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

NEI <- readRDS('summarySCC_PM25.rds')
NEI <- subset(NEI, fips == '24510')

if(!is.element('ggplot2', installed.packages())){install.packages('ggplot2')}
library('ggplot2')

p <- ggplot(NEI, aes(year,Emissions))
png('plot3.png', width = 960)
p+geom_point()+facet_grid(.~type)+geom_smooth(method='lm')+theme_bw()+
    labs(x = 'Years', y = expression(paste( PM[2.5], " emission (tons)"))
       , title = expression( paste(PM[2.5], ' emission of Baltimore City over the years 1999 to 2008 for each type of source'
                                   )))
dev.off()
