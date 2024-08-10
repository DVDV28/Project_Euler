## https://projecteuler.net/problem=30
## Digit Fifth Powers
## Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
## \begin{align}
## 1634 &amp;= 1^4 + 6^4 + 3^4 + 4^4\\
## 8208 &amp;= 8^4 + 2^4 + 0^4 + 8^4\\
## 9474 &amp;= 9^4 + 4^4 + 7^4 + 4^4
## \end{align}
## As 1 = 1^4 is not a sum it is not included.
## The sum of these numbers is 1634 + 8208 + 9474 = 19316.
## Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

n5 <- (0:9)^5
## All n^5 end with the same digit as the number itself. This means that the sum of the other digits must be divisble by 10
## 999999 > 9^5 * 6 => must be <= 6 digits, as adding digits increases the number faster than the sum of digits^5

num_sum <- 0
for (i_100 in 1:9999) { ## all digits up to the second last digit
    i_100_split <- as.numeric(strsplit(as.character(i_100), split = "")[[1]])
    
    second_last_digit <- (10 - sum(i_100_split)) %% 10
    
    for (last_digit in 0:9) {
        number <- 100 * i_100 + 10 * second_last_digit + last_digit
        if (sum(c(i_100_split, second_last_digit, last_digit)^5) == number) {
            num_sum <- num_sum + number
        }
    }
}

print(num_sum)