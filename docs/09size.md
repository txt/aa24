<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# How much data is enough?

## Standard line: more is better

- “The Unreasonable Effectiveness of Data,” by Google’s then Chief Scientist
  Peter Norvig 
  - “Billions of trivial data points can
    lead to understanding” [^norving11] (a claim he supports with numerous
    examples from vision research).
- In software analytics,  data-hungry researchers assume that if
  data is useful, then even more data is much more useful. For
  example:
  - “..as long as it is large; the resulting prediction performance is likely to be boosted more by the size of the
    sample than it is hindered by any bias polarity that may
    exist” [^rahman13].
  - “It is natural to think that a closer previous release
    has more similar characteristics and thus can help to
    train a more accurate defect prediction model. It is also
    natural to think that accumulating multiple releases can
    be beneficial because it represents the variability of a
    project” [^amasaki20].
  - “Long-term JIT models should be trained using a cache
    of plenty of changes” [^mcintosh17].

[^rahman13]: F. Rahman, D. Posnett, I. Herraiz, and P. Devanbu,
“Sample size vs.  bias in defect prediction,” in Proceedings of the
2013 9th joint meeting on foundations of software engineering. ACM,
2013, pp. 147–157.

[^amasaki20]: S. Amasaki, “Cross-version defect prediction: use
historical data, crossproject data, or both?” Empirical Software
Engineering, pp. 1–23, 2020.

[^mcintosh17]: S. McIntosh and Y. Kamei, “Are fix-inducing changes
a moving target?  a longitudinal case study of just-in-time defect
prediction,” IEEE Transactions on Software Engineering, vol. 44,
no. 5, pp. 412–428, 2017.

[^norvig11]: P. Norvig. (2011) The Unreasonable Effectiveness of
Data. Youtube.  https://www.youtube.com/watch?v=yvDCzhbjYWs

## A more informed position: The question is wrong

- Its the wrong question
  - It depends on the nature of the data
  - e.g. if i show you, one at a time, 100 "1"s then we are pretty sure the 101-th thing will be "1".
  - So if data clusters to regions with not much variance
    - then once we find those regions, we can stop
- And sometimes its not
- strutural coherence of the data (stream of 1, ext is 1)
  - menzies funciton of # udnerlying dimensions and dicretiona results
  - number of supprt vectors: 200-300

<img width="898" alt="image" src="https://github.com/txt/aa24/assets/29195/51809d84-6c32-4d86-849d-0af40273c83f">

to explore structureal similarity, one of our methods will clsuter before reasoming (to find maximize region similarities)

## How many points can we get (time restraits)

How fast can we gather expert oppinion?

- Some can monitor products on an assembly line, 1000s of items per day
  - And there will be some error rate
- But suppose we have a panel of experts?
  - And suppose they have to check with everyone else before making a decision?
  - Then everything they conclude has to be analysed, certified

### Evidence from "Repertory Grids"

A structure interview technique
1. Take three examples $E_1,E_2,E_3$: 
  - Which one is most distant?
  - Along what dimension $D_i$ is it distant?
  - Score those examples on this dimensions. 
2. Goto to step 1.

<img align=600 
     src="https://csdl-images.ieeecomputer.org/mags/so/2007/02/figures/s20534.gif">

Advice on how long to fill in a rep grid?
-

# how many were enough (justorical case studyeis were a few were ok)

- how many should we have

## how may adta points can we get  

results from promise 2008 [^Me08]

[^Me08]: Menzies, T., Turhan, B., Bener, A., Gay, G., Cukic, B., &
Jiang, Y. (2008, May). Implications of ceiling effects in defect
predictors. In Proceedings of the 4th international workshop on
Predictor models in software engineering (pp. 47-54).

-defet prediction down to 50 examples

<img src="platuea.png">

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
