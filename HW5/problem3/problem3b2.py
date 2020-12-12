# -*- coding: utf-8 -*-
"""
Created on Wed Oct 14 05:24:47 2020

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

df = pd.read_csv('data_2.csv',header=0)
df = df[['t','x']]
dataset = df.values
x = dataset[:,0]
y = dataset[:,1]


#fit to A*np.exp(-t/tau1)+B*np.exp(-t/tau2)
init_vals=[0.1,0.1,0.1,0.1]
fits,cov=curve_fit(fitfunction,x,y,p0=init_vals)
print(fits)


plt.scatter(x,y)
plt.plot(x,fitfunction(x,*fits))
plt.show()



######### after trying different initial condiitons, we have the same results,  A=0.55,B=0.466, tau1=1.85,tau2=22.28, x(t)=0.55e^(-t/1.85)+0.466e^(-t/22.28)