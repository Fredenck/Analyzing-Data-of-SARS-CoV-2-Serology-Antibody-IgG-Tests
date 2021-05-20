library(ggplot2) 
require(gridExtra)

addSmallLegend <- function(myPlot, pointSize = 5, textSize = 8, spaceLegend = 1) {
  myPlot = myPlot +
    #guides(shape = guide_legend(override.aes = list(size = pointSize)),
    #       color = guide_legend(override.aes = list(size = pointSize))) +
    theme(legend.title = element_text(size = textSize), 
          legend.text  = element_text(size = textSize),
    #      legend.key.size = unit(spaceLegend, "lines")
    )
  return (myPlot)
}

windows(width = 12, height = 10)

table2 <- read.csv("P-ED-Fig2AD.csv")
grop <- table2$Group
days <- table2$Days.after.symptoms.onset
igg <- table2$IgG.S.CO
igm <- table2$IgM.S.CO


ggplot(table2, aes(x = igg, y = igm)) +
  labs(title = "IgG vs IgM",
       x = "IgG", 
       y = "IgM") +
  geom_point(size = 2)


# plot1 <- ggplot(table2, aes(x = days, 
#                   y = igm,
#                   color = grop, 
#                   group = grop)) +
#   labs(title = "Group IgM Levels Over Time",
#        x = "Days After Onset", 
#        y = "IgM Levels",
#        color = "Groups") +
#   geom_point(size = 2)
# 
# plot2 <- ggplot(table2, aes(x = days, 
#                             y = igg,
#                             color = grop, 
#                             group = grop)) +
#   labs(title = "Group IgG Levels Over Time",
#        x = "Days After Onset", 
#        y = "IgG Levels",
#        color = "Groups") +
#   geom_point(size = 2)
# 
# plot2 = addSmallLegend(plot2)
# plot1 = addSmallLegend(plot1)
# 
# #p = plot2 + facet_wrap(plot1)
# #print(p)
# grid.arrange(plot2, plot1, ncol=2)

