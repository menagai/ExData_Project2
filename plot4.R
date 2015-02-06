#################################################################
## Plot 4 from Project 2 of the coursera course                ##
##      "Exploratory Data Analysis"                            ##
##                                                             ##
## Question: Across the United States, how have emissions from ##
##     coal combustion-related sources changed from 1999–2008? ##
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

if(!is.element('ggplot2', installed.packages())){install.packages('ggplot2')}
library('ggplot2')
dir <- './/plots'
if(!file.exists(dir))dir.create(dir)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

scc_coal <- SCC$SCC[grep( 'coal', SCC$EI.Sector, ignore.case=TRUE, value=FALSE)]

tmp <- subset( NEI, NEI$SCC %in% scc_coal)
tmp <- aggregate( list(Emissions = tmp$Emissions), by = list(year = tmp$year), FUN = sum)

png(paste0(dir,'//plot4.png'))
p <- ggplot(tmp, aes( year,Emissions))
p+geom_line()+theme_minimal()+ theme( axis.line= element_line(size = 0.5)) +
    labs( x= 'Years', y = expression( paste( PM[2.5], ' emission (ton)')),
         title = expression(
             paste( PM[2.5], ' emission from coal combustion in USA (1999 to 2008)')))
dev.off()
