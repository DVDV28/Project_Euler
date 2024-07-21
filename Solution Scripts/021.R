## https://projecteuler.net/problem=21
## Amicable Numbers
## Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
## If d(a) = b and d(b) = a, where a \ne b, then a and b are an amicable pair and each of a and b are called amicable numbers.
## For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
## Evaluate the sum of all the amicable numbers under 10000.

divisor_sum <- numeric(10000) + 1

for (div in 2:5000) { ## > 5000 can't appear as divisor since the number isn't one
    divisor_sum[seq(div, 10000, by = div)] <- divisor_sum[seq(div, 10000, by = div)] + div
}

amicable_sum <- 0
for (i in 1:10000) {
    if (divisor_sum[i] <= 10000 && divisor_sum[i] != i && divisor_sum[divisor_sum[i]] == i) {
        amicable_sum <- amicable_sum + i
    }
}

print(amicable_sum)