import numpy as np

def prime_sieve(max_val):
    arr = np.array([True] * max_val)
    
    arr[0] = False
    arr[np.arange(3, max_val, 2)] = False

    count = 1
    
    div = 3
    while div < max_val:
        if arr[div - 1] :
            count += 1

            if count == 10001:
                yield div

            arr[np.arange(2 * div, max_val, div) - 1] = False
        div = div + 2

set(prime_sieve(104750))