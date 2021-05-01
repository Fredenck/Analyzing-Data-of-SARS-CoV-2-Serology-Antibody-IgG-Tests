colorsConv <- function(sev) {
  color <- vector(mode = "character", length = length(sev))
  for (i in 1:length(sev)) {
    if (sev[i] == 1) {
      color[i] = "red"
    }else if (sev[i] == 0){
      color[i] = "blue"
    }else{
      color[i] = "black"
    }
  }
  return (color)
}

windows(width = 12, height = 10)

df <- read.csv("P-ED-Fig5A.csv")
age <- df$Age
igg <- df$IgG.S.CO
sev <- df$Severity

color <- colorsConv(sev)

plot(age, igg, col = color, main="Age and IgG Levels",
     xlab="Age (years)", ylab="IgG Ratios", pch=19)

legend(x="topright", legend = c("Severe", "Not Severe", "Unknown"), col=c("red","blue", "black"), pch=19)

