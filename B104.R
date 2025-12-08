
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

group_summary <- aggregate(
  `Solar (terawatt-hours)` ~ Entity,
  data = ds,
  FUN = function(x) c(mean = mean(x), sd = sd(x), n = length(x))
)
print(group_summary)
ggplot(ds, aes(x = Year,
               y = Solar (terawatt-hours),
               colour = Entity,
               group = Entity)) +
  geom_line() +
  labs(
    title = "Solar Electricity Generation Over Time\nEurope vs Asia Pacific",
    x = "Year",
    y = "Solar Electricity Generation (TWh)",
    colour = "Region"
  ) +
  theme_minimal()

ggplot(ds, aes(x = `Solar (terawatt-hours)`)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ Entity, nrow = 2) +
  labs(
    title = "Histograms of Solar Electricity Generation by Region",
    x = "Solar Electricity Generation (TWh)",
    y = "Frequency"
  ) +
  theme_minimal()
