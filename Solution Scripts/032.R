## https://projecteuler.net/problem=32
## Pandigital Products
## We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
## The product 7254 is unusual, as the identity, 39 \times 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
## Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
## HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

## Thoughts:
## The multiplicand and multiplier cannot end in 1 or 0 - otherwise the product will too
## It is probably faster to cycle through all of the possible multiplicand/multiplier combinations
## The multiplicand should always be smaller than the multiplier to prevent double counting

prod_set <- numeric()

## If the multiplicand is 1 digit, then the multiplier and product must both be 4 digits
for (i in 2:8) {
    for (j in max(1234, ceiling(1234/i)):floor(9876/i)) {
        product <- i * j
        used_num <- unlist(strsplit(as.character(c(i, j, product)), ""))
        if (uniqueN(used_num) == 9 && !"0" %in% used_num) {
            prod_set <- c(prod_set, product)
        }
    }
}
## If the multiplicand is 2 digits, then the multiplier must have 3 digits and the product must have 4
## The multiplicand cannot have 3 digits without being larger than the multiplier
for (i in 12:79) { ## floor(9876/123) = 80
    if (i %% 10 == 0) {
        next()
    }
    for (j in ceiling(1234/i):floor(9876/i)) {
        if (j %% 10 == 0 || (j - j %/% 10) %% 10 == 0) {
            next()
        }
        product <- i * j
        used_num <- unlist(strsplit(as.character(c(i, j, product)), ""))
        if (uniqueN(used_num) == 9 && !"0" %in% used_num) {
            prod_set <- c(prod_set, product)
        }
    }
}

sum(unique(prod_set))
