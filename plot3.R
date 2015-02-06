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
dir <- './/plots'
if(!file.exists(dir))dir.create(dir)

if(!is.element('ggplot2', installed.packages())){install.packages('ggplot2')}
library('ggplot2')

NEI <- readRDS('summarySCC_PM25.rds')
NEI <- subset(NEI, fips == '24510')

tmp <- aggregate(list( Emissions = NEI$Emissions), by = list( year = NEI$year, type = NEI$type), FUN = sum)
                                                        
p <- ggplot(tmp, aes(year,Emissions))
png(paste0(dir,'//plot3.png'))
p+geom_line(aes(color = type))+theme_minimal()+theme(axis.line = element_line(size = 0.5),
                                                     plot.title= element_text(size = rel(0.9)))+
    labs(x = 'Years', y = expression(paste( PM[2.5], " emission (tons)"))
       , title = expression( paste(PM[2.5], ' emission of Baltimore City for each type of source (1999 to 2008)' )))
dev.off()




