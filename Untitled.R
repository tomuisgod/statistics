library(readxl)
library(ggplot2)
library(stargazer)
library(moments)

data_str <- as.data.frame(read_xlsx("/Users/macbookpro/haha/oil.xlsx"))

str(data_str)
View(data_str)
# plot(data_str$oil)
plot(data_str$oil, data_str$gold,
     col = "red",
     pch = 20,
     main = "Oil vs Gold",
     xlab = "Oil",
     ylab = "Gold")
print("preslo")

ggplot(data = data_str, aes(x=t, y=oil, group=1)) +
  geom_line(color = "black")+
  theme_bw()+
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(),
        legend.title = element_blank(),
        legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  ggtitle("Oil price")
print("preslo")

stargazer(data_str, type = "text", title = "Descriptive statistics", 
          digit = 3, flip=TRUE)
print("preslo")

apply(data_str[,-1], 2, sd)
apply(data_str[,-1], 2, mean)
apply(data_str[,-1], 2, var)

# finding ?? for a single var
sd_value <- sd(data_str$oil)
mean_value <- mean(data_str$oil)
med <- median(data_str$oil)

# histrogram
hist(data_str$oil)

# shape of distribution
apply(data_str[,-1], 2, skewness)
apply(data_str[,-1], 2, kurtosis)
print("preslo")
