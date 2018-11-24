library(tidyverse)
library(gganimate)

events <- read_csv("timeline-playground/events-Table 1.csv")
intervals <- read_csv("timeline-playground/intervals-Table 1.csv")



hues <- c()
hues$tapestry_label <- "#9C179EFF"
hues$plan <- viridis::plasma(5)[4]
hues$reality <- viridis::plasma(6)[3]


step1 <- intervals %>%
  filter(!is.na(start)) %>%
  ggplot(aes(xmin = start,
             xmax = end,
             ymin = row,
             ymax = row + .5,
             x = start + (end - start)/2,
             y = row + .25,
             label = role,
             fill = as.factor(row))) +
  coord_cartesian(xlim = c(as.Date("2006-09-01"), as.Date("2019-06-01")),
                  ylim = c(0,3.3)) +
  theme(axis.text.y = element_blank(),
        axis.title = element_blank(),
        legend.position = "none") +
  geom_vline(aes(xintercept = as.Date('2018-11-29')), color = hues$tapestry_label) +
  annotate("text", x = as.Date('2018-11-29'),
           y = 3.1,
           label = "Tapestry",
           color = hues$tapestry_label,
           hjust = 1.1,
           size = 5) +
  scale_x_date(date_breaks = "2 year", date_labels = "%b %Y")
  


plan <- intervals %>% filter(row == 2)
reality <- intervals %>% filter(row == 1)


step2 <- step1 +
  geom_rect(
    data =  filter(plan, role == "PhD Student"),
    fill = hues$plan, color = hues$tapestry_label,
    aes(
      xmin = start,
      xmax = end,
      ymin = row,
      ymax = row + .5)
  ) +
    geom_text(data = filter(plan, role == "PhD Student"),
              aes(x = start + (end - start)/2,
                  y = row + .25,
                  label = role)) +
  ggtitle("Future Linguist")

step3 <- step2 +
  geom_rect(
    data =  filter(plan, role == "Linguistics Professor"),
    fill = hues$plan, color = hues$tapestry_label,
    aes(
      xmin = start,
      xmax = end,
      ymin = row,
      ymax = row + .5)
  ) +
  geom_text(data = filter(plan, role == "Linguistics Professor"), aes(x = start + (end - start)/2,
                             y = row + .25,
                             label = role))

step4 <- step3 + 
  geom_rect(
    data = reality,
    fill = "#F0F921FF",
    color = hues$tapestry_label,
    aes(
      xmin = start,
      xmax = end,
      ymin = row,
      ymax = row + .5)
  ) +
  geom_text(data = reality, aes(x = start + (end - start)/2,
                             y = row + .25,
                             label = role)) +
  ggtitle("Former Future Linguist")
