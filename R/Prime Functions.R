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
