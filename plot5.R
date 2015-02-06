#################################################################
## Plot 5 from Project 2 of the coursera course                ##
##      "Exploratory Data Analysis"                            ##
##                                                             ##
## Question: How have emissions from motor vehicle sources     ##
##     changed from 1999–2008 in Baltimore City?               ##
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
##                                                             ##
#################################################################

if(!is.element('ggplot2', installed.packages())){install.packages('ggplot2')}
library('ggplot2')
dir <- './/plots'
if(!file.exists(dir))dir.create(dir)

NEI <- readRDS('summarySCC_PM25.rds')
NEI <- subset(NEI, fips == '24510')
SCC <- readRDS('Source_Classification_Code.rds')

scc_vehicles <- SCC$SCC[grep('vehicle', SCC$EI.Sector, ignore.case=TRUE)]


tmp <- subset(NEI, NEI$SCC %in% scc_vehicles, select = c(Emissions, year))

tmp <- aggregate( x= list( Emissions = tmp$Emissions), by = list( year = tmp$year), FUN = sum)

png( paste0(dir,'//plot5.png'))
p <- ggplot( tmp, aes( year, Emissions))
p+geom_line()+ theme_minimal()+ theme( axis.line = element_line( size = 0.5))+
        labs( x= 'Years', y = expression( paste( PM[2.5], ' emission (ton)')),
         title = expression(
             paste( PM[2.5], ' emission from vehicle in Baltimore City (1999 to 2008)')))
dev.off()






