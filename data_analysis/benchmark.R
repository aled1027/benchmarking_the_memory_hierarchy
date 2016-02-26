library(ggplot2)
library(dplyr)

setwd("../tot_data/.")
image_prefix <- "../images/"

# load data, make individual graphs
df <- data.frame()
for (i in seq(3,24,1)) {
  fn <- paste(i, ".csv", sep="")
  dat.0 <- read.csv(fn)
  dat.0 <- mutate(dat.0, i = 1:nrow(dat.0))
  dat.0$arr_size_lg2 <- rep(i, nrow(dat.0))
  df <- rbind(df, dat.0)
}

ggplot(data=df, aes(x = arr_size_lg2, y= time, col = as.factor(arr_size_lg2))) +
  geom_boxplot() + 
  coord_cartesian(ylim=c(85000000,100000000)) + 
  ylab("time (nanoseconds") +
  xlab("array size") +
  ggtitle("Time to retrieve random element")
fn <- paste(image_prefix, "tot_boxplot.png", sep="")
ggsave(filename=fn)

#### NOT RELEVANT ANYMORE ####
# 
# # Aggregate scatter plot
# ggplot(data=df, aes(x = i, y= time, col = as.factor(arr_size_lg2))) +
#   geom_point() + 
#   coord_cartesian(ylim=c(0,10)) +
#   ylab("time (nanoseconds)") + 
#   xlab("trial") +
#   ggtitle("Average latency for retrieving a random element")
# ggsave(filename="../images/aggregate_scatter_plot.png")

# # Plot for current_time_ns
# cur_time_dat <- read.csv("time_current_time.csv")
# ggplot(data=cur_time_dat, aes(x = i, y = time)) +
#   geom_boxplot() + 
#   ylab("time (nanoseconds)") + 
#   xlab("") +
#   ggtitle("Average latency for retrieving a random element")
# ggsave(filename="../images/current_time_boxplot.png")
# 
# # Plot for generate random element
# rand_ele_dat <- read.csv("gen_random_element.csv")
# ggplot(data=rand_ele_dat, aes(x = i, y = time)) +
#   geom_boxplot() + 
#   coord_cartesian(ylim=c(0,25)) +
#   ylab("time (nanoseconds)") + 
#   xlab("") +
#   ggtitle("Boxplot of time to generate a rand uint32_t (zoomed in)")
# ggsave(filename="../images/generate_random_boxplot.png")

