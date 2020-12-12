# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 01:01:14 2020

@author: knkns
"""

import matplotlib.pyplot as plt
import numpy as np
import math		

def logistic_calculate(t):
 return 1/(1+9*math.exp(-t));

def derivative_calculate(t):
    return -9*math.exp(-t)*math.log(1+9*math.exp(-t));
x=0.1;
n=20;
t=2;
dt=0.1;
fdt=np.zeros(n);
data=np.zeros(n);
for i in range(n):	
   x1=logistic_calculate(2);
   tdt= t+ 10^(-i);
   x2=logistic_calculate(tdt);
   x_prime=derivative_calculate(2); 
   fdt[i]= x_prime-(x2-x1)/dt; 

for j in range(n):
    data[j]=j;

plt.plot(data,fdt, color='b') 
plt.xlabel('n',fontsize=12)
plt.ylabel('x_n',fontsize=12)
plt.title('problem1')
plt.savefig('problem1.png')