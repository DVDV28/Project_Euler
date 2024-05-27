## https://projecteuler.net/problem=16
## Power Digit Sum
## 2^{15} = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
## What is the sum of the digits of the number 2^{1000}?

number_storage <- numeric(302) ## first entry is 10^0, nth entry is 10^(n-1)
number_storage[1] <- 1
ndigits <- 1

for (i in 1:1000) {
    for (digit in ndigits:1) {
        number_storage[digit] <- number_storage[digit] * 2
        if (number_storage[digit] > 9) {
            number_storage[digit] <- number_storage[digit] - 10
            number_storage[digit + 1] <- number_storage[digit + 1] + 1
            
            if (digit == ndigits) {
                ndigits <- ndigits + 1
            }
        }
    }
}

sum(number_storage)
