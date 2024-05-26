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
get_prime_divisors <- function(n) {
    i <- 2
    divisors <- numeric()
    while (T) {
        if (n %% i == 0) {
            n <- n / i
            divisors <- c(divisors, i)
        } else if (i == 2) {
            i <- i + 1
        } else {
            i <- i + 2
        }
        
        if (n == 1) {
            break()
        }
    }
    
    return(divisors)
}
