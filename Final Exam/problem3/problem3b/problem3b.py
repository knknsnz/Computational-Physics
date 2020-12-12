# -*- coding: utf-8 -*-
"""
Created on Sat Dec 12 02:55:42 2020

@author: knkns
"""


import pandas as pd
import numpy as np
import random
import matplotlib as mp
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def fitfunction(t,A,tau,B):
	return A*np.exp(-t/tau)+B

df = pd.read_csv('problem3b.csv',header=0)
df = df[['t','e1','e2','e3','e4']]
dataset = df.values
x = dataset[:,0]
y1= dataset[:,1]
y2= dataset[:,2]
y3= dataset[:,3]
y4= dataset[:,4]


#fit to A*np.exp(-t/tau)
init_vals=[1,1000,1]
fits,cov=curve_fit(fitfunction,x,y4,p0=init_vals)
print(fits)


plt.scatter(x,y4)
plt.plot(x,fitfunction(x,*fits))
plt.show()