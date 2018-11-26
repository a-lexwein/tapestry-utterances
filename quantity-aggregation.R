hours <- readr::read_csv("timeline-playground/hours-Table 1.csv") %>%
  mutate(by = TRUE)

too_little_agg <- series %>%
  mutate(by = TRUE) %>%
  left_join(hours) %>%
  mutate(value = hour_value * value,
         time_hour = date + lubridate::dhours(hour)) %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = times_hour,
             y = value,
             color = key)) +
  geom_line()


too_much_agg <- 1
  
series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  mutate(month = lubridate::floor_date(date, "month")) %>%
  group_by(month, key) %>%
  summarise(value = sum(value)) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = month,
             y = value,
             color = key)) +
  geom_line()
