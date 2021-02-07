library(ggplot2)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)


ggplot(data = world) +
  geom_sf()+
  geom_path(data = data_ed,
            aes(lon, lat, group = id),
    alpha = 0.9,
    size = 2,
    lineend = "round",
    color = "red"
  ) +
  coord_sf(xlim = c(-102.15, -74.12), ylim = c(7.65, 33.97), expand = FALSE)
