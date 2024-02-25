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

1. Hyperparameter optimization. List all the control variables in RRL and SMO
   - Run a second level SMO to find good values from those variables.
   - So that would be using SMO to optimize SMO.
1. Why not try for things other than just optimization?
   - e.g.  try 2 or 3 of the things [listed here](10all.md)
   - At first, try something simple, like comparing regression or classification against standard data miners (logistic regression,
     random forest regression, decision tree reression [^regression]) to the same task with RRP or SMO.
1. This whole subject has assumed "just a little is best". But is that true?
   - What happens if we use standard optimizers and do $10^4$ to $10^6$ evaluations.
     - There are many such Python packages:
       - Optuna
       - Hyperopt
       - scikit-optimize.github.io
   - The challenge here is that most optimization packages do not start with data
     - Rather, then incude models from which you can generate data
     - e.g  [Pymoo](https://github.com/anyoptimization/pymoo) has hundreds
        of such models
        - See [here](https://pymoo.org/problems/test_problems.html)
        - Try to avoid the really simple ones.
        - The DTLZ models are really widely used (but I fret they are simplistic).
1. The DODGE algorithm tried to evalute a small number of items using a tabu trick [^agrawal]. If ever we do things, pick things
   that are far away from what we picked before.
   - "far away": 
     - pick the "todo" items with max distance to what is currently in "done";
     - pick the "todo" items with least $b+r$ (no seen them before).
1. The rules we generate are model-based summaries, describing volumes of interest.
   - Are these models "weaker" than the instance-based methods? Do they lose important deails?
   - To check, generate rules using RRP or SMO, then see if they are effective.
   - One thing to check here. In the code I gave you, my rules have conjuncts and disjuncts
     - What if we just stay with conjuncts?
1. Its a little strange  that we use instance-based reasoning to select our next thing to try
   then, afterwards, go to rule generation.
   - Would it not be better to replace the instance-based method woth a rule-based method?
   - Replace NB with FFT.  Use, say, B0=6. Note: you will have to implemt FFT trees. not hard.
     But rememember the $2^D$ trick  (generate mulitple trees, pick the best, using _done_, apply
     that to test data).. 
1. Some of the goals we are exploring are a little dull. Can we do better?
   - For https://arxiv.org/pdf/2311.17483.pdf, fig 9, what support can you add to support (say) 5 of the 
     lefthand side reqirements? 
   - This one is challenging. How would you generate the data to explore?
     - But wait! we only need < 30 examples. Does that help us?
1. Why start from scratch? Can we reuse old results:
   - For our larger data sets...
     - Divide the data in half
       - Do what we normally do on the first half
       - When we get to the second half, what can we reuse?
     - Now try messing with the second half so that it is X percent different to the first half.
       - As X increases, can we still reuse stuff from the first half?
       - Are there better ways to handle the first half such that it is easier to explore the second half?
1. We are assuming that our labels are accurate. What is that is not true?

[^agrawal]: A. Agrawal, X. Yang, R. Agrawal, R. Yedida, X. Shen and T. Menzies, "Simpler Hyperparameter Optimization for Software Analytics: Why, How, When?," in IEEE Transactions on Software Engineering, vol. 48, no. 8, pp. 2939-2954, 1 Aug. 2022, doi: 10.1109/TSE.2021.3073242.
keywords: {Software;Optimization;Clustering algorithms;Text mining;Measurement;Computer bugs;Task analysis;Software analytics;hyperparameter optimization;defect prediction;bad smell detection;issue close time;bug reports},

[^regression]: https://scikit-learn.org/stable/search.html?q=regression

## process

- prior knowledge
   - LLMs
   - assume that we've already run a choice session before
     - so divide training data in half
     - do what we nornally do on one half
       - see how quickly we can do it again 
- multiple xperts
  - dont ask one oracle, ask n
  - warning: experts often disagree. how to handle disputes between experts
    - some rig where the level of disagreement is a dial and can crank "disagree" up from 0 to always (with many stops in between)
- management team: milestones management, user liason,
  task priorization
- tooling team: doc, scripts, short cuts, pre-, post- commit hooks
  - please consider pdoc or pycco
- testing team: lots of tests, maintaining the test suite,
  running the test suite, test case prioriization
- coding team; new functionality
  - divide the code base into N bits
- the optimization team. welcome to software 2.0
  - Software 2.0 most often the source code comprises 
   -  the dataset that defines the desirable behavior 
   - the architecture that gives the rough skeleton of the code, 
     but with many details (the config options) to be filled in. 
   - some optimizaion strategy that keeps reviewing the
     data to adjust the config options.

lcocal vs gloab, reset at each stage

check if (b+r)/(b-r) does better

## Tasks
- apply rrp to some new domain (in se)
- x is y and when i code it that way, i get results (for x or y) that
  beat the prior state of the art (simpler and faster or better)
- destroy all this tech. find someway to improta tables
  of data with no goal info and after minimal questions
  learn which rows a preferred by most users
  - note: I don't know how to do this. 
- sway vs sequential model optimize (bayes)
- try different clustering. different recursive bi-cluster
- try a project managers toolkit. 
- try and improve xiao's stuff
- anyway to map subjective opinions (from chatgpt) into search-based?
  - https://arxiv.org/pdf/2311.11081.pdf
  - anyway to bias (in a good way), sway's search using LLMs?   
    - maybe not https://arxiv.org/pdf/2306.13298.pdf (\*)
  - hint: maybe dont use chatgpt but a local LLMso
    - see  "LLMs on the command line" at https://www.infoworld.com/article/3705035/5-easy-ways-to-run-an-llm-locally.html
    - see also https://www.infoworld.com/article/3700869/14-llms-that-arent-chatgpt.html
- testing our tools via chatgpt https://dl.acm.org/doi/pdf/10.1145/3624032.3624035
  - make sure you have a baseline (testing via some other defendable approach)

(\*) but see vivek's paper suggesting that don't matter.

- comapre rrp vs cloassification or regresison algorithms for SE taksks
- Table 1,2 of [this paper](https://csdl-downloads.ieeecomputer.org/trans/ts/5555/01/10314766.pdf?Expires=1703969010&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jc2RsLWRvd25sb2Fkcy5pZWVlY29tcHV0ZXIub3JnL3RyYW5zL3RzLzU1NTUvMDEvMTAzMTQ3NjYucGRmIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNzAzOTY5MDEwfX19XX0_&Signature=vkbhgVvW8l9aPJz9K14TAH178rlS9sBiht6nrLq8X~BcgvnTax~LL6GRoIhRLUVMkmWVgyMW-eSqfi3Pe1WlHb5oMxmQxSSIyz4gN5tjAr3MYergqd4OPSfTxjEm2hN-pBXwVpaeMHZTJ077YMVcTIqMqn9bJmzaOHvhDKYeJa3K~ZmFQuvUzDL4263mT8NQr-nPTi6136O1DmqtxIOKXVpMSddcPhNx~2GWrEX63O7mEkSfS6vBfZpsYXMHqeEkqsoxd3H5SziuAcoHt0kr7ttdYGSUrmjicDXEOd19gXC8ksZmgx2Mw2dBLI-LBEvTsCfgwF0d8ueYR1F3AiFeFw__&Key-Pair-Id=K12PMWTCQBDMDT)
  discussed ways to reduce human fatigure. any work at our scale? (les than 30 questions)
  - R. Casamayor, C. Cetina, O. Pastor and F. Perez, "Studying the Influence and Distribution of the Human Effort in a Hybrid Fitness Function for Search-Based Model-Driven Engineering" in IEEE Transactions on Software Engineering, vol. 49, no. 12, pp. 5189-5202, 2023.
doi: 10.1109/TSE.2023.3329730
- another approach is to do fix the daa drougth via data synthesis
  - take all that is known of the independent attributes
  - generate a very large sample of those attributes. attach known labels. label everything 
    else via (e.g.) expected value k=2 nearest neighbors.
    - then do (say) classification on the result
    - or do optimizaiton and when new isntaces are proposed, apply k=2 nNN.

