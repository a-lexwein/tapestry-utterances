timeline_plot_saver <- function(gg) {
  name <- paste0("charts/timeline-", deparse(substitute(gg)), ".png")
  ggsave(name, gg, dpi = "retina", height = 3.8 * 1.6, width = 8.3 * 1.6)
}

timeline_plot_saver(step1)
timeline_plot_saver(step2)
timeline_plot_saver(step3)
timeline_plot_saver(step4)
timeline_plot_saver(step5)

grice_plot_saver <- function(gg) {
  name <- paste0("charts/", deparse(substitute(gg)), ".png")
  ggsave(name, gg, dpi = "retina", height = 3.8, width = 6)
}

grice_plot_saver(just_right)
grice_plot_saver(relevance_1)
grice_plot_saver(relevance_2)

grice_plot_saver(manner_reverse_x)

grice_plot_saver(quantity_too_much_series)
grice_plot_saver(quantity_too_little_series)

grice_plot_saver(quantity_too_much_x)
grice_plot_saver(quantity_too_little_x)

grice_plot_saver(quantity_too_little_label)
grice_plot_saver(quantity_too_much_label)

grice_plot_saver(quantity_too_little_agg)
grice_plot_saver(quantity_too_much_agg)
