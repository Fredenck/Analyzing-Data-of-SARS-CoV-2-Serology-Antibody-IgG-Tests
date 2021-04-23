colorsConv <- function(arr) {
  color <- vector(mode = "character", length = length(pos))
  for (i in 1:length(arr)) {
    if (arr[i] == 1) {
      color[i] = "red"
    }else {
      color[i] = "blue"
    }
  }
  return (color)
}

windows(width = 12, height = 10)

hug <- read.csv("hug.csv")
age <- hug$age
igg <- hug$IgG_Ratio
# pos <- hug$Sex
pos <- hug$pos
color = colorsConv(pos)

# age <- scan("age.txt")
# igg <- scan("igg.txt")

plot(age, igg, col=color, main="COVID Based on Age and IgG Levels",
     xlab="Age (years)", ylab="IgG Ratios", pch=19)

legend(x="topright", legend = c("Positive", "Negative"), col=c("red","blue"), pch=19)

# abline(lm(igg~age), col="red") # regression line (y~x)
# lines(lowess(age,igg), col="blue") # lowess line (x,y)


