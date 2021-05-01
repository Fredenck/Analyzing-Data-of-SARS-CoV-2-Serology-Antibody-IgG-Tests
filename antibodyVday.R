library(ggplot2) 

windows(width = 12, height = 10)

table <- read.csv("P-ED-Fig6.csv")
id <- table$Patient.ID
# group <- table$Group
days <- table$Days.after.symptoms.onset
igg <- table$IgG..S.CO.
igm <- table$IgM..S.CO.

"
ggplot(table, aes(x = days, y = igg, colour = id, group = id)) +
  geom_line()
"
vid = c(paste0("Patient ", id))
ggplot(table, aes(x = factor(days), 
                  y = igg,
                  color = vid, 
                  group = id)) +
  labs(title = "Patient IgG Levels Over Time",
    x = "Days After Onset", 
    y = "IgG Levels",
    color = "Patient ID") +
  geom_line() +
  geom_point(size = 1)

