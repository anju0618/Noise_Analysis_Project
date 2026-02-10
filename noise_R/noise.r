library(tidyverse)
library(lubridate)
library(gridExtra)

df <- read_csv("noise_log_202207.csv", show_col_types = FALSE)


df_processed <- df %>%
  mutate(
    timestamp = parse_date_time(timestamp, orders = c("ymd HMS", "ymd HM", "Ymd HMS", "Ymd HM")),
    hour = hour(timestamp),
    is_anomaly = if_else(db_level > 70, "Anomaly", "Normal")
  ) %>%
  filter(!is.na(timestamp))

# plot

p1 <- ggplot(df_processed, aes(x = timestamp, y = db_level)) +
  geom_line(color = "steelblue", alpha = 0.6) +
  geom_point(data = subset(df_processed, db_level > 70), 
             color = "red", size = 1.5) +
  labs(title = "Noise Level Monitoring: July 2022 (R Version)",
       y = "Noise Level (dB)", x = "") +
  theme_minimal()


p2 <- ggplot(df_processed, aes(x = factor(hour), y = db_level, fill = factor(hour))) +
  geom_boxplot(outlier.colour = "red", outlier.shape = 1, show.legend = FALSE) +
  geom_hline(yintercept = 70, color = "red", linetype = "dashed") +

  scale_fill_hue() + 
  labs(title = "Hourly Noise Distribution",
       x = "Hour of Day (0-23)", y = "Noise Level (dB)") +
  theme_minimal()


p_combined <- grid.arrange(p1, p2, nrow = 2)
ggsave("noise_analysis_report_R.png", p_combined, width = 12, height = 10, dpi = 300)
