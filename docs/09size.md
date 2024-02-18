<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# size

## how may adta points can we get  

## how many data points did we need

starndard view
- more is better (norvig, quotes for SE)

- defect prediction 2006
- daid lo tim menzies tse paper (not ,may)

## how many data points do we want

5-10
Peter C Austin and Ewout W Steyerberg. Events per variable (epv)
and the relative performance of different strategies for estimating
the out-of-sample validity of logistic regression

Peter Peduzzi, John Concato, Elizabeth Kemper, Theodore R
Holford, and Alvan R Feinstein. A simulation study of the number
of events per variable in logistic regression analysis. Journal of
clinical epidemiology, 49(12):1373–1379, 1996

if low recall is ok, 100s per hour

wrong questionL
- where does the data come from (early bird)
- strutural coherence of the data (stream of 1, ext is 1)
  - menzies funciton of # udnerlying dimensions and dicretiona results
  - number of supprt vectors: 200-300

to explore structureal similarity, one of our methods will clsuter before reasoming (to find maximize region similarities)

Zhu, X., Vondrick, C., Fowlkes, C.C. et al. Do We Need More Training Data?. Int J Comput Vis 119, 76–92 (2016). https://doi-org.prox.lib.ncsu.edu/10.1007/s11263-015-0812-2
- numerous examples from facila recongition where face accuracary plateaus after M 100
- no. see https://link-springer-com.prox.lib.ncsu.edu/article/10.1007/s11263-015-0812-2#citeas

- 10 examples per hour (repetory grids)
- a few dozen examples per week

- $C=1-(1-p)^n$

so

$$n(C,p) = \frac{\log(1-C)}{\log(1-p)}$$

Comments
- as the required confidence $C$ grows for .9 to .95 to .99 to  .9999, $n$ grows rapidly  from  45 to 90 to 133 to 179
- for a gaussian, assuming Cohen's rule we are indistinguishable   from
 $\mu +3\sigma$  from at probability $p=.35/6 \approx 0.06$
 $n(C=0.95,p=.35/6)=48

ANd if we have sme trick for sperating these best tor east, then we can find what we want ia v abianr chop $\log_2(n(C=.95,p=.35.6))=5.5$

cogn sci: 7+-2 (for quick decisions)


https://stats.stackexchange.com/questions/1856/application-of-machine-learning-techniques-in-small-sample-clinical-studies

One common rule of thumb is to have at least 10 times the number of training data instances (not to speak of any test/validation data, etc.) as there are adjustable parameters in the classifier. 
