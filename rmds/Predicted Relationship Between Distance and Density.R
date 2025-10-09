#run after elk example
#predicted plots look identical to raw data plots? Why?

library(sjPlot)
library(ggplot2)
library(grid)

sjPlot::plot_model(top_model, type = "pred", terms = "distance") +
  # Raw data points
  geom_point(
    data = data_elk,
    aes(x = distance, y = density),
    inherit.aes = FALSE,
    alpha = 0.5,
    size = 2,
    color = "black"
  ) +
  # Rug ticks
  geom_rug(
    data = data_elk,
    aes(x = distance),
    inherit.aes = FALSE,
    sides = "b",
    alpha = 0.4,
    length = unit(0.02, "npc"),
    color = "gray40"
  ) +
  theme_classic() +
  labs(
    x = "Distance",
    y = "Predicted Density",
    title = "Predicted Relationship Between Distance and Density",
    subtitle = "With raw data points and rug plot"
  )
