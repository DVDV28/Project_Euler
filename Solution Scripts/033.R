## https://projecteuler.net/problem=33
## Digit Cancelling Fractions
## The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
## We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
## There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
## If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

frac_prod <- 1

for (i in 1:9) {
    for (j in i:9) { ## If j is smaller than i, the fraction is >= 1
        for (k in i:9) {
            num <- 10 * i + j
            den <- 10 * j + k
            
            if (num >= den) {
                next()
            }
            if (num / den == i / k) {
                frac_prod <- frac_prod * (i / k)
            }
        }
    }
}

print(frac_prod) ## 0.01 - obvious conversion