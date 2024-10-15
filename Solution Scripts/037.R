## https://projecteuler.net/problem=37
## Truncatable Primes
## The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
## Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
## NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

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

trunc_primes <- primes[!grepl(".(2|4|5|6|8|0).", primes)]
trunc_primes <- trunc_primes[trunc_primes > 9]
trunc_primes <- trunc_primes[trunc_primes %% 10 != 9] ## last digit of 4, 6, 8 are removed by the fact that it's a prime
trunc_primes <- trunc_primes[substring(trunc_primes, 1, 1) %in% c(2, 3, 5, 7)]

for (n in 1:5) {
    trunc_primes <- trunc_primes[trunc_primes %% 10^n %in% primes]
    trunc_primes <- trunc_primes[trunc_primes < 10^n | floor(trunc_primes / 10^n) %in% primes]
}


length(trunc_primes)
sum(trunc_primes)
