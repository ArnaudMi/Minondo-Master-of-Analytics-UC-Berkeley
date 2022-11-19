import random as rd
import math

run = True
"""Exercise 1"""
"""Question 1"""

if run :
    print("Values obtained from sampling the uniform distribution U([0;1]) 5 times :{}".format([round(rd.random(),2) for i in range(5)]))
"""Question 2"""
def mean_estimate(distribution) :
    return round(1/1000*sum([distribution() for i in range(1000)]),2)
if run :
    print( "The mean values estimated by sampling the uniform distribution U([0;1]) is :{}".format(mean_estimate(rd.random)))