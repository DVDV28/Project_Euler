## https://projecteuler.net/problem=41
## Pandigital Prime
## We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
## What is the largest n-digit pandigital prime that exists?

## 1-8 and 1-9 are all divisible by 3
## 1-7 is probably the biggest
## 1-6 and 1-5 are all divisible by 3
## 1-4 would be sad

library(gtools)

pandigitals <- permutations(7, 7, 1:7) %*% 10^(6:0)
pandigitals <- rev(sort(pandigitals))

for (pan in pandigitals) {
    if (is.prime(pan)) {
        break()
    }
}
pan