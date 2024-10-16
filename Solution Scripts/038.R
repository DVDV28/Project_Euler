## https://projecteuler.net/problem=38
## Pandigital Multiples
## Take the number 192 and multiply it by each of 1, 2, and 3:
## \begin{align}
## 192 \times 1 &amp;= 192\\
## 192 \times 2 &amp;= 384\\
## 192 \times 3 &amp;= 576
## \end{align}
## By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3).
## The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
## What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, \dots, n) where n \gt 1?

## If 4 digit number => digit 1 is 9 since it must be larger than the result for '9'. Digits 5 and 6 are 1 and 8 (since 1 and 8-carry-the-1-9 duplicates the 9). 
## This means the second digit must be 3 or 2 (since a value of 4 leads to 2x = 8 and a value > 5 means carry the 1)
for (i in seq(9387, 9213, by = -3)) { ## x + 2x is divisible by 9 => x is divisible by 3
    if (uniqueN(strsplit(as.character(1e6 * i + 20 * i), "")[[1]]) == 10) {
        print(i * 1e5 + i * 2)
        break()
    }
}

## If 3 digit number, then x, 2x and 3x are all 3 digit numbers. This means that the first digit of x cannot be 9 as 2x would then be 4 digits.
## As such, it is not a 3 digit number

## If a 2 digit number, then x = 2 digits, 2x = 3 digits, 3x = 3 digits, 4x = 3 digits => Thus impossible

## The largest 1 digit solution is the one listed