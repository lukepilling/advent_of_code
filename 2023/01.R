
library(tidyverse)

input <- read_tsv("01.input.txt", col_names = FALSE)

output = input |> mutate(
  n1 = gsub("\\D", "", X1),   # strip non-integer characters
  n2 = as.numeric( case_when( # convert result to numeric
    nchar(n1) == 1 ~ str_c( n1, n1 ),      # if only 1 number, use this twice
    nchar(n1) > 1 ~ str_c( str_sub(n1, 1, 1), str_sub(n1, -1) )  # if multiple numbers, paste first and last together
  ) )
)

sum(output$n2)
