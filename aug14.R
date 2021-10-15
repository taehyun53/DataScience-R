#p5
str_length(c("a", "NYC Data Science Academy", NA))

# base R
nchar(c("A","AB"))

a=1
b=23
v1=c(a,b)
x=1:5
str_length(v1)
str_length(x)

length(v1)
length(x)
length(c("a", "NYC Data Science Academy", NA))

#p6
str_c("x", "y")
str_c("x", "y", sep = ", ")

str_c("prefix-", c("a", "b", "c"), "-suffix")

# base R
paste("x","y")
paste0("x","y")



d=4
assign(f,6)
f=6

set.seed(0)
for (i in 1:4) {
  assign(str_c("x",i), rbinom(10, 1, .5))
}
x1; x2; x3; x4

xx = matrix(nrow=4,ncol=10)
for ( i in 1:4){
  xx[i,] = rbinom(10,1,.5)
}


color = c("blue","red","white")
value = 1:3

df = data.frame(
  color = c("blue","red","white"),
  value = 1:3
  
)
df


mymat = cbind(color,value)

#p8
seuss <- c("Sam", "I", "am")
str_c(seuss, collapse = "-")
str_c("a", c("b", "c", "d"), "e", sep = "t", collapse = ",")

str_c("Sam", "I", "am",sep="-") #same results as line 60

str_length(seuss)
str_length(str_c(seuss, collapse = "-"))

#p9
n <- 1:20
xvar <- str_c('x', n)
right <- paste(xvar, collapse = ' + ')
left <- 'y ~ '
form <- str_c(left, right)
form

right2=str_c(xvar,collapse = ' + ')
right == right2


# poll
xvar2 = str_c('x[',n,']')
right3 <- paste(xvar2, collapse = ' + ')

str_c(left,right3)

#p10
fruit <- c("apple", "bannana", "coconut", "date")
str_sub(fruit, start = 1, end = 2)

str_sub(fruit, 3, -1)
str_sub(fruit, -3, -1)

str_detect(fruit, "pl") 
str_which(fruit, "ban") 
str_which(fruit, "pl") 


str_count(fruit, "n")
str_count(fruit, "pl") 

#base R
grep("pl",fruit) #str_which
grepl("pl",fruit) #str_detect

which(1:10>3)
which(1:10%%2==1)
which("apple"%%2==1)
which("apple"<1)


#p13
str_replace(fruit, "a", "1")
str_replace_all(fruit, "a", "4")

# base R
sub("a","1",fruit) #str_replace
gsub("a","2",fruit) #str_replace_all

replace(fruit,1,"APPLE")

replace(fruit,c(1,4),c("APPLE","DATE"))

#p14
str_split("To be, or not to be", " ")
str_split("To be, or not to be", " ", simplify = T)

str_split("To be, or not to be", " ",n=4)

# base R
strsplit("To be, or not to be"," ")

df1 <- data.frame(
  region = c("west","east","east"),
  score1 = c(1,2,3)
)

split(df1$score1,df1$region)

#p15
str_split("To be, or not to be", "")

class("To be, or not to be")
class(str_split("To be, or not to be", ""))

str_split(c("abc", "byz"), "")
list1 = str_split(c("abc", "byz"), "")
list1[[2]][3]

#p19
str_detect("s","s")
str_detect("+","+")
str_detect("+","\\+")

#p20
str_detect("string",".")
str_detect("s",".")
str_detect("",".")
str_detect("+",".")

str_detect("string","[a]")
str_detect("string","[s]")

str_detect("string","[^s]")
str_detect("string","[^string]")

str_detect("price is $4.99","\\$")
str_detect("price is $4.99","\$")
str_detect("price is $4.99","[\\$]")

str_detect("string","[a]")
str_detect("string","[a|s]")

str_detect(c("grey","gray"),"gre|ay")
str_detect(c("grey","gray"),"gr(e|a)y")


str_detect("apple","(p)\\1")
str_detect("apple","(a)\\1")
str_detect("banana","(na)\\1")
str_detect("banana","(ba)\\1")

str_detect("123434abcabc","(34)\\1")


# p21
str_detect("apple","ap*")
str_detect("apple","ap+")
str_detect("apple","ap?")

str_detect("apple","ap*l")
str_detect("apple","ap+l")
str_detect("apple","ap?l")

str_detect("apple","ap{2}l")
str_detect("apple","ap{2,}l")
str_detect("apple","ap{2,3}l")
str_detect("apple","ap{3,4}l")

#p22
str_detect("apple","[:digit:]")
str_detect("apple","[:^digit:]")
str_detect("apple","[:upper:]")

str_detect("apple!!","[:punct:]")
str_detect("apple","[:graph:]")

#p31
Sys.time()
class(Sys.time())

attributes(Sys.time())
as.POSIXlt(Sys.time())
attributes(as.POSIXlt(Sys.time()))

as.numeric(as.Date("1970-01-01"))
as.numeric(as.Date("1970-01-02"))
as.numeric(as.Date("1969-12-31"))
as.numeric(as.Date("2021-08-14"))

#p32
date1 = '1989-05-04'
date1 = as.Date(date1)
class(date1)

date1 = '05/04/1989'
date1 = as.Date(date1, format='%m/%d/%Y')

date2 = '05-04/1989'
date2 = as.Date(date2, format='%m-%d/%Y')


date3 = '05-04/1989'
date3 = as.Date(date3, format='%M-%d/%Y')

#p35
dates = seq(date1, length=4, by='day')
format(dates, '%w')

weekdays(dates)

format(dates, '%w')
format(dates, '%d')
format(dates, '%m')
format(dates, '%y')
format(dates, '%Y')

seq(date1, length=4, by='week')
seq(date1, length=4, by='month')


#p36
time1 = '1989-05-04'
time1 = as.POSIXct(time1)

time1 = "2011-03-01 01:30:00"
time1 = as.POSIXct(time1, format="%Y-%m-%d %H:%M:%S")

#p37
time1 = ISOdatetime(2011,1,1,0,0,0)
rtimes = ISOdatetime(2013, rep(4:5,5), sample(30,10), 0, 0, 0)

#p38
library(xts)
x = 1:4
y = seq(as.Date('2001-01-01'), length=4, by='day')
date1 = xts(x, y)
View(xts)


#p39
value = coredata(date1)
coredata(date1) =2:5
time = index(date1)



#p40
x = 5:2
y = seq(as.Date('2001-01-02'), length=4, by='day')
date2 = xts(x, y)
date3 = cbind(date1, date2)

names(date3) = c('v1', 'v2')
date4 = rbind(date1, date2)


y2 = seq(as.Date('2001-01-05'),length=4,by='day')
date22=xts(x,y2)
date42 = rbind(date1,date22)

#p41
window(date4, start=as.Date("2001-01-04"))
window(date42, start=as.Date("2001-01-04"))

# different packages with same function name
stats::lag(date2) # lag that we want
dplyr::lag(date2) # not the lag we want

# TIDYr
#p13
table2
spread(table2,key=type,value=count)
pivot_wider(table2, names_from = type,values_from=count)


#p17
table4a
gather(table4a, key="year", value ="case", 2:3)

gather(table4a, key="year", value ="case", 1:2) # don't make sense

gather(table4a, key="year", value ="case", '1999','2000')
pivot_longer(table4a,c(2:3),names_to = "year",values_to="case")


View(iris)
myiris=gather(iris,key="attributes",value="measurements",1:4)
View(myiris)

gather(iris,key="attributes",value="measurements",'Sepal.Length',"Sepal.Width")

#poll - answer
pivot_wider(table2, names_from = type,values_from=count)


#p20
s1 = strsplit(table3$rate,split='/')
s2 = unlist(s1)
s3 = matrix(s2,ncol=length(table3$rate),nrow=2)
s4 = t(s3)
s5 = data.frame(s4)
s6 = cbind(table3[,-3],s5)
colnames(s6)[3:4] = c("case","population")

#p21
table3
separate(table3,rate,into=c("cases","population"),sep="/")

#p25
table5
unite(table5, "new", century, year, sep="")
unite(table5, "new", century, year)

unite(table5, "new", century, year, sep="",remove=F)

table5 %>% mutate( new = str_c(century,year))
table5 %>% mutate( new = str_c(century,year)) %>% select(country,new,rate)
table5 %>% transmute( new = str_c(century,year))

#p27
cpi = read.table("cpi2021aug.txt",sep="\t",header=T)
tidy1 = gather(cpi,key="month",value="cpis",2:13)

tidy1 %>% arrange(Year,month) -> tidy2
str(tidy2)
tidy2$month = factor(tidy2$month, levels= c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
str(tidy2)

tidy2 %>% arrange(Year,month) -> tidy3
tidy3 %>% filter( !is.na(cpis)) -> tidy4

