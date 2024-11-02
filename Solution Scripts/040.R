## https://projecteuler.net/problem=40
## Champernowne's Constant
## An irrational decimal fraction is created by concatenating the positive integers:
## 0.12345678910{\color{red}\mathbf 1}112131415161718192021\cdots
## It can be seen that the 12th digit of the fractional part is 1.
## If d_n represents the nth digit of the fractional part, find the value of the following expression.
## d_1 \times d_{10} \times d_{100} \times d_{1000} \times d_{10000} \times d_{100000} \times d_{1000000}

cutoffs <- sapply(1:6, function(x){x * (10^x - 10^(x - 1))})
cutoffs <- cumsum(cutoffs)

expression <- 1 ## d1 * d10 = 1 * 1

for (i in 10^(2:6)) {
    di_digits <- max(which(cutoffs < i)) + 1
    number <- 10^(di_digits - 1) + (i - cutoffs[di_digits - 1]) %/% di_digits
    expression <- expression * as.numeric(substring(number,
                                                    (i - cutoffs[di_digits - 1]) %% di_digits,
                                                    (i - cutoffs[di_digits - 1]) %% di_digits))
}

print(expression)