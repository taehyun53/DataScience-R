#p8
df <- data.frame(
  color = c("blue", "black", "blue", "blue", "black"),
  value = 1:5)

color = c("blue", "black", "blue", "blue", "black")
value = 1:5

cb <- cbind(color,value)

#p9
bnames_df <- read.csv("datafolder/bnames.csv.bz2", stringsAsFactors = F)
births_df <- read.csv("datafolder/births.csv", stringsAsFactors = F)
str(births_df)

bnames_df2 <- read.csv("datafolder/bnames.csv.bz2")
births_df2 <- read.csv("datafolder/births.csv", stringsAsFactors = T)
str(births_df2)

#p11
library(dplyr)
tbl <- tbl_df(df)
bnames <- tbl_df(bnames_df)
births <- tbl_df(births_df)
class(bnames)

class(bnames[,1])
class(bnames_df[,1])

class(bnames[,1:2])
class(bnames_df[,1:2])

class(bnames[1,1])
class(bnames_df[1,1])

#p17
filter(tbl,color=="blue")
# base R
tbl[tbl$color=="blue",]

#p18
filter(df, value %in% c(1, 4))
# base R
df[df$value %in% c(1,4),]

#p20
vivian = filter(bnames, name == "Vivian")
vivian2 = filter(bnames, soundex == "V150")

unique(vivian2$name)

#p21
filter(bnames, sex == "girl", year == 1900 | year == 2000)
filter(bnames, sex == "girl", year %in% c(1900,2000)) # same
filter(bnames, sex == "girl", year == c(1900,2000)) # not same 
filter(bnames, sex == "girl" & year == 1900 | year == 2000) # not same
filter(bnames, sex == "girl" & (year == 1900 | year == 2000) ) # same

#p22
filter(bnames,year>2000,prop>0.01)
filter(bnames,prop>0.01,year>2000)


filter(bnames,year>"2000",prop>"0.01")

#poll 
filter(bnames, year == 2005, prop>0.01, sex=="boy")

#p25
select(tbl,color)
#p26
select(tbl,-color)

#p29
select(bnames, soundex)
select(bnames, starts_with("sound"))
select(bnames, ends_with("ex"))
select(bnames, one_of("sex","soundex"))
select(bnames, matches("soundex"))


#p30
select(bnames, firstnames = name)
rename(bnames, firstnames = name)

bnames2 = rename(bnames, firstnames = name)

bnames2$soundex2 = bnames2$soundex

#p33
head(bnames[bnames$year == 1900, c('name', 'sex')], 100)

# dplyr with piping
bnames %>% 
  filter(year == 1900) %>% 
  select(name, sex) %>% 
  head(100)

# dplyr without piping
head(select(filter(bnames,year==1900),one_of("name","sex")),100)

#poll
bnames %>% filter(year==2000,prop>0.01)%>%select(name)
bnames %>% select(name) %>% filter(year==2000,prop>0.01)

#p35
df1 <- data.frame(color = c(4,1,5,3,2),
                  value = 1:5)
df1 %>% 
  arrange(color)
arrange(df1,color)

#p36
df_order <- order(df1$color) #Returns the indices for ascending order.
df1[df_order,]

df1[order(df1$color),] # one line execution
df1[,order(df1$color)] # column wise will cause error


#p37
arrange(df1,desc(color))
df1 %>%
  arrange(desc(color))

#p38
bnames %>%
  arrange(desc(prop))

#p39
bnames %>%
  filter(name == "Vivian") %>%
  arrange(desc(prop))

#p43
tbl %>% mutate(double = 2*value)
tbl %>% mutate(double <- 2*value)


tbl %>% 
  mutate(double = 2 * value, quadruple = 4 * value)

#P45
tbl %>% transmute(double = 2 * value, quadruple = 4 * value)

#p48
tbl %>% summarize(total = sum(value))
tbl %>% summarize(total = sum(value), avg = mean(value))

tbl %>% summarize(total = sum(value), avg = mean(value)) %>% pull()
tbl %>% summarize(total = sum(value), avg = mean(value)) %>% pull(1)
tbl %>% summarize(total = sum(value), avg = mean(value)) %>% pull(2)


#p52
vivian %>%
  mutate(percentage = prop *100) %>%
  summarise(min = min(prop), mean =mean(prop), max=max(prop)) -> v1
pull(v1)
pull(v1,2)



v1 = vivian %>%
  mutate(percentage = prop *100) %>%
  summarise(min = min(prop), mean =mean(prop), max=max(prop)) 


#p61
x <- data.frame(
  name = c("John", "Paul", "George", "Ringo", "Stuart", "Pete"),
  instrument = c("guitar", "bass", "guitar", "drums", "bass",
                 "drums"))
y <- data.frame(
  name = c("John", "Paul", "George", "Ringo", "Brian"),
  band = c("TRUE", "TRUE", "TRUE", "TRUE", "FALSE"))

#p63
x %>% left_join(y, by = "name") 
#p64
x %>% inner_join(y, by = "name")
x %>% semi_join(y, by = "name")
x %>% anti_join(y, by = "name")

x %>% left_join(y, by = "name") %>%
  filter( !is.na(band) )

#p68
bnames %>% 
  left_join(births, by = c("year","sex"))

# left join equal to inner in this example
bnames %>% 
  inner_join(births, by = c("year","sex"))


# this will not work
bnames %>% 
  left_join(births, by = c("year"))

bnames %>% 
  inner_join(births, by = c("year","sex")) %>%
  mutate( n = round(prop*births)) -> bnames2

#p73
bnames2 %>% 
  filter(name == "Vivian") %>%
  summarize(total = sum(n))

#p76
tbl %>% summarise((total =sum(value)))


tbl %>% 
  group_by(color) %>%
  summarise((total =sum(value)))


#p79
bnames2 %>% 
  group_by(name) %>% 
  summarize(total = sum(n)) -> totals


bnames2 %>% 
  group_by(sex) %>% 
  summarize(total = sum(n)) -> totals2


bnames2 %>%
  group_by(name, sex)


#p81
bnames2 %>% 
  group_by(name) %>% 
  group_by(sex)

# gives same results
bnames2 %>% 
  group_by(sex)

#p82
bnames2 %>% 
  group_by(name, sex) %>% 
  summarise(total = sum(n)) -> totals2
head(totals2)


#p83
bnames %>%
  group_by(name, sex) -> bnames_grpd

bnames_grpd %>%
  ungroup()

#p85
bnames2 %>%
  group_by(soundex) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total)) %>%
  filter( row_number() ==1) %>%
  pull(1)

#p89
bnames2 %>%
  filter(soundex == "J500") %>%
  select(name) %>%
  distinct()
    
bnames2 %>%
  filter(soundex == "J500") %>%
  select(name) %>%
  unique()

#p90
bnames2 %>% 
  group_by(soundex) %>% 
  summarise(total = sum(n)) %>%
  arrange(desc(total)) %>% 
  filter(row_number() == 1) %>%
  select(soundex) %>%
  left_join(bnames) %>%
  select(name) %>%
  unique()

#p94
bnames2 %>%
  group_by(year, sex) %>%
  summarize(total = sum(n))

#p96
bnames2 %>%
  group_by(year,sex) %>%
  mutate( ranking = rank(desc(n)))

# same answer but longer time
# understand construct of your data set
bnames2 %>%
  group_by(year,sex,name) %>%
  mutate( ranking = rank(desc(n))) %>%
  summarize(total =sum(n)) %>%
  mutate(ranking = rank(desc(total))) %>%
  arrange(year,sex,ranking)


#p98
bnames2 %>%
  group_by(year,sex) %>%
  mutate( rank = rank(desc(n))) %>%
  filter( rank == 1) %>%
  ungroup() %>%
  select(name) %>%
  distinct()

#p101
bnames2 %>% 
  group_by(year, sex) %>%
  mutate(rank = rank(desc(n))) %>%
  filter(rank == 1) %>%
  group_by(name) %>%
  summarize( count =  n()) %>%
  arrange( desc(count))

bnames2 %>% 
  group_by(year, sex) %>%
  mutate(rank = rank(desc(n))) %>%
  filter(rank == 1) %>%
  group_by(name) %>%
  summarize(count = sum(rank)) %>%
  arrange( desc(count))


# compare
bnames %>%
  group_by(name,sex)


bnames %>%
  group_by(sex,name)

# p105
bnames2 %>%
  select(-soundex) %>% # Drop soundex column
  group_by(name, sex) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total))

# compare with
bnames2 %>%
  select(-soundex) %>% 
  group_by(sex, name) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total))

#p107
bnames2 %>%
  select(-soundex) %>% # Drop soundex column
  group_by(name, sex) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total)) %>%
  summarize(total2 = sum(total))

# compare with
bnames2 %>%
  select(-soundex) %>% 
  group_by(sex, name) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total)) %>%
  summarise(total2 = sum(total))


#p108
bnames2 %>%
  select(-soundex) %>% # Drop soundex column
  group_by(name, sex) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total)) %>%
  summarize(total2 = sum(total)) %>%
  summarize(total3 = sum(total2))

# compare with
bnames2 %>%
  select(-soundex) %>% 
  group_by(sex, name) %>%
  summarise(total = sum(n)) %>%
  arrange(desc(total)) %>%
  summarise(total2 = sum(total)) %>%
  summarize(total3 = sum(total2))

