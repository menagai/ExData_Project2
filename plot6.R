#################################################################
## Plot 6 from Project 2 of the coursera course                ##
##      "Exploratory Data Analysis"                            ##
##                                                             ##
## Question: Compare emissions from motor vehicle sources in   ##
##       Baltimore City with emissions from motor vehicle      ##
##       sources in Los Angeles County, California             ##
##       (fips == "06037"). Which city has seen greater        ##
##       changes over time in motor vehicle emissions?         ##
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
## date: 07/02/2015                                            ##
##                                                             ##
#################################################################

if(!is.element('ggplot2', installed.packages())){install.packages('ggplot2')}
library('ggplot2')
dir <- './/plots'
if(!file.exists(dir))dir.create(dir)

NEI <- readRDS('summarySCC_PM25.rds')
NEI <- subset(NEI, fips == '24510' | fips == '06037')
SCC <- readRDS('Source_Classification_Code.rds')

scc_vehicles <- SCC$SCC[grep('vehicle', SCC$EI.Sector, ignore.case=TRUE)]

tmp <- subset(NEI, NEI$SCC %in% scc_vehicles, select = c(Emissions,year,fips))
tmp <- aggregate(list( Emissions = tmp$Emissions), by = list( year = tmp$year, fips = tmp$fips), FUN = sum)

p <- ggplot( tmp, aes( year, Emissions)) +geom_line(aes(color = fips))
p <- p + theme_minimal()+ theme(axis.line = element_line(size = 0.8))
p <- p+ scale_color_discrete(name = 'City', labels = c('Los Angeles','Baltimore'))
p <- p+labs(x = 'Year', y = expression( paste( PM[2.5], ' emission (ton)')))
p <- p+labs(title = expression( paste( PM[2.5], ' emission from vehicle (1999 to 2008)')))
png(paste0(dir,'//plot6.png'))
p
dev.off()
