library(ggplot2)
library(dplyr)

for (i in 10:24) {
  arr_size <- 2 ** i
  iters <- 1000
  setwd("../data/.")
  fn <- paste(arr_size, "-", iters, ".csv", sep="")
  dat.0 <- read.csv(fn)
  dat.0 <- mutate(dat.0, i = 1:nrow(dat.0))
  qplot(i, time, data = dat.0,
        xlab = "iteration number", ylab = "time to retrieve a random element",
        main = paste("Retrieveing a random element: arr_size = 2^", i, "and iters = ", iters, sep=''))
  png_fn = paste(arr_size, "-", iters, ".png", sep="")
  ggsave(filename=png_fn)
}

df <- data.frame()
for (i in 10:24) {
  arr_size <- 2 ** i
  iters <- 1000
  setwd("../data/.")
  fn <- paste(arr_size, "-", iters, ".csv", sep="")
  dat.0 <- read.csv(fn)
  dat.0 <- mutate(dat.0, i = 1:nrow(dat.0))
  df <- rbind(df, dat.0)
  qplot(i, time, data = dat.0,
        xlab = "Time to retrieve a random element", ylab = "iteration number",
        main = paste("Retrieveing a random element: arr_size = 2^", i, "and iters = ", iters, sep=''))
  png_fn = paste(arr_size, "-", iters, ".png", sep="")
  ggsave(filename=png_fn)
}

ggplot(data=df, aes(x = i, y= time, col = as.factor(arr_size))) + geom_point() + ylim(0, 900)
