# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 05:10:12 2020

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

df = pd.read_csv('data_1.csv',header=0)
df = df[['t','x']]
dataset = df.values
x = dataset[:,0]
y = dataset[:,1]


#fit to A*np.exp(-t/tau1)+B*np.exp(-t/tau2)
init_vals=[2,2,2,2]
fits,cov=curve_fit(fitfunction,x,y,p0=init_vals)
print(fits)


plt.scatter(x,y)
plt.plot(x,fitfunction(x,*fits))
plt.show()



######### after trying different initial condiitons, we have the same results,  A=0.507,B=0.496, tau1=1.98,tau2=20.27, x(t)=0.507e^(-t/1.98)+0.496e^(-t/20.27)