## https://projecteuler.net/problem=15
## Lattice Paths
## Starting in the top left corner of a 2 \times 2 grid, and only being able to move to the right and down, 
## there are exactly 6 routes to the bottom right corner.
## How many such routes are there through a 20 \times 20 grid?

## Nice and simple combinatorics problem:
## 4! / (2! * 2!) = 6

prod(1:40) / (prod(1:20) * prod(1:20))
