library(readxl)
library(ggplot2)
library(stargazer)

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

ggplot(data = data_str, aes(x=t, y=oil, group=1)) +
  geom_line(color = "black")+
  theme_bw()+
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(),
        legend.title = element_blank(),
        legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  ggtitle("Oil price")
