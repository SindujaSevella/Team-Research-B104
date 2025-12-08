
library(ggplot2)

data <- read.csv("modern-renewable-energy-consumption.csv",
                 check.names = FALSE)   


ds <- subset(
  data,
  Entity %in% c("Europe", "Asia Pacific") &
    !is.na(`Solar (terawatt-hours)`)
)
t_test_result <- t.test(`Solar (terawatt-hours)` ~ Entity, data = ds)


print(t_test_result)
