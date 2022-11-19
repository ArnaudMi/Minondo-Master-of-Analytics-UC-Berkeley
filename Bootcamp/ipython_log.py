
# IPython log file

get_ipython().run_line_magic('lsmagic', '')
get_ipython().run_line_magic('logon', '')
get_ipython().run_line_magic('logstart', '')
a = 5
b = 6
c = 7
get_ipython().run_line_magic('pwd', '')
logoutget_ipython().run_line_magic('logoff', '')
def function() :
    s = 0
    for i in range(1000) :
        s += 1 / (i + 1) * (i + 1)
    return sqrt(s*6)
function()
import numpy as np
def function() :
    s = 0
    for i in range(1000) :
        s += 1 / (i + 1) * (i + 1)
    return sqrt(s*6)
import numpy as np
def function() :
    s = 0
    for i in range(1000) :
        s += 1 / (i + 1) * (i + 1)
    return np.sqrt(s*6)
function()
import numpy as np
def function() :
    s = 0
    for i in range(1000) :
        s += 1 / ((i + 1) * (i + 1))
    return np.sqrt(s*6)
function()
get_ipython().run_line_magic('magic', '')
cmd
alias_name
get_ipython().run_line_magic('alias', 'alias_name cmd')
get_ipython().run_line_magic('alias_name', '')
get_ipython().run_line_magic('timeit', 'range(2)')
get_ipython().run_line_magic('whos', '')
