## https://projecteuler.net/problem=3
## Largest Prime Factor
## The prime factors of 13195 are 5, 7, 13 and 29.
## What is the largest prime factor of the number 600851475143?

check_no <- 600851475143

found <- F
div <- 2
while (check_no > 1) {
    if (check_no %% div == 0) {
        check_no <- check_no / div
    } else {
        div <- div + 1
        while (!is.prime(div)){
            div <- div + 1
        }
    }
}

div