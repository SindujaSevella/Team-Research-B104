
t_test_result <- t.test(`Solar (terawatt-hours)` ~ Entity, data = ds)


print(t_test_result)

group_summary <- aggregate(
  `Solar (terawatt-hours)` ~ Entity,
  data = ds,
