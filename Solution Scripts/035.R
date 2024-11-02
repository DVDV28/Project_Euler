## https://projecteuler.net/problem=35
## Circular Primes
## The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
## There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
## How many circular primes are there below one million?

## Create sieve 
cap <- 1e6

number_seq <- 1:cap
is_prime_seq <- rep(T, cap)

is_prime_seq[1] <- F

div <- 2
while (div <= sqrt(cap) && !is.na(div)) {
    is_prime_seq[seq(div^2, cap, by = div)] <- F ## squared, because the first instance is prime and the nth instance is handled elsewhere
    
    div <- number_seq[number_seq > div & is_prime_seq][1]
}

primes <- number_seq[is_prime_seq]

## Count repeats
circ_count <- length(primes[primes <= 11]) ## 10 isn't prime
include_set <- primes[primes <= 11]

primes <- primes[!grepl("0|2|4|6|8|5", primes) & primes > 11] ## If it ends with one of them, then one arrangement will be divisible by 2 or 5

for (i in primes) {
    check_num <- i
    all_rots <- T
    for (rot in seq_len(floor(log(i, 10)))) {
        check_num <- floor(check_num / 10) + (check_num %% 10) * 10^(nchar(check_num) - 1)
        if (!check_num %in% primes) {
            all_rots <- F
            break()
        }
    }
    
    if (all_rots) {
        circ_count <- circ_count + 1
    }
}

circ_count