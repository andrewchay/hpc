N <- 100
p <- numeric(N)
n <- 100
for (i in 1:N) {
  x <- rnorm(n)
  y <- rnorm(n, sd=3)
  p[i] <- t.test(x, y, var.equal=TRUE)$p.value
}
id <- commandArgs(TRUE)
filename <- paste("sim", id[1], ".RData", sep="")
save(p, file=filename)
save.image(file = filename)