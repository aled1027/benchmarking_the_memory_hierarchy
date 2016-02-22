library(ggplot2)
library(dplyr)

setwd("../data/.")
df <- data.frame()

# load data, make individual graphs
for (j in seq(10,24,1)) {
  #print(i)
  arr_size <- 2 ** j
  iters <- 10000
  
  fn <- paste(arr_size, "-", iters, ".csv", sep="")
  dat.0 <- read.csv(fn)
  dat.0 <- mutate(dat.0, i = 1:nrow(dat.0))
  dat.0$arr_size_lg2 <- rep(j, iters)
  df <- rbind(df, dat.0)
  
  ggplot(data=dat.0, aes(x = i, y= time)) +
    geom_point() + 
    coord_cartesian(ylim=c(180,300)) +
    ylab("time to retrieve a random element (nanoseconds)") + 
    xlab("iteration") +
    ggtitle("Retrieving a random element")
  fn = paste(arr_size, "-", iters, ".png", sep="")
  ggsave(filename=fn)
}

ggplot(data=df, aes(x = arr_size_lg2, y= time, col = as.factor(arr_size_lg2))) +
  geom_boxplot() + 
  coord_cartesian(ylim=c(180,300)) + 
  ylab("time (nanoseconds") +
  xlab("array size") +
  ggtitle("Time to retrieve random element")
ggsave(filename="boxplot.png")


# Aggregate scatter plot
ggplot(data=df, aes(x = i, y= time, col = as.factor(arr_size_lg2))) +
  geom_point() + 
  coord_cartesian(ylim=c(180,300)) +
  ylab("time to retrieve a random element (nanoseconds)") + 
  xlab("iteration") +
  ggtitle("Retrieving a random element from arrays of various size")
ggsave(filename="aggregate_scatter_plot.png")
