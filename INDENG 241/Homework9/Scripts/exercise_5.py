from math import sqrt
import numpy as np
from matplotlib import projections

import matplotlib.pyplot as plt
from exercise_4 import N1,N2
"""Exercise 5"""
"""Question 1"""
mu1 = 1
mu2 = 1.5

sigma1 = 1
sigma2 = 2

rho = 0.5

def XY() :
    a=N1()
    b=N2()
    return [mu1+sigma1*a,mu2+sigma2*rho*a+sigma2*sqrt(1-rho**2)*b]

def mean() :
    X = [XY()[0] for i in range(1000)]
    Y = [XY()[1] for i in range(1000)]
    return sum(X)/1000, sum(Y)/1000
"""Question 2"""
print("The estimated mean value for X is :{}".format(mean()[0]))
print("The estimated mean value for Y is :{}".format(mean()[1]))

def correlation() :
    x,y = XY()
    return (x-mu2)*(y-mu2)/sigma1/sigma2

rho_hat = sum([correlation() for i in range(1000)])/1000
print("The estimated correlation is :{}".format(rho_hat))

#Visualizing the correlation



L = [XY() for i in range(1000000)]
"""def count(sub, S) :
    RF = []
    for i in range(len(sub)-1) :
        RI = []
        for j in range(len(sub)-1) :
            RI.append(sum([(sub[j][0]<= S[k,0]<=sub[j+1][0])*(sub[i][1]<=S[k,1]<=sub[i+1][1]) for k in range(len(S))]))
        RF.append(RI)
    return RF 
sub = [(mu1-3*sigma1+0.02*i,mu2-3*sigma2+0.04*i) for i in range(300)]

P = count(sub,L)

"""
X,Y = [L[i][0] for i in range(len(L))], [L[i][1] for i in range(len(L))]

z = [-(-Y[i]+4*X[i]-3)*(X[i]-1)-(Y[i]-X[i])*(Y[i]-1)for i in range(len(X))]
c= [-z[i]for i in range(len(z))]
plt.close()
plt.scatter(X,Y,c=z)

plt.show()

