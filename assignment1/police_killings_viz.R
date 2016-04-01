library("dplyr")
library("ggplot2")

police_killings <- read.csv("~/GitRepos/CS448B-DataViz/assignment1/police_killings.csv")

names(police_killings)

## Compute the number of killings total in each month
print(police_killings$month)

month_cnts = table(police_killings$month)

month_names = names(month_cnts)
month_fac = factor(month_names, levels = month.name)

month_fac = sort(month_fac)


# plot the same trend based on race
black_kills = subset(police_killings, raceethnicity == "Black")
black_cnts = table(black_kills$month)

white_kills = subset(police_killings, raceethnicity == "White")
white_cnts = table(white_kills$month)

hisp_kills = subset(police_killings, raceethnicity == "Hispanic/Latino")
hisp_cnts = table(hisp_kills$month)

asian_kills = subset(police_killings, raceethnicity == "Asian/Pacific Islander")
asian_cnts = table(asian_kills$month)

nat_kills = subset(police_killings, raceethnicity == "Native American")
nat_cnts = table(nat_kills$month)

un_kills = subset(police_killings, raceethnicity == "Unknown")
un_cnts = table(un_kills$month)

# plot the counts for each month with a simple point
plot(month_fac,month_cnts[month.name[1:6]], xlab = "", ylab = "Total Police Killings")
points(month_fac,black_cnts[month.name[1:6]], col = "black", pch = 19)
points(month_fac,white_cnts[month.name[1:6]], col = "bisque2", pch = 19)
points(month_fac,hisp_cnts[month.name[1:6]], col = "chocolate", pch = 19)
points(month_fac,asian_cnts[month.name[1:6]], col = "darkgoldenrod1", pch = 19)
points(month_fac,nat_cnts[month.name[1:6]], col = "coral4", pch = 19)
points(month_fac,un_cnts[month.name[1:6]], col = "azure4", pch = 19)





## References
# Getting counts of a factor: http://stackoverflow.com/questions/16073918/count-occurrences-of-factor-in-r-with-zero-counts-reported 
# Accessing values of a table: http://stackoverflow.com/questions/10104400/extract-a-row-from-a-table-object
# Points plotting: https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/points.html
# Multiple series on a plot: http://www.sixhat.net/how-to-plot-multpile-data-series-with-ggplot.html
# Colors: http://research.stowers-institute.org/efg/R/Color/Chart/
