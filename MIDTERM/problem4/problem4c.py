# -*- coding: utf-8 -*-
"""
Created on Fri Oct 23 05:07:09 2020

@author: knkns
"""


import numpy as np
import matplotlib.pyplot as plt
import math

n=100
I= np.zeros((n, n))
A=np.zeros((n, n))
for i in range(0,n):
    I[i,i]=1

for i in range(0,n):
    for j in range(0,n):
        A[i,j]=(1+I[i,j])/(n+1)

c=I-A
logA=-c
b=np.linalg.norm(c,ord=2)
j=1

from datetime import datetime
tic = datetime.now()

for i in range(1,n):
    k=i
    for j in range(1,k):
        
            c=np.dot(c,c)
    
            
    logA1=logA-c/(i+1)
    logA=logA1

toc = datetime.now()
print('Elapsed time: %f seconds' % (toc-tic).total_seconds())
