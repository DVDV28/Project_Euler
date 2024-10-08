## https://projecteuler.net/problem=34
## Digit Factorials
## 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
## Find the sum of all numbers which are equal to the sum of the factorial of their digits.
## Note: As 1! = 1 and 2! = 2 are not sums they are not included.

## 7 * factorial(9) > 9999999 => max of 7 digits
## 7 * factorial(9) = 2540160

## Brute force - every combination: about 4.5 seconds
tic()
sum(
    sapply(10:2540160, ## 7 * 9!
           function(x){
               fac_sum <- sum(factorial(as.numeric(strsplit(as.character(x), split = "")[[1]])))
               
               if (fac_sum == x) {
                   return(x)
               } else {
                   return(0)
               }
           })    
)
toc()


## LET'S USE RECURSION
tic()
final_sum <- 0

factorials <- factorial(0:9)

next_digit_sum <- function(factorial_sum = 0, number_prefix = 0, digit_position = 7) {
    if (number_prefix == 0) {
        if (digit_position == 1) {
            return()
        }
        
        ndigits <- digit_position
    } else {
        ndigits <- log10(number_prefix) + digit_position
    }
    
    for (digit in 0:9) {
        if (factorial_sum == 0 && digit == 0) {
            if (digit_position > 2) {
                next_digit_sum(factorial_sum = 0, 
                               number_prefix = 0, 
                               digit_position = digit_position - 1)
            }
            next()
        } 
        
        factorial_sum_new <- factorial_sum + factorials[digit + 1]
        num_cap <- (number_prefix + 1) * 10^digit_position
        
        if (factorial_sum_new > num_cap) {
            return()
        } else if (digit_position == 1) {
            new_num <- (number_prefix * 10 + digit) * 10^(digit_position - 1)
            if (factorial_sum + factorial(digit) == new_num) {
                final_sum <<- final_sum + new_num
                return()
            }   
        } else {
            next_digit_sum(factorial_sum = factorial_sum_new, 
                           number_prefix = number_prefix * 10 + digit, 
                           digit_position = digit_position - 1)
        }
    }
}

next_digit_sum()
final_sum

toc() ## still slow...

## Non-sequential approach based on combinations rather than permutations of factorials
library(gtools)

final_sum <- 0
for (ndigits in 7:2) {
    max_digit <- max(which(factorial(1:9) < 10^ndigits))
    # max_digit <- 9
    combs <- gtools::combinations(max_digit + 1, ndigits, 0:max_digit, repeats.allowed = T)
    
    factorial_sums <- rowSums(factorial(combs))
    
    digits <- lapply(strsplit(as.character(factorial_sums), ""), as.numeric)
    digits <- lapply(digits, sort)
    
    for (i in 1:nrow(combs)) {
        if (length(digits[[i]]) == ndigits && all(digits[[i]] == unlist(combs[i, ]))) {
            final_sum <- final_sum + factorial_sums[i]
        }
    }
}

final_sum