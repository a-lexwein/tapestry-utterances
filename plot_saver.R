timeline_plot_saver <- function(gg) {
  name <- paste0("charts/timeline-", deparse(substitute(gg)), ".png")
  ggsave(name, gg, dpi = "retina", height = 3.8 * 1.6, width = 8.3 * 1.6)
}

timeline_plot_saver(step1)
timeline_plot_saver(step2)
timeline_plot_saver(step3)
timeline_plot_saver(step4)
timeline_plot_saver(step5)

ggsave("charts/just_right.png", just_right, dpi = "retina", height = 3.8, width = 6)
