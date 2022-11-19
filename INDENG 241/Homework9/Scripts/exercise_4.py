import math
import random as rd
import matplotlib.pyplot as plt
import numpy as np
from exercise_1 import mean_estimate
from exercise_2 import V
from exercise_3 import E

run = True
"""Exercise 4"""
"""Question 1"""

def N1() :
    return math.sqrt(E())*math.cos(V())
def N2() :
    return math.sqrt(E())*math.sin(V())
if run :
    print("Values obtained from sampling N1 5 times : {}".format([round(N1(),2) for i in range(5)]))
    print("Values obtained from sampling N2 5 times : {}".format([round(N2(),2) for i in range(5)]))

    #Visualising the gaussian

def count(subdivision, samples) :
    return [sum([samples[i]<=subdivision[0] for i in range(2000)])/2000]+[sum([subdivision[j]<samples[i]<=subdivision[j+1] for i in range(2000)])/2000 for j in range(1, len(subdivision)-1)]+[sum([samples[i]>subdivision[-1] for i in range(2000)])/2000]
if run :
    L1 = [N1() for i in range(20000)]
    L2 = [N2() for i in range(20000)]
    L3 = [rd.normalvariate(0,1) for i in range(20000)]


    sub = [-5+0.25*i for i in range(40)]
    x = [sub[i]+0.125 for i in range(40)]

    F1 = count(sub,L1)
    F3 = count(sub,L3)
    plt.close()
    plt.plot(x, [sum(F1[:i]) for i in range(len(F1))], color='brown')
    plt.plot(x, [sum(F3[:i]) for i in range(len(F3))], color = 'green')
    #plt.hist(L1,np.linspace(-3,3,100))
    #plt.hist(L3,np.linspace(-3,3,100))
    plt.xlabel('t')
    plt.ylabel('P(X<t)')
    plt.legend(['distribution of simulated','gaussian distribution'])
    plt.show()


    """Question 2"""
    print("The estimated mean value for N1 is : {}\n For N2 it is : {} ".format(mean_estimate(N1),mean_estimate(N2)))