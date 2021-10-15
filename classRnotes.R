set.seed(0)
for (i in 1:4) {
  assign(str_c("x",i), rbinom(10,1,.5))
}

xx = matrix(nrow=4, ncol=10)
for(i in 1:4) {
  xx[i,] = rbinom(10,1,.5)
}

seuss <- c("Sam", "I", "am")
str_c(seuss, collapse = "-")
str_c("Sam", "I", "am", sep = "-")

n <- 1:20
xvar <- str_c('x', n)
right <- paste(xvar, collapse = " + ")
left <- 'y~'
form <- str_c(left, right)
form

str_c(seuss, collapse = "-")
str_c(seuss, sep = "-")

str_c("Sam", "I", "am", collapse = "-")
str_c("Sam", "I", "am", sep = "-")

grep("p1",fruit) #str_which
grepl #str_detect

sub # str_replace
qsub # str_replace_all

str_split("To be, or not to be", "")

lisg1 <- str_split(c("abc", "byz"), "")
lisg1[[2]][3]


date1 = '1989-05-12'
date1 = as.Date(date1)


dates = seq(date1, length=20, by='day')
format(dates, '%w')

weekdays(dates)

time1 = ISOdatetime(2011,1,1,0,0,0)
time1
rtimes = ISOdatetime(2013, rep(4:5,5), sample(30,10), 0, 0, 0)
rtimes

dates = seq(date1, length = 4, by = 'day')
format(dates, '%w')

table1 %>%
  group_by(country)

table2
spread(table2, key=type, value=count)
