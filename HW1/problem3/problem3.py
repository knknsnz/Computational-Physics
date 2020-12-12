# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 02:33:55 2020

@author: knkns
"""


import numpy as np  #import numpy, for arrays
import math			#import math, for power and abs

v1=[1]*3
v2=[1]*3
a=[1]*3
b=[1]*3
for i in range(3):
    a[i]=i+1

v1=a;
ab= a[1]*b[1]+a[2]*b[2]+a[0]*b[0];
d=ab/(a[1]**2+a[2]**2+a[0]**2);

for i in range (3):
     v2[i]=b[i]-d*a[i]

c_square= (b[1]**2+b[2]**2+b[0]**2)/(v2[1]**2+v2[2]**2+v2[0]**2);

c= math.sqrt(c_square);