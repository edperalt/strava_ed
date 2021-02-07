library(ggplot2)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)
library(patchwork)
world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

world_points<- st_centroid(world)
world_points <- cbind(world, st_coordinates(st_centroid(world$geometry)))



p1<-
    ggplot(data = world) +
      geom_sf()+
      geom_path(data = data_ed,
                aes(lon, lat, group = id),
        alpha = 0.9,
        size = 2,
        lineend = "round",
        color = "red"
      )
      # coord_sf(xlim = c(-102.15, -74.12), ylim = c(7.65, 33.97), expand = FALSE)


p2 <-
  ggplot(data = world) +
  geom_sf()+
  geom_path(data = data_ed,
            aes(lon, lat, group = id),
            alpha = 0.8,
            size = 0.5,
            lineend = "round",
            color = "red"
            ) +
  geom_text(data= world_points,aes(x=X, y=Y, label=name),
            color = "darkblue", fontface = "bold", check_overlap = FALSE)+
  coord_sf(xlim = c(103.85, 103.875), ylim = c(1.275, 1.3), expand = FALSE)+
  annotate(geom = "text", x= 103.86 , y = 1.29 , label= "Singapur", size =  3, color = "blue", angle = 35)+theme_bw()+
  theme(axis.title = element_blank(),
        axis.text = element_blank())

p1 + inset_element(p2, left = 0.7, bottom = 0.55, right = 0.9, top = 0.75)
