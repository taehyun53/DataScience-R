
#p9
plot(iris$Sepal.Width,iris$Sepal.Length)
r1 <- lm(iris$Sepal.Length ~ iris$Sepal.Width)
abline(r1)
r2 <- lm(iris[1:50,]$Sepal.Length ~ iris[1:50,]$Sepal.Width)
abline(r2)

#P31
g <- ggplot(data=mpg,aes(x=displ,y=hwy))
g + geom_point()

# both the same
ggplot(mpg,aes(displ,hwy))+geom_point()
ggplot(mpg)+geom_point(aes(displ,hwy))

# not the same
ggplot(mpg)+geom_point(aes(displ,hwy),color="red")
ggplot(mpg,aes(displ,hwy),color="red")+geom_point()
ggplot(mpg,aes(displ,hwy,color="red"))+geom_point()

#pll
ggplot() + geom_point(mpg,aes(displ,hwy))

#p32
g + geom_point() + geom_smooth(method = "lm")
g + geom_point() + geom_smooth(method = "lm",level=.99)

g + geom_point() + geom_smooth(method = "loess")


#p37
g + geom_point(aes(color = class))
ggplot(mpg,aes(displ,hwy))+geom_point(aes(color=class))

g + geom_point(aes(size = class))
g + geom_point(aes(shape = class))

g + geom_point(aes(color = class,size=5))
g + geom_point(aes(color = class,size=5)) +
  guides(size=FALSE)

g + geom_point(aes(color = class),shape=15)

#p42
g + geom_point() + facet_grid(. ~ cyl)
g + geom_point() + facet_grid( ~ cyl)
g + geom_point() + facet_grid(drv ~.)
g + geom_point() + facet_grid(drv ~ .)
g + geom_point() + facet_grid(drv ~ cyl)
g + geom_point() + facet_wrap( ~ class)
g + geom_point() + facet_wrap(drv ~ cyl)

#p46
g + geom_point() + geom_smooth(se = FALSE) # Turn off 
g + geom_smooth(se = FALSE) + geom_point()

#p48
g <- ggplot(data = mpg, aes(x = class, y = hwy))
g + geom_boxplot()

#p58
g <- ggplot(mpg, aes(x = reorder(class, hwy), y = hwy))
g + geom_boxplot()

#p61
g <- ggplot(mpg, aes(reorder(class,hwy,median),hwy))
g + geom_boxplot()

g <- ggplot(mpg, aes(reorder(class,hwy,FUN=median),hwy))
g + geom_boxplot()
