quantity_too_little_series <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        legend.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product"))

quantity_too_much_series <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b", "c", "d", "e")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        legend.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product"))


quantity_too_little_x <- series %>%
  filter(date >= as.Date("2018-10-01"),
         date <= as.Date("2018-10-25")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        legend.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  geom_line() +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product"))

quantity_too_much_x <- series %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  scale_y_continuous(labels = scales::dollar) +
  scale_x_date(date_labels = "%b %d") +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        legend.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  geom_line() +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product"))



quantity_too_little_label <- just_right +
  theme(axis.text = element_blank())

quantity_too_much_label <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key,
             label = round(value,2))) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        legend.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Profit") + 
  guides(color = guide_legend(title = "Product")) +
  ggrepel::geom_label_repel(show.legend = FALSE, segment.color = "gray", size = 2.5)

