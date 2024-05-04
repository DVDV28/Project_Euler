import numpy as np

def is_prime(no) :
    for i in range(2, no) :
        if no % i == 0:
            return False
    return True

no = 600851475143
while no % 2 == 0:
    no = no / 2

div = 3
while div < no / 2:
    if is_prime(div):
        while no % div == 0:
            no = no / div
    div = div + 2

print(no)
