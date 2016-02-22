library(ggplot2)
library(dplyr)

# What I think is a useful graph:
move_by <- 1
df <- data.frame()
medians <- c(1:14)
for (i in seq(10,24,move_by)) {
  #print(i)
  arr_size <- 2 ** i
  iters <- 10000
  setwd("../data/.")
  fn <- paste(arr_size, "-", iters, ".csv", sep="")
  dat.0 <- read.csv(fn)
  dat.0 <- mutate(dat.0, i = 1:nrow(dat.0))
  df <- rbind(df, dat.0)
  
  ggplot(data=dat.0, aes(x = i, y= time, col = as.factor(arr_size))) +
    geom_point() + 
    coord_cartesian(ylim=c(0,900)) +
    ylab("time to retrieve a random element (nanoseconds)") + 
    xlab("iteration") +
    ggtitle("Retrieving a random element from arrays of various size")
  png_fn = paste(arr_size, "-", iters, ".pdf", sep="")
  ggsave(filename=png_fn)
  
  # for Eitan graph:
  medians[i-9] <- median(dat.0$time)
  print(median(dat.0$time))
}

# # geom_point and geom_smooth were also useful plots
# ggplot(data=df, aes(x = i, y= time, col = as.factor(arr_size))) +
#   geom_point() + 
#   coord_cartesian(ylim=c(0,900)) +
#   #ylim(0, 900) + #ignores elements outside of range
#   ylab("time to retrieve a random element (nanoseconds)") + 
#   xlab("iteration") +
#   ggtitle("Retrieving a random element from arrays of various size")
# ggsave(filename="aggregate_graph.pdf")

# What Eitan wants:
# assume df is filled
eitan_df <- data.frame(
  arr_size = c(10:24),
  medians = medians)
ggplot(data=eitan_df, aes(x = arr_size, y= medians, col = as.factor(arr_size))) + 
  geom_bar(stat="identity", aes(fill=as.factor(arr_size))) +
  ylab("time (nanoseconds)") + 
  xlab("Size of array (log_2 scale)") +
  ggtitle("Median time to retrieve a random element")
ggsave(filename="medians_bargraph.pdf")

ggplot(data=df, aes(x = arr_size, y= time, col = as.factor(arr_size))) +
  geom_boxplot() + 
  scale_x_log10() +
  coord_cartesian(ylim=c(200,300)) + 
  ylab("time (nanoseconds") +
  xlab("array size") +
  ggtitle("Time to retrieve random element")
ggsave(filename="boxplot.pdf")
