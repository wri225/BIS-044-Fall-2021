library(tidyverse)
df <- read.csv("WMT.csv")
END <-length(df$Low)
# Need to fix problem with inconsistent dates
for (i in 1:END) {
  if (substr(df$Date[i],1,2)=="20"||substr(df$Date[i],1,2)=="19") {
    df$Date[i] <- paste(substr(df$Date[i],6,7),"/", substr(df$Date[i],9,10),"/", substr(df$Date[i],1,4),sep='')
  } else{}
}

# Q1
END

# Q2

as.Date(df$Date[END], "%m/%d/%Y") - as.Date(df$Date[1],"%m/%d/%Y")

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
