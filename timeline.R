library(readr)
library(dplyr)
library(ggplot2)

events <- read_csv("timeline-playground/events-Table 1.csv")
intervals <- read_csv("timeline-playground/intervals-Table 1.csv")



hues <- c()
hues$tapestry_label <- "#9C179EFF"
hues$plan <- viridis::plasma(5)[4]
hues$reality <- "#F0F921FF"


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
  coord_cartesian(xlim = c(as.Date("2007-09-01"), as.Date("2019-01-01")),
                  ylim = c(0,3.3)) +
  theme(axis.text.y = element_blank(),
        axis.title = element_blank(),
        axis.text = element_text(size = 17),
        legend.position = "none") +
  geom_vline(aes(xintercept = as.Date('2018-11-29')), color = hues$tapestry_label) +
  annotate("text", x = as.Date('2018-11-29'),
           y = 3.1,
           label = "Tapestry",
           color = hues$tapestry_label,
           hjust = 1.1,
           size = 7) +
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
                  label = role),
              size = 4.7) +
  annotate("text", x = as.Date('2009-01-01'),
           y = 3.1,
           label = "Plan",
           color = hues$plan,
           hjust = 0,
           size = 8)

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
                             label = role),
            size = 4.7)

reality_step <- filter(reality, role == "PhD Student")

step4 <- step3 + 
  geom_rect(
    data = reality_step,
    fill = hues$reality,
    color = hues$tapestry_label,
    aes(
      xmin = start,
      xmax = end,
      ymin = row,
      ymax = row + .5)
  ) +
  geom_text(data = reality_step, aes(x = start + (end - start)/2,
                             y = row + .25,
                             label = role),
            size = 4.7) +
  annotate("text", x = as.Date('2009-01-01'),
           y = 0.5,
           label = "Reality",
           color = hues$tapestry_label,
           hjust = 0,
           size = 8)

step5 <- step4 + 
  geom_rect(
    data = reality,
    fill = hues$reality,
    color = hues$tapestry_label,
    aes(
      xmin = start,
      xmax = end,
      ymin = row,
      ymax = row + .5)
  ) +
  geom_text(data = reality, aes(x = start + (end - start)/2,
                                     y = row + .25,
                                     label = role),
            size = 4.7)



