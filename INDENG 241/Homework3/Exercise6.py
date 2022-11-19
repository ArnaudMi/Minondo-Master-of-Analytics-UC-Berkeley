def q(n):
    L = [1]*3
    i = 0
    while i+2 < n :
        L.append(L[-1]*1/2+L[-2]*1/4+L[-3]*1/8)
        i += 1
    return L[-1]

print(q(10))