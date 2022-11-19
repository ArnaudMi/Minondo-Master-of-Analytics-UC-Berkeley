from random import *


def chose1() :
    t = ['AceSpade']+51*['Card']
    a = 0
    for i in range(2) :
        b = randint(0,51-i)
        a += t[b]=='AceSpade'
        t.pop(b)
    return a

def binom(n,m) :
    p = 1
    for i in range(m) :
        p *= (n-i)/(i+1)
    return p
predicted_probability = 1 - (binom(13,5)+binom(12,5)+binom(11,5)-binom(7,5)-binom(6,5)-binom(5,5))/binom(18,5)
new_p = (binom(5,2)*binom(6,2)*binom(7,1)+binom(6,2)*binom(5,1)*binom(7,2)+binom(5,2)*binom(6,1)*binom(7,2)+binom(7,3)*binom(6,1)*binom(5,1)+binom(7,1)*binom(6,3)*binom(5,1)+binom(7,1)*binom(6,1)*binom(5,3))/binom(18,5)
def chose() :
    a = [0,0,0]
    L = ['red']*5 + ['blue']*7 + ['white']*6
    for i in range(5 ) :
        b = randint(0,17-i)
        a[0] += L[b]=='red'
        a[1] += L[b]=='white'
        a[2] += L[b]=='blue'
        L.pop(b)
    return a

N = 0
i = 0
while True :
    N += 1
    a = chose1()
    if a == 1 :
        i += 1
    print("The experimental probability of the event is : {} and : {}".format(float (i)/N,float(2)/52))
