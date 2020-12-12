# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 04:50:44 2020

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

df = pd.read_csv('data_2.csv')
df = df[['t','x']]
dataset = df.values
x = dataset[:,0]
y = dataset[:,1]
print(x)
print(y)

#fit to A*np.exp(-t/tau)
init_vals=[3,1]
fits,cov=curve_fit(fitfunction,x,y,p0=init_vals)
print(fits)


plt.scatter(x,y)
plt.plot(x,fitfunction(x,*fits))
plt.show()




######### after trying different initial condiitons, we have the same results,  A=0.717, tau=14.43, x(t)=0.615e^(-t/14.43)