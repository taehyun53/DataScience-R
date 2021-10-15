sign_data <- read.csv("TimesSquareSignage.csv", header=T)
obs <- nrow(sign_data)
for (i in 1:obs) {
  if (is.na(sign_data$width[i])) {
    cat('Warning: Missing width for sign no', i, '\n')
  }
}

