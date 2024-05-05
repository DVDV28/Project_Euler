## https://projecteuler.net/problem=10
## Summation of Primes
## The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
## Find the sum of all the primes below two million.

cap <- 2e6

## Brute force ## ~2 mins 35
sum((1:cap)[sapply(1:cap, is.prime)])

## Create sieve ## About 10 seconds
number_seq <- 1:cap
is_prime_seq <- rep(T, cap)

is_prime_seq[1] <- F

div <- 2
while (div <= sqrt(cap) & !is.na(div)) {
    is_prime_seq[seq(div^2, cap, by = div)] <- F ## squared, because the first instance is prime and the nth instance is handled elsewhere
    
    div <- number_seq[number_seq > div & is_prime_seq][1]
}

sum(number_seq[is_prime_seq])
