## https://projecteuler.net/problem=26
## Reciprocal Cycles
## A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
## \begin{align}
## 1/2 &amp;= 0.5\\
## 1/3 &amp;=0.(3)\\
## 1/4 &amp;=0.25\\
## 1/5 &amp;= 0.2\\
## 1/6 &amp;= 0.1(6)\\
## 1/7 &amp;= 0.(142857)\\
## 1/8 &amp;= 0.125\\
## 1/9 &amp;= 0.(1)\\
## 1/10 &amp;= 0.1
## \end{align}
## Where 0.1(6) means 0.166666\cdots, and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
## Find the value of d \lt 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

## 1 / 3 = 3 / 9
## 1 / 7 = 142857 / 999999

## Multiples of 2 and of 5 would have the same number of repeating decimals as their divisor

max_digits <- 1
max_i <- 1

for (i in 999:2) {
    if (i %% 5 == 0 || i %% 2 == 0) {
        next()    
    }
    
    divisor_found <- F
    dec_check <- 1
    while (!divisor_found) {
        if (dec_check > 15) { ## Floating point dramas for bigger numbers
            numerator <- numeric(dec_check) + 9
            
            for (start in dec_check:4) {
                result_short <- sum(10^(3:0) * numerator[start:(start - 3)]) %% i
                numerator[start:(start - 3)] <- (result_short %/% 10^(3:0)) %% 10
            }
            
            if (sum(numerator) == 0) {
                divisor_found <- T   
            } else {
                dec_check <- dec_check + 1
            }
        } else if ((10^dec_check - 1) %% i == 0) {
            divisor_found <- T
        } else {
            dec_check <- dec_check + 1
        }
    }
    
    if (dec_check >= max_digits) {
        max_digits <- dec_check
        max_i <- i
    }
    
    if (i <= max_digits) {
        break() ## The period of 1/k⁠ for integer k is always ≤ k − 1: https://en.wikipedia.org/wiki/Repeating_decimal#Converting_repeating_decimals_to_fractions
    }
}

print(max_i)
