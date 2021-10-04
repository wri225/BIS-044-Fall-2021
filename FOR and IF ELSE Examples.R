# Clear out Console and Enviroment
rm(list=ls(all=TRUE))
cat("\014")

# Install and load tidyverse
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

# Load data set
load("SNOHOMISH.RData")

# Examine data set
View(SNOHOMISH)

# Set n to legth of data set
n <- length(SNOHOMISH$date)

# Initialize new variable in data frame
SNOHOMISH$incr_cases <- 1

View(SNOHOMISH)

# Calculate values for other than first row using FOR loop

for (i in 2:n) {
  SNOHOMISH$incr_cases[i] <- (SNOHOMISH$cases[i]-SNOHOMISH$cases[i-1]) 
}

View(SNOHOMISH)

# Plot what we've got

p <- ggplot(data = SNOHOMISH,
            mapping = aes(x = date,
                          y = incr_cases))

p + geom_point() +
  labs(x = "Dates", y = "Incremental Cases",
       title = "COVID-19 Cases in Snohomish County, WA",
       subtitle = "Data points are incremental new confirmed cases",
       caption = "Source: NY Times")

# Let's replace 0 values with NA using IF..ELSE statement

for (i in 1:n) {
  if (SNOHOMISH$incr_cases[i]==0) {
    SNOHOMISH$incr_cases[i] <- NA
  } else {}
}

View(SNOHOMISH)

# Replot

p <- ggplot(data = SNOHOMISH,
            mapping = aes(x = date,
                          y = incr_cases))

p + geom_point() +
  labs(x = "Dates", y = "Incremental Cases",
       title = "COVID-19 Cases in Snohomish County, WA",
       subtitle = "Data points are incremental new confirmed cases",
       caption = "Source: NY Times")

####################################################################
### Please run the rest of this script as a single block, just to 
### illustrate what types of things you can do with R and graphs

# Remember, we have replaced some value of incr_cases with NA, so...

mean(SNOHOMISH$incr_cases)

# There IS a workaround for some commands, such as mean()
mean(SNOHOMISH$incr_cases, na.rm=TRUE)
meancases <- mean(SNOHOMISH$incr_cases, na.rm=TRUE)

# Initialize seperate vectors for cases above and below average
SNOHOMISH$above_cases <- 0
SNOHOMISH$below_cases <- 0

# Return incr_cases to what it was when we first computed it

SNOHOMISH$incr_cases <- 1
for (i in 2:n) {
  SNOHOMISH$incr_cases[i] <- (SNOHOMISH$cases[i]-SNOHOMISH$cases[i-1]) 
}

View(SNOHOMISH)

# Assign values to above_cases and below_cases based on whether incr_cases
# is greater than or less than average

for (i in 1:n) {
  if(SNOHOMISH$incr_cases[i]>=meancases) {
    SNOHOMISH$above_cases[i] <- SNOHOMISH$incr_cases[i]
  } else {
    SNOHOMISH$below_cases[i] <- SNOHOMISH$incr_cases[i]
  }
}

# Plot what we've got

p = ggplot() + 
  geom_point(data = SNOHOMISH, aes(x = date, y = above_cases), color = "red") +
  geom_point(data = SNOHOMISH, aes(x = date, y = below_cases), color = "green") +
  labs(x = "Dates", y = "Incremental Cases",
       title = "Incremental COVID-19 Cases in Snohomish County, WA",
       subtitle = "Red = Above Average, Green = Below Average",
       caption = "Source: NY Times")
p

# Now, the values on the x-axis are really ugly, so, replace 0 values with "NA"

for (i in 1:n) {
  if(SNOHOMISH$above_cases[i]==0) {
    SNOHOMISH$above_cases[i] <- NA
  } else {}
  if(SNOHOMISH$below_cases[i]==0) {
    SNOHOMISH$below_cases[i] <- NA
  } else {}
}

# Now, our plot will look much better

p = ggplot() + 
  geom_point(data = SNOHOMISH, aes(x = date, y = above_cases), color = "red") +
  geom_point(data = SNOHOMISH, aes(x = date, y = below_cases), color = "green") +
  labs(x = "Dates", y = "Incremental Cases",
       title = "Incremental COVID-19 Cases in Snohomish County, WA",
       subtitle = "Red = Above Average, Green = Below Average",
       caption = "Source: NY Times")
p

