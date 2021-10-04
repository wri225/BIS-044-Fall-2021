df <- read.csv("WMT.csv")

# Q1
END <-length(df$Low)
END

# Q2
as.Date(df$Date[END]) - as.Date(df$Date[1])

# Q3
price1 <- 0
price2 <- df$Adj.Close[END]
for (i in 1:END) {
  if (df$Date[i]=="2020-01-02") {
    price1 <- df$Adj.Close[i]
  }
}
price2 - price1

# Q4
sum(df$Volume[1:100])

# Q5
sum(df$Volume[(END-100+1):END])
