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

#' Extract list of prime factors for a number
#' 
#' This function takes a number `n` and returns a vector of all of its prime
#' factors. When a factor appears multiple times (for example, 28 is divisible by 2 and 4) the
#' prime will appear that many times
#' 
#' @param n The number to determine the number of prime divisors of
#' @param count Whether the function should return the 
get_prime_divisors <- function(n, count = F) {
    i <- 2
    
    if (!count) {
        divisors <- numeric()
    } else {
        divisors <- 1
        prime_count <- 0
    }
    
    while (T) {
        if (n %% i == 0) {
            n <- n / i
            if (!count) {
                divisors <- c(divisors, i)
            } else {
                prime_count <- prime_count + 1
            }
        } else {
            if (i == 2) {
                i <- i + 1
            } else {
                i <- i + 2
            }
            if (count) {
                divisors <- divisors * (prime_count + 1)
                prime_count <- 0
            }
            
            if (n == 1) {
                return(divisors)
            }
        }
    }
}

create_prime_sieve <- function(cap) {
    number_seq <- 1:cap
    is_prime_seq <- rep(T, cap)
    
    is_prime_seq[1] <- F
    
    div <- 2
    while (div <= sqrt(cap) & !is.na(div)) {
        is_prime_seq[seq(div^2, cap, by = div)] <- F ## squared, because the first instance is prime and the nth instance is handled elsewhere
        
        div <- number_seq[number_seq > div & is_prime_seq][1]
    }
    
    return(number_seq[is_prime_seq])
}