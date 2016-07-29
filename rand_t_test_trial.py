import random
from scipy import stats
A=[]
B=[]
for i in range(0,40000):
	A.append(random.normalvariate(5,5))
	B.append(random.normalvariate(5.2,5))

print stats.ttest_ind(A,B, equal_var = True)

