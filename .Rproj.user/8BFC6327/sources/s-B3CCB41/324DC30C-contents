back_to_date <- function(int) {
  as.Date(int, origin = "1970-01-01", format = "")
}

reverse_x <- series %>%
  mutate(date_int = as.integer(date)) %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date_int,
             y = value,
             color = key)) +
  geom_line() +
  ggrepel::geom_label_repel(data = just_right_labs,
                            aes(x = date_int,
                                y = value,
                                label = round(value,1),
                                color = key)) +
  scale_x_reverse(labels = back_to_date, name = "date")
  