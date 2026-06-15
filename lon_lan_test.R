library(maps)
library(ggplot2)
library(gganimate)
library(denguedatahub)

world <- data("world_annual")

p <- ggplot() +
  geom_polygon(
    data = world,
    aes(long, lat, group = group),
    fill = "grey95",
    colour = "grey80"
  ) +
  geom_point(
    data = world,
    aes(
      longitude,
      latitude,
      size = cases,
      colour = cases
    ),
    alpha = 0.7
  ) +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

