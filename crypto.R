library(readxl)
library(ggplot2)
library(stargazer)
library(moments)

data_str <- as.data.frame(read_xlsx("/Users/macbookpro/haha/crypt.xlsx"))

str(data_str)
View(data_str)
# plot(data_str$crypto)
plot(data_str$btc, data_str$eth,
     col = "red",
     pch = 20,
     main = "BTC vs ETH",
     xlab = "BTC",
     ylab = "ETH")
print("preslo")

ggplot(data = data_str, aes(x=t, y=btc, group=1)) +
  geom_line(color = "black")+
  theme_bw()+
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(),
        legend.title = element_blank(),
        legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  ggtitle("BTC price")
print("preslo")

ggplot(data = data_str, aes(x=t, y=eth, group = 2)) +
  geom_line(color = "black")+
  theme_bw()+
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(),
        legend.title = element_blank(),
        legend.position = "none",
        panel.grid.major = element_blank(),
        palen.grid.minor = element_blank()) +
  ggtitle("ETH price")

print("preslo")

stargazer(data_str, type = "text", title = "Descriptive statistics", 
          digit = 3, flip=TRUE)
print("preslo")

apply(data_str[,-1], 2, sd)
apply(data_str[,-1], 2, mean)
apply(data_str[,-1], 2, var)

# finding ?? for a single var
sd_value_btc <- sd(data_str$btc)
mean_value_btc <- mean(data_str$btc)
med_btc <- median(data_str$btc)

sd_value_eth <- sd(data_str$eth)
sd_value_eth <- mean(data_str$eth)
sd_value_eth <- median(data_str$eth)

# histrogram
hist(data_str$btc)
hist(data_str$eth)

# shape of distribution
apply(data_str[,-1], 2, skewness)
apply(data_str[,-1], 2, kurtosis)
print("preslo")

boxplot(data_str$btc,
        main="",
        ylab="",
        col="lightblue",
        border="blue")
