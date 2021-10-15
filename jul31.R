a=1
b=2
c=3

print(a)
print(b)
print(c)

y=101

m <- 1
n = 2
assign('c',3)

mystring = "hello world"
mystring2 = 'single'

#p36
people <- 5
bill <- 221.78
tax <- bill * 0.07 
tip <- bill * 0.18
total <- bill + tax + tip
costPP <- total/people

#p39
v1 <- c(0, 1, 1, 2, 3, 9)
v2 <- 10:1
v3 = c("Hello, World!", "I am an R user")

c(1, 2, 3, 4) + c(3, 4, 5, 6)
c(1, 2, 3, 4) - c(1, 2)
c(1, 2, 3, 4) - c(1,2,1,2)

#p40
c(1, 2, 3, 4) <= c(1, 5)
c(1, 2, 3, 4) <= c(1,5,1,5)

#P42
v2[v2>5]
v2>5

v2[10:1]
v2[c(3,3,5,5,5)]

#p43
data <- c('a','b','c','a','a','c','b','c')
fdata1 <- factor(data)
fdata2 <- factor(data, level = c('c','b','a')) 
fdata3 <- ordered(factor(data, level = c('c','b','a')))

#poll
collegeyear <- c("Fr","So","Jr","Sr","So","Jr","Fr")
f3 <- factor(collegeyear,level=c("Fr","So","Jr","Sr"),ordered=T)
f32 <- ordered(factor(collegeyear,level=c("Fr","So","Jr","sr")))

#p51
calc_area <- function(r){
  area <- pi * r^2
  return(area)
}
calc_area(4)

#p53
add_to_x <- function(y) {
  return(x + y)
}
add_to_x(10)
x=1

add_to_x2 <- function(y) {
  x= 10
  return(x + y)
}
add_to_x2(10)

#p54
rescale <- function(x) {
  xmin <- min(x)
  xmax <- max(x)
  rescaled_x <- (x - xmin)/(xmax - xmin)
  return(rescaled_x) 
}
rescale(0:10)

#p55
ConeVolume = function(r, h) {
  volume = pi * r^2 * (h / 3)
  return(volume)
}
ConeVolume(2,5)
ConeVolume(2,3,4)

#56
xyz <- function(x = 1, y, z = 1) {
  return(x * 100 + y * 10 + z)
}
xyz()
xyz(2)
xyz(,2)
xyz(y=3)
xyz(z=4,x=5,y=6)

#p57
x <- rnorm(1000, 2) 

#poll
#which of the following
#give youo 100 normal
#with mean=0 sd=1
rnorm(100)
rnorm(100,0)
rnorm(100,0,1)
all of the above

#p58
x <- c(27, 29, 23, 14, NA)
mean(x)
mean(x,na.rm=TRUE)

x <- c(27, 29, 23, 14, NULL)
mean(x)
length(x)

CPS1988<-read.csv("CPS1988.csv",header=T)

CPS1988[1,1]
CPS1988[1:10, c(2,4)] 

CPS1988[CPS1988$experience>12,]
CPS1988[, c('education', 'experience')]

#p69
college <- CPS1988[CPS1988$educ >= 12,]
mean(CPS1988[CPS1988$educ >= 12, 'wage'])

CPS1988$educPlusExper <- CPS1988$education + CPS1988$education
summary(CPS1988)

#P73
myVec <- 1:10 
myMat <- matrix(1:12, ncol = 3)
myDf <- CPS1988[1:10,]
myList <- list(myVec, myMat, myDf)
myList

namedList <- list(A=myVec, B=myMat, C=myDf)
namedList
namedList$D <- pi
namedList['E'] <- exp(1)

length(namedList)
namedList$D <- NULL
length(namedList)

#p79
num = 5
if (num %% 2 != 0) {
  cat(num, 'is odd')
}

#p80
num <- 4
if (num %% 2 != 0) {
  cat(num, 'is odd')
} else {
  cat(num, 'is even')
}

# not location of else
num <- 4
if (num %% 2 != 0) {
  cat(num, 'is odd')
} 
else {
  cat(num, 'is even')
}

#p82
num <- 1:6
ifelse(num %% 2 == 0,'even','odd')

set.seed(0)
age <- sample(0:100, 20, replace=TRUE)
res <- ifelse(age > 70, 'old', ifelse(age <= 30, 'young', 'mid'))
res

#p83
SDcalc <- function(x, type = 'sample') {
  x <- x[!is.na(x)]
  n <- length(x)
  mu <- mean(x)
  if (type == 'sample') {
    stdev <- sqrt(sum((x-mu)^2)/(n-1))
  }
  if (type == 'population') {
    stdev <- sqrt(sum((x-mu)^2)/(n))
  }
  return(stdev)
}

#p84
sign_data <- read.csv('TimesSquareSignage.csv', header=TRUE)
obs <- nrow(sign_data)
for (i in 1:obs) {
  if (is.na(sign_data$Width[i])) {
    cat('WARNING: Missing width for sign no.', i, '\n')
  }
}

#p86
i = 1
while (i <= obs) {
  if (is.na(sign_data$Width[i])) {
    cat('WARNING: Missing width for sign no.', i, '\n')
  }
  i = i + 1
}

#p88
i=1
nas = which(is.na(sign_data$Width))
while (i < 6) {
  cat('WARNING: Missing width for sign no.', nas[i], '\n')
  i = i + 1
  if (i > 5) {
    cat('WARNING: Turned up more than 5 missing values')
  }
}

#p90
i = 1
j = 1
repeat {
  if (is.na(sign_data$Width[i])) {
    cat('WARNING: Missing width for sign no.', i, '\n')
    j = j + 1
  }
  if (j > 5) {
    cat('WARNING: Encountered more than 5 missing values')
    break
  }
  i = i + 1
  if (i > nrow(sign_data)) {
    break
  }
}

#p92
findprime <- function(x) {
  if (x %in% c(2, 3, 5, 7)) return(TRUE)
  if (x %% 2 == 0 | x == 1) return(FALSE)
  xsqrt <- round(sqrt(x))
  xseq <- seq(from = 3, to = xsqrt, by = 2)
  if (all(x %% xseq != 0)) return(TRUE)
  else return(FALSE)
}

#p93
system.time({
  x1 <- c()
  for (i in 1:1e6) {
    x1[i] <- findprime(i)
  }
})

#p94
system.time({
  x2 = logical(1e4)
  for (i in 1:1e4) {
    x2[i] = findprime(i)
  }
})

#p95
system.time({
  sapply(1:1e4, findprime)
})

#p99
form <- CPS1988$wage ~ CPS1988$experience
# regression linear
lm(form)
# (wage) = 481.151 + 6.735x(experience)
form2 <- CPS1988$wage ~ CPS1988$experience +CPS1988$education
lm(form2)
# (wage) = -385.08 + 10.61x(exper) + 60.90x(educ)

# for more details of the regression model
#use summary function
summary(lm(form2))

