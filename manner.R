back_to_date <- function(int) {
  ## what the eff am I supposed to use besides stamp?
  lubridate::stamp_date("Nov 1")(lubridate::as_date(int, origin = lubridate::origin))
}

breaks <- c(as.Date("2018-10-01"),
            as.Date("2018-10-15"),
            as.Date("2018-11-01"),
            as.Date("2018-11-15"),
            as.Date("2018-12-01")) %>%
  purrr::map_int(as.integer)

manner_reverse_x <- series %>%
  mutate(date_int = as.integer(date)) %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date_int,
             y = value,
             color = key)) +
  geom_line() +
  scale_x_reverse(labels = back_to_date, breaks = breaks) +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        legend.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product"))
