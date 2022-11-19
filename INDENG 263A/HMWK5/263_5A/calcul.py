import numpy as np
import math
def binom(n,k) :
    b=1
    for i in range(k):
        b*=(n-i)/(i+1)
    return b

print(binom(100,10)*(1/10)**10*(9/10)**90)
print(np.exp(-10)*(10)**10/math.factorial(10))