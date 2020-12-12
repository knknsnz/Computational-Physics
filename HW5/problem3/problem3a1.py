# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 04:23:45 2020

@author: knkns
"""

import pandas as pd
import numpy as np
import random
import matplotlib as mp
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def fitfunction(t,A,tau):
	return A*np.exp(-t/tau)

df = pd.read_csv('data_1.csv',header=0)
df = df[['t','x']]
dataset = df.values
x = dataset[:,0]
y = dataset[:,1]
print(x)
print(y)

#fit to A*np.exp(-t/tau)
init_vals=[1,1]
fits,cov=curve_fit(fitfunction,x,y,p0=init_vals)
print(fits)


plt.scatter(x,y)
plt.plot(x,fitfunction(x,*fits))
plt.show()




######### after trying different initial condiitons, we have the same results,  A=0.746, tau=13.51, x(t)=0.746e^(-t/13.51)