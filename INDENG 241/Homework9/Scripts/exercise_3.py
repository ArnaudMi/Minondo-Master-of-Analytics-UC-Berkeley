import random as rd
import math

run = False
"""Exercise 1"""
"""Question 1"""
def E() :
    return -2*math.log(1-rd.random())
if run :
    print("Values obtained from sampling the exponential distribution E(1/2) 5 times :{}".format([round(E(),2) for i in range(5)]))


"""Question 2"""
def mean_estimate(distribution) :
    return round(1/1000*sum([distribution() for i in range(1000)]),2)
if run :
    print("The estimated mean value is : {}".format(mean_estimate(E)))
    