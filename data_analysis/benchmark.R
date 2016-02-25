library(ggplot2)
library(dplyr)

setwd("../data/.")
image_prefix <- "../images/"

# load data, make individual graphs
df <- data.frame()
for (j in seq(10,24,1)) {
  #print(i)
  arr_size <- 2 ** j
  iters <- 1000000
  fn <- paste(arr_size, "-1000000", ".csv", sep="")
  dat.0 <- read.csv(fn)
  dat.0 <- mutate(dat.0, i = 1:nrow(dat.0))
  dat.0$arr_size_lg2 <- rep(j, nrow(dat.0))
  df <- rbind(df, dat.0)
  title <- paste("Average latency for retrieving a random element; array size = 2**", j, sep='')
  
  ggplot(data=dat.0, aes(x = i, y= time)) +
    geom_point() + 
    coord_cartesian(ylim=c(0,10)) +
    ylab("time (nanoseconds)") + 
    xlab("trial") +
    ggtitle(title)
  fn = paste(image_prefix, j, ".png", sep="")
  ggsave(filename=fn)
}

ggplot(data=df, aes(x = arr_size_lg2, y= time, col = as.factor(arr_size_lg2))) +
  geom_boxplot() + 
  coord_cartesian(ylim=c(0,10)) + 
  ylab("time (nanoseconds") +
  xlab("array size") +
  ggtitle("Time to retrieve random element")
ggsave(filename="../images/boxplot.png")

# Aggregate scatter plot
ggplot(data=df, aes(x = i, y= time, col = as.factor(arr_size_lg2))) +
  geom_point() + 
  coord_cartesian(ylim=c(0,10)) +
  ylab("time (nanoseconds)") + 
  xlab("trial") +
  ggtitle("Average latency for retrieving a random element")
ggsave(filename="../images/aggregate_scatter_plot.png")

# Plot for current_time_ns
cur_time_dat <- read.csv("time_current_time.csv")
ggplot(data=cur_time_dat, aes(x = i, y = time)) +
  geom_boxplot() + 
  ylab("time (nanoseconds)") + 
  xlab("") +
  ggtitle("Average latency for retrieving a random element")
ggsave(filename="../images/current_time_boxplot.png")

# Plot for generate random element
rand_ele_dat <- read.csv("gen_random_element.csv")
ggplot(data=rand_ele_dat, aes(x = i, y = time)) +
  geom_boxplot() + 
  coord_cartesian(ylim=c(0,25)) +
  ylab("time (nanoseconds)") + 
  xlab("") +
  ggtitle("Boxplot of time to generate a rand uint32_t (zoomed in)")
ggsave(filename="../images/random_element_boxplot.png")

