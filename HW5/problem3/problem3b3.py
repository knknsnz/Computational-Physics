# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 05:32:34 2020

@author: knkns
"""


import pandas as pd
import numpy as np
import random
import matplotlib as mp
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def fitfunction(t,A,B,tau1,tau2):
	return A*np.exp(-t/tau1)+B*np.exp(-t/tau2)

df = pd.read_csv('data_3.csv',header=0)
df = df[['t','x']]
dataset = df.values
x = dataset[:,0]
y = dataset[:,1]


#fit to A*np.exp(-t/tau1)+B*np.exp(-t/tau2)
init_vals=[3,3,3,3]
fits,cov=curve_fit(fitfunction,x,y,p0=init_vals)
print(fits)


plt.scatter(x,y)
plt.plot(x,fitfunction(x,*fits))
plt.show()



######### after trying different initial condiitons, we have the same results,  A=0.439,B=0.08, tau1=17.53,tau2=1.83, x(t)=0.439e^(-t/17.53)+0.08e^(-t/1.83)