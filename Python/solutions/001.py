import numpy as np

top = 1000
res = sum(np.arange(0, top, 3)) + sum(np.arange(0, top, 5)) - sum(np.arange(0, top, 15))

print(res)
