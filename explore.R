library(packcircles)
library(ggplot2)

df <- read.csv("chart_df.csv", na.strings = c("N/A"))

max_lim <- 177.6398
min_lim <- -181.747

#data <- df[df$RevOrd==0, ]
data <- df

packing <- circleProgressiveLayout(data$Revenue, sizetype='area')
packing$radius <- 0.99 * packing$radius
data <- cbind(data, packing)

dat.gg <- circleLayoutVertices(packing, npoints=50)

data$id <- seq(1, nrow(data))
dat.gg <- merge(dat.gg, data[c('id', 'RevOrd', 'Sport')], by='id')

p <- ggplot() + 
  # Make the bubbles
  geom_polygon(data = dat.gg, aes(x, y, group=id, fill=Sport), colour = "#161616", alpha = 0.80) +
  scale_size_continuous(range=c(1,4)) +
  coord_equal()

p




p + facet_wrap(~RevOrd, ncol=3)


###### H
library(ggraph)
library(igraph)
library(tidyverse)