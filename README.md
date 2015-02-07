# Info

These repository was made for the Project 2 coursera course "Exploratory Data Analysis".

The R scripts create plots to answer the questions:

* plot1 - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

* plot2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? Use the base plotting system to make a plot answering this question.

* plot3 - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

* plot4 - Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

* plot5 - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

* plot6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California. Which city has seen greater changes over time in motor vehicle emissions?

# How to use:

### Pre-requisite

* First, download the rds data from Environmental Protection Agency (source_Classification_Code.rds and Source_Classification_code.rds)

* Save the R scripts where the data files are .

* On R, set the working directory to where are the files use the comand `setwd("path")`.

* Run the script on R console using the `source( 'plotX.R' )` substitute the X for 1, 2, 3 or 4 to make the respective plot.

* Alternatively you can run the command `R CMD BATCH plotX.R` on your operational system terminal. Again, substitute the X for 1 to 4, depending on the plot to make.

### Output

The output of the scripts is a .png file, with the dimension 480 X 480px, containing the plots. Those files will be saved on plots directory `./plot` on the working directory.

### Author:
Micael Eiji Nagai
