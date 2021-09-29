# Solution file for BIS 044 Assignment 02A, Spring 2021
lastday <- as.Date("2021-12-03")
days_left = as.integer(lastday-Sys.Date())
cat("Troy, there are",days_left,"days left in the semester.")

# or to do the whole thing on one line

cat("Troy, there are",as.integer(as.Date("2021-12-03")-Sys.Date()),"days left in the semester.")
