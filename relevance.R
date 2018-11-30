relevance_1 <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("c", "d")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        legend.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product")) +
  scale_color_manual(values = c("darkgreen", "purple"))


relevance_2 <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  mutate(revenue = if_else(key == "b", value * 3.5, value * 2)) %>%
  ggplot(aes(x = date,
             y = revenue,
             color = key)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        legend.text = element_text(size = 13),
        axis.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Revenue") +  guides(color = guide_legend(title = "Product"))
