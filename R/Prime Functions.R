is.prime <- function(n) {
    if (n < 2) {
        return(F)
    }
    if (n == 2) {
        return(T)
    }
    if (n %% 1 != 0) {
        return(F)
    }

    div_checks <- c(2, seq(min(3, sqrt(n)), sqrt(n), by = 2)) ## If it's not divisible by 2, it's not divisible by an even number
    for (i in div_checks) {
        if (n %% i == 0) {
            return(F)
        }
    }
    return(T)
}

get_prime_divisors <- function(n) {
    ## Recycles code from solution to Q10: create a prime sieve
    number_seq <- 1:n
    is_prime_seq <- rep(T, n)
    
    is_prime_seq[1] <- F
    
    div <- 2
    while (div <= sqrt(n) & !is.na(div)) {
        is_prime_seq[seq(div^2, n, by = div)] <- F ## squared, because the first instance is prime and the nth instance is handled elsewhere
        
        div <- number_seq[number_seq > div & is_prime_seq][1]
    }
    
    primes <- number_seq[is_prime_seq]
    powers <- rep(0, length(primes))
    
    i <- 1
    while (i <= length(primes)) {
        if (n %% primes[i] == 0) {
            n <- n / primes[i]
            powers[i] <- powers[i] + 1
        } else {
            i <- i + 1
        }
        
        if (n == 1) {
            break()
        }
    }
    
    divisors <- unlist(mapply(rep, primes, powers))
    
    return(divisors)
}
