import random as rd
import math
run = True

"""Exercise 2"""
"""Question 2"""
def mean_estimate(distribution) :
    return round(1/1000*sum([distribution() for i in range(1000)]),2)

def V():
    return 2*math.pi*rd.random()
if run :
    print("The mean estimated of V = 2piU is :{}".format(round(mean_estimate(V),2)))