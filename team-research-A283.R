# fresh file 
library(readxl)
gfg_data = read_excel("length_of_hospital_stay.xlsx")
gfg_data
summary(gfg_data)
mean(gfg_data$Value[gfg_data$SUBJECT == "ACUTE"])
mean(gfg_data$Value[gfg_data$SUBJECT == "CHILDBIRTH"])
