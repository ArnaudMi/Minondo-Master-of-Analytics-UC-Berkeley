def binom(n,m) :
    s = 1
    for i in range(m) :
        s*= (n-i)/(i+1)
    return s
def p_ge(k) :
    s = 0
    for i in range(k) :
        s+= binom(200,i)*(1/5)**i*(4/5)**(200-i)
    return 1-s
print(p_ge(20))