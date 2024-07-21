## https://projecteuler.net/problem=20
## Factorial Digit Sum
## n! means n \times (n - 1) \times \cdots \times 3 \times 2 \times 1.
## For example, 10! = 10 \times 9 \times \cdots \times 3 \times 2 \times 1 = 3628800,and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
## Find the sum of the digits in the number 100!.

## factorial(100) = 9.3e157 => 158 digits

num_length <- 170

result <- numeric(num_length)
result[1] <- 1
max_digit <- 1

for (i in 99:2) { ## 100 only adds 2 zeros to end - doesn't change the sum
    result <- result * i
    
    result <- result %% 10 + c(0, result[-num_length] %/% 10) 
    result <- result %% 10 + c(0, result[-num_length] %/% 10) ## Again for when a digit is > 100
}

sum(result)
