library(readxl)
install.packages("ggplot2")

library(ggplot2)

gfg_data = read_excel("length_of_hospital_stay.xlsx")
gfg_data
head(gfg_data,2)
summary(gfg_data)
mean(gfg_data$Value[gfg_data$SUBJECT == "ACUTE"])
mean(gfg_data$Value[gfg_data$SUBJECT == "CHILDBIRTH"])
acute_data <- gfg_data[gfg_data$SUBJECT == "ACUTE",]
child_birth_data <- gfg_data[gfg_data$SUBJECT == "CHILDBIRTH",]
ggplot(acute_data,aes(x = TIME,y = Value )) + geom_point(color = "blue")
ggplot(child_birth_data,aes(x = TIME,y = Value )) + geom_point(color = Group)
acute_data$Group = "acute_data"
child_birth_data$Group = "child_birth_data"
ggplot(combined_data, aes(x = TIME, y = Value, color = Group)) +
  geom_point(size = 2) +
  xlim(min(combined_data$TIME), max(combined_data$TIME)) + 
  ylim(min(combined_data$Value), max(combined_data$Value)) +
  labs(
    title = "Scatterplot of Value vs TIME for Acute and Childbirth Subjects",
    x = "TIME",
    y = "Value",
    color = "Subject Group"
  ) +
  theme_minimal()
data <- data.frame(
  category = c("child_birth","acute"),
  count = c(mean(acute_data$Value),mean(child_birth_data$Value))
)
ggplot(data,aes(x = category, y = count)) 
boxplot(acute_data$Value,child_birth_data$Value,
        main = "Mean length of stay in days",
        xlab = "Days",
        ylab = "Stay",
        col = c("orange","blue"),
        border = "black",
        horizontal = TRUE,
        notch = TRUE
)

