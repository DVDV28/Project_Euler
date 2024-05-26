import numpy as np

num = 100

res = (sum(range(num)) + num) ** 2 - sum((np.arange(num) + 1) ** 2)
print(res)
