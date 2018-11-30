library(readr)
library(dplyr)
library(ggplot2)

series <- readr::read_csv("timeline-playground/series-Table 1.csv") %>%
  tidyr::gather(key, value, -date)

just_right <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
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
