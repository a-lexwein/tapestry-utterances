events %>%
  ggplot(aes(x = date, y = row_number(date), label = event)) +
  geom_line() + geom_label() 

geom_rect(data = plan,
          aes(
            xmin = start,
            xmax = end,
            ymin = row,
            ymax = row + .5)
) +
  geom_rect(data = reality,
            aes(
              xmin = start,
              xmax = end,
              ymin = row,
              ymax = row + .5)
  )


# geom_rect(color = "#F0F921FF") +
# geom_text(size = 3) +

annotate("text", x = as.Date('2013-06-11'), y = 3.1, label = "Former Future Linguist", hjust = 1, color = "#F0F921FF") +
  annotate("text", x = as.Date('2013-06-01'), y = 3.1, label = "Future Linguist", hjust = 1) +
  scale_fill_manual(values = c("gray", "orange")) +
  theme(axis.text.y = element_blank(),
        axis.title = element_blank(),
        legend.position = "none")


# set window first
# clip to so current rects go into the future
# pick a good color for What if.
# make bootcamp label better
# try to increment
# overlay chart images.



## plan geoms
step2_0 <- step1 + geom_rect(
  data = filter(plan, role == "Phd Student"),
  aes(
    xmin = start,
    xmax = end,
    ymin = row,
    ymax = row + .5)
) +
  geom_text(data = plan, aes(x = start + (end - start)/2,
                             y = row + .25,
                             label = role))

step2_0 <- step1 + geom_rect(
  data = filter(plan, role == "Phd Student"),
  aes(
    xmin = start,
    xmax = end,
    ymin = row,
    ymax = row + .5)
) +
  geom_text(data = plan, aes(x = start + (end - start)/2,
                             y = row + .25,
                             label = role))



too_little_x <- series %>%
  filter(date >= as.Date("2018-10-01"),
         date <= as.Date("2018-10-25")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  geom_label(data = too_little_x_labs, aes(x = date,
                                           y = value,
                                           label = round(value,1),
                                           color = key))
too_much_x <- series %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  geom_label(data = too_much_x_labs, aes(x = date,
                                         y = value,
                                         label = round(value,1),
                                         color = key))


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
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product"))

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
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Profit") +  guides(color = guide_legend(title = "Product"))


relevance_2 <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  mutate(revenue = if_else(key == "b", value/8, value/15)) %>%
  ggplot(aes(x = date,
             y = revenue,
             color = key)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 13),
        plot.title = element_text(size = 22)) +
  ggtitle("FakeMart: Daily Revenue") +  guides(color = guide_legend(title = "Product"))

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

# just_right_labs <- series %>%
#   filter(date %in% just_right_lab_dates) %>%
#   filter(date >= as.Date("2018-10-01")) %>%
#   mutate(date_int = as.integer(date)) %>%
#   mutate(value = if_else(key == "a", value + 5, value - 5)) %>%
#   filter(key %in% c("a", "b"))

just_right <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("a", "b")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  geom_point(data = just_right_labs) +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank())

just_right


relevance_labs <- series %>%
  filter(date %in% just_right_lab_dates) %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("c"))

relevance <- series %>%
  filter(date >= as.Date("2018-10-01")) %>%
  filter(key %in% c("c", "d")) %>%
  ggplot(aes(x = date,
             y = value,
             color = key)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.title = element_blank()) +
  ggtitle("Daily Profit")

