## https://projecteuler.net/problem=23
## Non-Abundant Sums
## A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
## A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
## As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
## Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

## First we find all deficient numbers
max_no <- 28123
divisor_sum <- numeric(max_no) + 1

for (div in 2:(max_no/2)) {
    divisor_sum[seq(2 * div, max_no, by = div)] <- divisor_sum[seq(2 * div, max_no, by = div)] + div
}

abundants <- which(divisor_sum > seq_len(max_no)) ## about 7k entries

are_sum <- rep(F, 28123)
are_sum[2 * abundants[abundants <= max_no / 2]] <- T

for (x1 in abundants) {
    for (x2 in abundants[abundants < x1]) {
        num_sum <- x1 + x2
        if (num_sum <= 28123) {
            are_sum[num_sum] <- T
        }
    }
}

sum(which(!are_sum))
