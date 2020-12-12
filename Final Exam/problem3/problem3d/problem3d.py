# -*- coding: utf-8 -*-
"""
Created on Sat Dec 12 04:56:10 2020

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

df = pd.read_csv('problem3d.csv',header=0)
df = df[['t','c1','c2','c3','c4']]
dataset = df.values
x = dataset[:,0]
y1= dataset[:,1]
y2= dataset[:,2]
y3= dataset[:,3]
y4= dataset[:,4]


#fit to A*np.exp(-t/tau)
init_vals=[1,10000]
fits,cov=curve_fit(fitfunction,x,y4,p0=init_vals)
print(fits)


plt.scatter(x,y4)
plt.plot(x,fitfunction(x,*fits))
plt.show()