#' Find product of two polynomials
#' 
#' @param Y1 A numeric vector where the nth entry represents the coefficient of x^(n - 1) of the first polynomial
#' @param Y2 A numeric vector where the nth entry represents the coefficient of x^(n - 1) of the second polynomial
#' 
#' @returns A numeric vector where the nth entrty represents the coefficient of x^(n - 1) of the product of the polynomials
poly_prod <- function(Y1, Y2) {
    dim_1 <- length(Y1) - 1
    dim_2 <- length(Y2) - 1
    
    output <- numeric(dim_1 + dim_2 + 1)
    
    for (i in 1:(dim_1 + 1)) {
        output[(i):(i + dim_2)] <- 
            output[i:(i + dim_2)] + Y1[i] * Y2
    }
    
    return(output)   
}
