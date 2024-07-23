## https://projecteuler.net/problem=27
## Quadratic Primes
## Euler discovered the remarkable quadratic formula:
## n^2 + n + 41
## It turns out that the formula will produce 40 primes for the consecutive integer values 0 \le n \le 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
## The incredible formula n^2 - 79n + 1601 was discovered, which produces 80 primes for the consecutive values 0 \le n \le 79. The product of the coefficients, -79 and 1601, is -126479.
## Considering quadratics of the form:
## n^2 + an + b, where |a| &lt; 1000 and |b| \le 1000where |n| is the modulus/absolute value of ne.g. |11| = 11 and |-4| = 4
## Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

## n = 0 |> b must be prime
## n = 1 |> a + 1 + b must be prime. This means that (a must be odd and a + b > 2) or (a + b = 1)
## n = 2 |> 2a + b + 4 must be prime. This means that b can't be 2 and removes the second option in the line above.

max_length <- 0

b_list <- create_prime_sieve(2000)

for (b in b_list[b_list > 2 & b_list <= 1000]) {
    a_list <- seq((2 - b), 1000, by = 2)
    a_list <- a_list[(a_list + 1 + b) %in% b_list]
    for (a in a_list) {
        n <- 1
        still_prime <- T
        
        while (still_prime) {
            n <- n + 1
            if (is.prime(n^2 + a * n + b)) {
                n <- n + 1
            } else {
                still_prime <- F
            }
        }
        
        if (n > max_length) {
            max_length <- n
            ab_prod <- a * b
        }
    }
}

print(ab_prod)
