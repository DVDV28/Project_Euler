## https://projecteuler.net/problem=36
## Double-base Palindromes
## The decimal number, 585 = 1001001001_2 (binary), is palindromic in both bases.
## Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
## (Please note that the palindromic number, in either base, may not include leading zeros.)
tic()

## Generate palindromic numbers (instead of running algorithm to check for them)
dec_palins <- 1:999

dec_palins <- as.character(dec_palins)
dec_palins <- dec_palins[!substring(dec_palins, 1, 1) %in% c("2", "4", "6", "8")] ## A binary palindrome can't be even

dec_palins <- strsplit(dec_palins,  split = "")

dec_palins <- 
    c(lapply(dec_palins, ## 123 -> 123321
             function(x){
                 c(x, rev(x))
                 }),
      lapply(dec_palins, ## 123 -> 12321
             function(x){
                 c(x, rev(x)[-1])
             }))

dec_palins <- sapply(dec_palins, paste, collapse = "")
dec_palins <- as.numeric(dec_palins)

dec_palins <- unique(dec_palins)

bin_palins <- 1:2^10

bin_palins <- 
    lapply(bin_palins, intToBits) |>
    lapply(as.numeric) |>
    lapply(function(x){x[1:max(which(x == 1))]})

bin_palins <- 
    c(lapply(bin_palins, ## 123 -> 123321
             function(x){
                 c(rev(x), x)
             }),
      lapply(bin_palins, ## 123 -> 12321
             function(x){
                 c(rev(x), x[-1])
             }))

bin_palins <- sapply(bin_palins,
                     function(x){
                         sum(2^(0:(length(x) -1)) * x)
                     }) 
bin_palins <- bin_palins[bin_palins < 1e6]

sum(dec_palins[dec_palins %in% bin_palins])
toc()

## Brute force approach
tic()
is_palindromic <- function(n, base = 10) {
    n_rev <- 0
    n_trans <- n

    while (n_trans > 0) {
        n_rev <- base * n_rev + n_trans %% base
        n_trans <- n_trans %/% base
    }

    return(n == n_rev)
}

brute_list <- 1:1e6
brute_list <- brute_list[sapply(brute_list, is_palindromic) & sapply(brute_list, is_palindromic, 2)]
sum(brute_list)
toc()

# test_that("is_palindromic",
#           {
#               expect_equal(is_palindromic(1), T)
#               expect_equal(is_palindromic(11), T)
#               expect_equal(is_palindromic(111), T)
#               expect_equal(is_palindromic(1111), T)
#               expect_equal(is_palindromic(1), T)
#               expect_equal(is_palindromic(12), F)
#               expect_equal(is_palindromic(112), F)
#               expect_equal(is_palindromic(1121), F)
#           })
