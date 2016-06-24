# -*- coding: utf-8 -*-
"""
Created on Fri Jun 24 18:43:12 2016

@author: bruno
"""
import sys
reload(sys)
sys.setdefaultencoding("utf-8")

import numpy as np
import matplotlib.pyplot as plt

N = 5

#Carcinoma
#menMeans = (0.8070, 0.4944, 0.7501, 0.4908, 0.8133)
#menStd = (0.0290, 0.0917, 0.0369, 0.0478, 0.0346)
#womenMeans = (0.8053, 0.4804, 0.7595, 0.1729, 0.7972)
#womenStd = (0.0285, 0.0924, 0.0350, 0.0705, 0.0355)

#Moderate Dysplastic
#menMeans = (0.6183, 0.2491, 0.5990, 0.2820, 0.7683)
#menStd = (0.0400, 0.0657, 0.0432, 0.0395, 0.0300)
#womenMeans = (0.6579, 0.2001, 0.6447, 0.1931, 0.7572)
#womenStd = (0.0388, 0.0644, 0.0402, 0.0734, 0.0306)

#Normal Intermediate
menMeans = (0.1236, 0.0360, 0.4973, 0.0049, 0.2942)
menStd = (0.0371, 0.0078, 0.0482, 0.0033, 0.0491)
womenMeans = (0.1372, 0.0266, 0.3475, 0.0032, 0.2550)
womenStd = (0.0316, 0.0079, 0.0473, 0.0043, 0.0402)

ind = np.arange(N)  # the x locations for the groups
width = 0.35       # the width of the bars

fig, ax = plt.subplots()
rects1 = ax.bar(ind, menMeans, width, color='b', yerr=menStd, ecolor='black')

rects2 = ax.bar(ind + width, womenMeans, width, color='y', yerr=womenStd, ecolor='black')

# add some text for labels, title and axes ticks
ax.set_title('Normal Intermediate')
ax.set_ylabel('Índice de Dice')
ax.set_xticks(ind + width)
ax.set_xticklabels(('Otsu', 'K-means', 'Renyi', 'Region', 'FCM'))
ax.legend((rects1[0], rects2[0]), ('Média Artimética', 'Soma Simétrica'),loc='upper right', fancybox=True, shadow=False, fontsize='small')

plt.ylim(0, 1)
plt.tight_layout()
plt.savefig('normal.eps', format='eps')
plt.show()