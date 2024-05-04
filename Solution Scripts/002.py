def Fibgen(max_val):
    x1 = 1
    x2 = 2
    yield x2
    counter = 0 # To make even values

    while (x1 + x2 <= max_val):
        x1 = x1 + x2
        counter += 1
        if (counter == 3):
            yield x1
            counter = 0
        x1, x2 = x2, x1

sum(Fibgen(4e6))
