## https://projecteuler.net/problem=39
## Integer Right Triangles
## If p is the perimeter of a right angle triangle with integral length sides, \{a, b, c\}, there are exactly three solutions for p = 120.
## \{20,48,52\}, \{24,45,51\}, \{30,40,50\}
## For which value of p \le 1000, is the number of solutions maximised?

## Using Euclid's formula:
## With m > n and m, n are odd
## a = k * mn
## b = k * (m^2 - n^2) / 2
## c = x * (m^2 + n^2) / 2
## Thus p = k * (m^2 + mn)

## A value of m = 32 and n = 1 = 1056 => max m value is 32
p_set <- numeric()
for (m in 3:31) {
    for (n in seq(1, m, by = 2)) {
        if (m %% n == 0) { ## m and n must be coprime
            next()
        }
        
        p <- m^2 + m * n
        if (p > 1000) {
            break()
        }
        
        max_k <- 1000 / p
        
        p_set <- c(p_set, p * 1:max_k)
    }
}

which.max(table(p_set))