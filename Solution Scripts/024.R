## https://projecteuler.net/problem=24
## Lexicographic Permutations
## A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
## 012   021   102   120   201   210
## What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

## This solution identifies which digit should be slotted in each one based on relativities
## Once that is done, it moves from number to number, eliminating numbers already used

position <- 0
target <- 1e6

val_i <- numeric(10)

for (digit in 1:10) {
    val_i[digit] <- floor((target - position - 1) / factorial(10 - digit))
    position <- position + val_i[digit] * factorial(10 - digit)
}

possible <- 0:9

perm_digit <- numeric(10)

for (digit in 1:10) {
    perm_digit[digit] <- possible[val_i[digit] + 1]
    possible <- possible[possible != perm_digit[digit]]
}

perm_digit
