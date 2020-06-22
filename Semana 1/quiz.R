dataset = read.csv("quiz1_data.csv")

head(dataset,2)
tail(dataset,2)

dataset[47,]

missing = dataset[is.na(dataset$Ozone),]
nrow(missing)

mean(dataset$Ozone, na.rm = T)

subset = dataset[dataset$Ozone > 31 & dataset$Temp > 90,]
mean(subset$Solar.R, na.rm = T)

subset = dataset[dataset$Month == 6,]
mean(subset$Temp, na.rm = T)

subset = dataset[dataset$Month == 5,]
max(subset$Ozone, na.rm = T)

x <- 1:4
y <- 2:3
x + y

x = list(2, "a", "b", TRUE)
x[[1]]
class(x[[1]])

y = c(4, "a", TRUE)
class(y)
