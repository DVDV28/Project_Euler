## https://projecteuler.net/problem=31
## Coin Sums
## In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
## 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
## It is possible to make £2 in the following way:
## 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
## How many different ways can £2 be made using any number of coins?

coin_vals <- c(1, 2, 5, 10, 20, 50, 100, 200)

## Using generating functions - Solution is the coefficient of x^200 in
## prod(sum(x^(coin * 0:200)))

poly <- lapply(coin_vals[-length(coin_vals)],
               function(x){
                   elements <- seq(0, 199, by = x) ## Count combinations that are 1 coin at a time separately
                   output <- numeric(max(elements))
                   output[elements + 1] <- 1
                   return(output)
               })

poly_output <- Reduce(poly_prod, poly)
poly_output[201] + length(coin_vals)
