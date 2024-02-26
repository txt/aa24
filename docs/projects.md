<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# Project Ideas

Case study data: [here](https://github.com/txt/aa24/tree/main/data)

Basic idea:
- given RRP and SMO
- invent a small variant to these algorithms
- test them, using the stats tests shown in lectures

Or
- think of something cool based on this subject's work
- do it

Full idea:
- there will be much structure offered from that report, soon.
- 8 page document,  Latex, pdf, etc etc

Remember in all the following, we want to:

- Compare some new idea against some baseline
  - How to find a baseline? suppose someone has NOT had this class. What algorithm would they turn use?
  - And that comparison requires  20 random repeats comparing  your methods to that baseline.

## Cool ideas (maybe you have better)

(Warning assessing the following very carefully. Some are **HARD**.)

1. What are you great ideas?
   - Run them by me first but go go go!
1. When to stop sampling from `done`? if we track the successes seen so far, can we fit a curve to that shape to learn when (e.g.) further improvement is tapering off?
   - Maybe using nump usibg `polyfit` : z = `np.poly1d(np.polyfit(x,y,2))`
   = Maybe usinga [scikitlearn](https://stats.stackexchange.com/questions/58739/polynomial-regression-using-scikit-learn)a (see [tutorial](https://machinelearningmastery.com/curve-fitting-with-python/).
1. Currently, my results suggest SMO and better than RRP. But how much of that is due to our choice of clustering algorithm?
   - There are so many [others clustering algorithms](https://scikit-learn.org/stable/modules/clustering.html).
   - Which might be better?
1. One of my grad students, Andre Lustosa, argues that the RRP optimizer should not prune as it goes [^lustosa23] but rather:
   - build the whole tree $T$ (with no reference to the y-labels)
   - then prune $T$ to $T'$ by finding the biggest subtree with fewest differences  their centroids where-- if one subtree was pruned-
     the difference between the sum of the x-value entries before prune and after prune is maximal
     - then look at the y-values of their centroids, then prune the half associated with worst y-value
   - then keep pruning $T'$ to $T''$, until you get down to $\sqrt{N}$. 
   - then call boring old RRP on the surviving $\sqrt{N}$ examples.
1. Hyperparameter optimization. List all the control variables in RRL and SMO
   - Run a second level SMO to find good values from those variables.
   - So that would be using SMO to optimize SMO.
1. Why not try for things other than just optimization?
   - e.g.  try 2 or 3 of the things [listed here](10all.md)
   - At first, try something simple, like comparing regression or classification against standard data miners (logistic regression,
     random forest regression, decision tree regression [^regression]) to the same task with RRP or SMO.
1. This whole subject has assumed "just a little is best". But is that true?
   - What happens if we use standard optimizers and do $10^4$ to $10^6$ evaluations.
     - There are many such Python packages:
       - Optuna
       - Hyperopt
       - scikit-optimize.github.io
   - The challenge here is that most optimization packages do not start with data
     - Rather, then include models from which you can generate data
     - e.g  [Pymoo](https://github.com/anyoptimization/pymoo) has hundreds
        of such models
        - See [here](https://pymoo.org/problems/test_problems.html)
        - Try to avoid the really simple ones.
        - The DTLZ models are really widely used (but I fret they are simplistic):
          - and [DF](https://pymoo.org/problems/dynamic/df.html) looks pretty cool.
1. The DODGE algorithm tried to evaluate a small number of items using a tabu trick [^agrawal]. If ever we do things, pick things
   that are far away from what we picked before.
   - "far away": 
     - pick the "todo" items with max distance to what is currently in "done";
     - pick the "todo" items with least $b+r$ (no seen them before).
1. The rules we generate are model-based summaries, describing volumes of interest.
   - Are these models "weaker" than the instance-based methods? Do they lose important devils?
   - To check, generate rules using RRP or SMO, then see if they are effective.
   - One thing to check here. In the code I gave you, my rules have conjuncts and disjuncts
     - What if we just stay with conjuncts?
1. Its a little strange  that we use instance-based reasoning to select our next thing to try
   then, afterwards, go to rule generation.
   - Would it not be better to replace the instance-based method with a rule-based method?
   - Replace NB with FFT.  Use, say, B0=6. Note: you will have to implement FFT trees. not hard.
     But remember the $2^D$ trick  (generate multiple trees, pick the best, using _done_, apply
     that to test data).. 
1. Why start from scratch? Can we reuse old results:
   - For our larger data sets...
     - Divide the data in half
       - Do what we normally do on the first half
       - When we get to the second half, what can we reuse?
     - Now try messing with the second half so that it is X percent different to the first half.
       - As X increases, can we still reuse stuff from the first half?
       - Are there better ways to handle the first half such that it is easier to explore the second half?
1. We are assuming that our labels are accurate. What is that is not true?
   - What if your Y labels come from N oracles who disagree X percent of the time (say 10,20,30,40% of the time).
   - Which of our methods can handle this uncertainty best?
   - Can we adjust our methods to better handle uncertainty?
1. Table 1 of this paper [^casamayor] discussed ways to reduce human fatigue. Any of their methods work at our scale? (les than 30 labels)?
1. Another approach than the one  to do fix the data drought via data synthesis
   - Take all that is known of the independent attributes
   - Generate a very large sample of those attributes. Attach known labels. Label everything 
     else via (e.g.) expected value k=2 nearest neighbors.
1. Lets do LLM stuff?
   - Anyway to map subjective opinions (from chatgpt) into search-based?
     - https://arxiv.org/pdf/2311.11081.pdf
   - anyway to bias (in a good way), our  search using LLMs?    Don't ask the data for labels, but ask an LLM
     - maybe not https://arxiv.org/pdf/2306.13298.pdf (\*)
   - hint: maybe dont use chatgpt but a local LLMso
     - see  "LLMs on the command line" at https://www.infoworld.com/article/3705035/5-easy-ways-to-run-an-llm-locally.html
     - see also https://www.infoworld.com/article/3700869/14-llms-that-arent-chatgpt.html
1. Some of the goals we are exploring are a little dull. Can we do better?
   - For https://arxiv.org/pdf/2311.17483.pdf, fig 9, what support can you add to support (say) 5 of the 
     lefthand side requirements? 
   - This one is challenging. How would you generate the data to explore?
     - But wait! we only need < 30 examples. Does that help us?

[^lustosa23]: Andre Lustosa and Tim Menzies. 2023. Learning from Very Little Data: On the Value of Landscape Analysis for Predicting Software Project Health. ACM Trans. Softw. Eng. Methodol. Just Accepted (November 2023). https://doi.org/10.1145/3630252

[^agrawal]: A. Agrawal, X. Yang, R. Agrawal, R. Yedida, X. Shen and T. Menzies, "Simpler Hyperparameter Optimization for Software Analytics: Why, How, When?," in IEEE Transactions on Software Engineering, vol. 48, no. 8, pp. 2939-2954, 1 Aug. 2022, doi: 10.1109/TSE.2021.3073242.
keywords: {Software;Optimization;Clustering algorithms;Text mining;Measurement;Computer bugs;Task analysis;Software analytics;hyperparameter optimization;defect prediction;bad smell detection;issue close time;bug reports},

[^regression]: https://scikit-learn.org/stable/search.html?q=regression

[^casamayor]: R. Casamayor, C. Cetina, O. Pastor and F. Perez, "Studying the Influence and Distribution of the Human Effort in a Hybrid Fitness Function for Search-Based Model-Driven Engineering" in IEEE Transactions on Software Engineering, vol. 49, no. 12, pp. 5189-5202, 2023.
doi: 10.1109/TSE.2023.3329730
