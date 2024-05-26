## https://projecteuler.net/problem=14
## Longest Collatz Sequence
## The following iterative sequence is defined for the set of positive integers:
## n \to n/2 (n is even)
## n \to 3n + 1 (n is odd)
## Using the rule above and starting with 13, we generate the following sequence:
## 13 \to 40 \to 20 \to 10 \to 5 \to 16 \to 8 \to 4 \to 2 \to 1.
## It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
## Which starting number, under one million, produces the longest chain?
## NOTE: Once the chain starts the terms are allowed to go above one million.


generate_collatz <- function(n) {
    sequence <- n
    while (n > 1) {
        if (n %% 2 == 0) {
            n <- n / 2
        } else {
            n <- 3 * n + 1
        }
        sequence <- c(sequence, n)   
    }
    
    return(sequence)
}

# ## Brute force - 120 seconds
# tic()
# max_len <- 0
# 
# for (i in 1:1e6) {
#     if (length(generate_collatz(i)) > max_len) {
#         max_len <- max(max_len, length(generate_collatz(i)))
#         loc <- i
#     }
# }
# 
# print(loc)
# print(max_len)
# 
# toc()

## Recycling calcs ---- much faster at 2 seconds
tic()
lengths <- integer(1e6)
lengths[2^(0:log(1e6, 2))] <- (0:log(1e6, 2)) + 1L
i <- 3
while (i <= 1e6) {
    seq_len_known <- lengths[i] > 0
    if (!seq_len_known) {
        unknown_seq <- i
        chk <- i
        while (!seq_len_known) {
            if (chk %% 2 == 0) {
                chk <- chk / 2L
            } else {
                chk <- 3L * chk + 1L
            }
            
            if (chk <= 1e6 && lengths[chk] > 0) {
                seq_len_known <- T
            } else {
                unknown_seq <- c(chk, unknown_seq)
            }
            
        }
        lengths[unknown_seq[unknown_seq <= 1e6L]] <- seq_along(unknown_seq)[unknown_seq <= 1e6L] + as.integer(lengths[chk])
    }
    i <- i + 1
}

which.max(lengths)
toc()

