## Install mgcv package
install.packages("mgcv")
## Load mgcv package
library(mgcv)
x <- read.table(file = "design.txt", sep = "\t", header = TRUE)
colnames(x) <- LETTERS[1:ncol(x)]
unq <- numeric(length(combn(x, log2(nrow(x)), simplify = FALSE)))
cmb <- combn(x, log2(nrow(x)), simplify = FALSE)
for (i in 1:length(combn(x, log2(nrow(x)), simplify = FALSE))) {
  unq[i] <- nrow(uniquecombs(cmb[i]))
}
unq  # number of unique rows for each combination
full.fact <- cmb[unq == nrow(x)]  # full factorial in . . .
full.fact

## I added couple line to display the result
full.fact.alpha <- sapply(1:length(full.fact), function(x) colnames(full.fact[[x]]))
## Rotate and change to data frame
data.frame(t(full.fact.alpha))