library("dplyr")
library("Hmisc")

police_killings <- read.csv("~/GitRepos/CS448B-DataViz/assignment1/the-counted-2015.csv")

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

# plot the counts for each month with a simple point and line
plot(month_fac,month_cnts[month.name], xlab = "", xaxt = "n", ylab = "People Killed", ylim = c(0,134))
lines(month_fac,black_cnts[month.name], col = "black", pch = 19, type = "o")
lines(month_fac,white_cnts[month.name], col = "bisque2", pch = 19, type = "o")
lines(month_fac,hisp_cnts[month.name], col = "chocolate", pch = 19, type = "o")
lines(month_fac,asian_cnts[month.name], col = "darkgoldenrod1", pch = 19, type = "o")
lines(month_fac,nat_cnts[month.name], col = "coral4", pch = 19, type = "o")
lines(month_fac,un_cnts[month.name], col = "azure4", pch = 19, type = "o")
minor.tick(ny=2, tick.ratio=0.5)
axis(1, at=1:12, labels=month.abb) # Change x labels to month abbreviations
title(main="People Killed by Police in 2015")
legend(4,139, c("White", "Black", "Hispanic", "Asian", "Native American", "Unknown"), 
       col = c("bisque2", "black", "chocolate", "darkgoldenrod1", "coral4", "azure4"), lty = c(1,1,1,1,1,1), 
       pch = c(19, 19, 19, 19, 19, 19), ncol = 3, box.lty=0)
legend(0.1,139, c("Total Killed"), col = c("black"), lty = c(1), lwd = c(3), box.lty=0)
grid(0,NULL)

# compute the cumulative killings over time
#cum_2015 = cumsum(month_cnts[month.name])

#lines(month_fac,cum_2015[month.name], type = "o", ylim = c(0,1150))

## References
# Getting counts of a factor: http://stackoverflow.com/questions/16073918/count-occurrences-of-factor-in-r-with-zero-counts-reported 
# Accessing values of a table: http://stackoverflow.com/questions/10104400/extract-a-row-from-a-table-object
# Points plotting: https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/points.html
# Multiple series on a plot: http://www.sixhat.net/how-to-plot-multpile-data-series-with-ggplot.html
# Colors: http://research.stowers-institute.org/efg/R/Color/Chart/
# Chart axes limits: https://stat.ethz.ch/pipermail/r-help/2008-June/165558.html
# Points and lines: http://www.statmethods.net/graphs/line.html
# Controlling x labels on your own: http://stackoverflow.com/questions/5182238/r-replace-x-axis-with-own-values
# Cumulative Sums: https://stat.ethz.ch/R-manual/R-devel/library/base/html/cumsum.html
# Multiple plots on one graph: http://www.r-bloggers.com/r-single-plot-with-two-different-y-axes/
# Adding a legend to the the plot: https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/legend.html
#         http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way
# Adding gridlines: https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/grid.html
# Adding minor ticks: http://math.furman.edu/~dcs/courses/math47/R/library/Hmisc/html/minor.tick.html
