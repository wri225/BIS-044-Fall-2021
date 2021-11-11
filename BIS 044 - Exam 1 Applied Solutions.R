# Solution file for BIS 044 Assignment Exam 1 Applied Questions
library(tidyverse)

chess <- read_csv("Player_piece_info.zip")

length(chess$queen)

count(chess,chess$queen)

max(chess$move_num)

str(chess)
