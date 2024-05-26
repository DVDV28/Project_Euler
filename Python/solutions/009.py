# Find a Pythagorean triple such that
# a + b + c = 1000

## This solution uses Euclid's formula for generating Pythagorean triples

m = 2
n = 1

while True:
    for n in range(1, m):
        a = m**2 - n**2
        b = 2 * m * n
        c = m**2 + n**2

        if a + b + c == 1000:
            print(a * b * c)
            break

    m += 1
