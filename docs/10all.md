<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>


# Applications of "Explanation"

Given data divided recursively into a tree with leaf clusters $C_1, C_2,...$, suppose we can guess (or look up) labels $L(C_i)$  for each cluster:

- E.g. all those labels are actually available;
- E.g. those labels were geneated via RRL (so the clusters are numbered left to right, best to worst, 1,2,3,4...);
- E.g. for a small  random sample  per leaf, you actually look up the labels.


Each cluster $C_i$ has a delta $\delta = C_i - Ci$ to another cluster $C_j$. That delta can be measured many ways including:

- E.g. Differences between the cluster centroids (ignoring any deltas that are not statistically significant);
- E.g. the edge distance in the cluster tree (so siblings have a distance of 2).


Then:

|  |Task| Implementation|
|--|----|----------------|
||Localization | take current example, walk it down the cluster tree to find its relevant leaf|
||Anomaly detection|Anomalous if you are far away from everything else in your relevant leaf|
||Certification| Warn if any new example is anomalous. <br>For efficient certification, use compression (see below).|
||Streaming| (a) Collect the anomalies at their nearest cluster; <br> (b) If more than $N$ anomalies, rebuild clusters from that point downwards|
||Classification | Localization + report mode class label in relevant leaf|
||Regression | Localization + report median class label in relevant leaf|
||Pollution marking|(a) Measure the variance or the inaccuracies of predictions at each leaf. <br>(b) Starting at the leaves and working up the tree, delete any note that is too variable or inaccurate.|
||Compression| Report whole contrast tree as just the two distant points (at each level) and the median point (where you cut the data, left right)|
||Optimization| see planning|
||Envy| (a) Localization to find $C_i$. <br> (b) Find other leaves $C_j$ where $L(C_j) > L(C_i)$ |
||Fear| (a) Localization to find $C_i$. <br> (b) Find other leaves $C_j$ where $L(C_j) < L(C_i)$ |
||Contrast| Find the delta between two leaf clusters $C_i$, $C_j$|
||Explain| Report contrasts $C_i$ to $C_j$ as human readable rules|
||Planning| Explanation of contrasts to thing you envy|  
|Maximal|Planning| Planning to the thing you envy the most|  
|Minimal|Planning| Planning that maximizes improvement while  minimizing the change from $C_i$ to $C_j$|
||Monitoring| Explanation of contrasts to thing you fear|  
|Maximal|Monitoring| Monitoring  to the thing you fear the most|  
|Minimal|Monitoring| Monitoring that maximizes loss while minimizing  the change  from $C_i$ to $C_j$|
||Data Synthesis| Generate examples by interpolating between items in each cluster|
||Privatization| Use data synthesis, favoring regions close to other examples (so you can't distinguish new from old)|
|Compressed|Privatization| Only share compressed data (so the data not in the compression is 100% private)|
||Sharing| (a) Pass around the compressed private data to each stakeholder.<br>(b) Each stakeholder only adds in their local data that is anomalous (i.e. do not add in things that are already there)|
||Transfer Learning| After sharing, data from N sources will be all mixed up in the contrast tree (in different leaves). Your local data can then transfer knowledge from other sites by localizing into that space.|


```
   localize
   |classify
   ||regression
   |||explanation

```
