# a + b + c = 1000
# (a + b + c)**2 = 1000000
# a^2 + b^2 + c^2 + 2ab + 2ac + 2bc = 1000000
# a^2 + b^2 + 2ab + 1 - a - b = 499001
# (a + b)^2 - (a + b)  - 499000 = 0

prod = 1
for x in [5,5,7,6,6,8,9,6,6,4,8,9,5]:
  prod *= x

print(prod)