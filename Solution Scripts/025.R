## https://projecteuler.net/problem=25
## 1000-digit Fibonacci Number
## The Fibonacci sequence is defined by the recurrence relation:
## F_n = F_{n - 1} + F_{n - 2}, where F_1 = 1 and F_2 = 1.
## Hence the first 12 terms will be:
## \begin{align}
## F_1 &amp;= 1\\
## F_2 &amp;= 1\\
## F_3 &amp;= 2\\
## F_4 &amp;= 3\\
## F_5 &amp;= 5\\
## F_6 &amp;= 8\\
## F_7 &amp;= 13\\
## F_8 &amp;= 21\\
## F_9 &amp;= 34\\
## F_{10} &amp;= 55\\
## F_{11} &amp;= 89\\
## F_{12} &amp;= 144
## \end{align}
## The 12th term, F_{12}, is the first term to contain three digits.
## What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

## Using binet's formula, Fn = (phi^n - phi_conj^n) / sqrt(5)
## From Wikipedia - "Since Fn is asymptitc to phi^n / sqrt(5), the number of digits is asymptotic to n log10 phi ~ 0.2090n"

## 1000 / log((1 + sqrt(5)) / 2, 10) = 4784.97 - not too many to brute force

library(gmp)

x1 <- as.bigz(1)
x2 <- as.bigz(1)
i <- 2

while (log10(x2) < 999) {
    x3 <- x1 + x2
    x1 <- x2
    x2 <- x3
    i <- i + 1
}

print(i)
