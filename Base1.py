import math
import scipy.optimize
x=float(input())
y=float(input())

r=eval('0.3/math.sqrt((x-0.7)**2+y**2)-0.7/math.sqrt((x-0.3)**2+y**2)-0.5*(x**2+y**2)')

#def f(x): 
#    return 0.3/math.sqrt((x-0.7)**2)-0.7/math.sqrt((x-0.3)**2)-0.5*(x**2)
#
#max_x = scipy.optimize.fmin(lambda x: -f(x), 1)

print(r)