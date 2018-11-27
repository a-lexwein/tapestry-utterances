# Chart of with time on the x and y axis
library(ggplot2)
library(dplyr)

series <- readr::read_csv("timeline-playground/series-Table 1.csv") %>%
  tidyr::gather(key, value, -date)

just_right_lab_dates <- c(as.Date("2018-10-01"),
                          as.Date("2018-11-29"))

too_little_x_lab_dates <- c(as.Date("2018-10-01"),
                          as.Date("2018-10-25"))

too_much_x_lab_dates <- c(as.Date("2018-09-07"),
                             as.Date("2018-11-29"))

just_right_labs <- series %>%
  filter(date %in% just_right_lab_dates) %>%
  filter(date >= as.Date("2018-10-01")) %>%
  mutate(date_int = as.integer(date)) %>%
  filter(key %in% c("a", "b"))

too_little_series_labs <- series %>%
  filter(date %in% just_right_lab_dates) %>%
  filter(date >= as.Date("2018-10-01")) %>%
  mutate(date_int = as.integer(date)) %>%
  filter(key %in% c("a"))

too_much_series_labs <- series %>%
  filter(date %in% just_right_lab_dates) %>%
  filter(date >= as.Date("2018-10-01")) %>%
  mutate(date_int = as.integer(date)) %>%
  filter(key %in% c("a", "b", "c", "d", "e"))

too_little_x_labs <- series %>%
  filter(date %in% too_little_x_lab_dates) %>%
  mutate(date_int = as.integer(date)) %>%
  filter(key %in% c("a", "b"))


too_much_x_labs <- series %>%
  filter(date %in% too_much_x_lab_dates) %>%
  mutate(date_int = as.integer(date)) %>%
  filter(key %in% c("a", "b"))


just_right <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  ggrepel::geom_label_repel(data = just_right_labs, aes(x = date,
                                        y = value,
                                        label = round(value,1),
                                        color = key))

too_little_series <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  ggrepel::geom_label_repel(data = too_little_series_labs, aes(x = date,
                                                        y = value,
                                                        label = round(value,1),
                                                        color = key))
too_much_series <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b", "c", "d", "e")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  ggrepel::geom_label_repel(data = too_much_series_labs, aes(x = date,
                                                        y = value,
                                                        label = round(value,1),
                                                        color = key))

too_little_x <- series %>%
  filter(date >= as.Date("2018-10-01"),
         date <= as.Date("2018-10-25")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  ggrepel::geom_label_repel(data = too_little_x_labs, aes(x = date,
                                                        y = value,
                                                        label = round(value,1),
                                                        color = key))
too_much_x <- series %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  ggrepel::geom_label_repel(data = too_much_x_labs, aes(x = date,
                                                          y = value,
                                                          label = round(value,1),
                                                          color = key))

too_little_label <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  theme(axis.text = element_blank())

too_much_label <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value, label = round(value,1))) +
  geom_line(aes(color =  key)) + ggrepel::geom_label_repel()


