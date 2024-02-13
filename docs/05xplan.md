<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# Explanation
 
## Instances (points) vs Models (volumes)

Some algorithms are instance-based

- that return a bunch of points
- with no generalization beyond those points
- e.g. a nearest neighbor classifier will give you a prediction
  - but no summary of  the data
  - no sense of "why" that conclusion was made.

Some algorithms are model-based:

- Training data is turned into a model
- Predictions are made from the model
- THis approach returns conclusions _and_ some summary of the data

For example, here is a model called  "fast and frugal tree":

- designed for fast comprehsnabilty
- binary tree, max depth = small (say, 3,4,5)
  - each node is either a decision or a sub-tree.
  - For binary classification, each node can exit to either class X or class Y
    - so there are $2^D$  possible trees of depth $D$
- [background theory](https://pure.mpg.de/rest/items/item_2100099/component/file_2100098/content)
- [code](https://github.com/ndphillips/FFTrees) in "R"
- the standard example: 

![](https://github.com/ndphillips/FFTrees/blob/master/man/figures/README-example-heart-plot-1.png)

Technical detail: 

- Bottom right, generate all possible $2^D$ trees, show their performance.
- See Chen et al. 2018 [^chen18] for a study that
  - Used  $D=4$,
  - Built all $2^D$  trees and assessed them on the training data. 
  - Best tree was then applied to the test data. 
  - This approach _destroyed_ the opposition (see Figures 3,4)

[^chen18]: Di Chen, Wei Fu, Rahul Krishna, and Tim Menzies. 2018. Applications of psychological science for actionable analytics. In Proceedings of the 2018 26th ACM Joint Meeting on European Software Engineering Conference and Symposium on the Foundations of Software Engineering (ESEC/FSE 2018). Association for Computing Machinery, New York, NY, USA, 456–467. https://doi-org.prox.lib.ncsu.edu/10.1145/3236024.3236050 https://arxiv.org/pdf/1803.05067.pdf#page=8


## Theories of Explanation

### Theory1. Explanation = small rules

Larkin et al. [^larkin] characterize human expertise in terms of:

- a  very
small short term memory, or STM (used as a temporary scratch
pad for current observation) 
- and a very large long term memory,
or LTM. 

The LTM holds separate tiny rule fragments that explore
the contents of STM to say “when you see THIS, do THAT”. 
- When
an LTM rule triggers, its consequence can rewrite STM contents
which, in turn, can trigger other rules.

Short term memory is very small, perhaps even as small as four
to seven items [^ma13]

[^larkin]: Jill Larkin, John McDermott, Dorothea P. Simon, and Herbert A. Simon. 1980.
Expert and Novice Performance in Solving Physics Problems. Science 208,
4450 (1980), 1335–1342. DOI:http://dx.doi.org/10.1126/science.208.4450.1335
arXiv:http://science.sciencemag.org/content/208/4450/1335.full.pdf

[^ma13]: Recently, Ma et al. used evidence from neuroscience and functional MRIs to
argue that STM capacity might be better measured using other factors than “number of
items”. But even they conceded that “the concept of a limited (STM) has considerable
explanatory power for behavioral data”. Wei Ji Ma, Masud Husain, and Paul M Bays. 2014. Changing concepts of working
memory. Nature neuroscience 17, 3 (2014), 347–356.

- Experts are experts, says Larkin et al.  
because the patterns in their LTM patterns dictate what to do,
without needing to pause for reflection. 
- Novices perform worse
than experts, says Larkin et al., when they fill up their STM with
too many to-do’s where they plan to pause and reflect on what to
do next.
-  Since, experts post far fewer to-do’s in their STMs, they
complete their tasks faster because (a) they are less encumbered
by excessive reflection and (b) there is more space in their STM
to reason about new information. 

While first proposed in 1981,
this STM/LTM theory still remains relevant [^ma13]
(but see a more nuanced view of STM, [here](https://a-levelpsychology.fandom.com/wiki/Cognitive_Psychology)). This theory can
be used to explain both expert competency and incompetency in
software engineering tasks such as understanding code [^wieden].

[^wieden]: Susan Wiedenbeck, Vikki Fix, and Jean Scholtz. 1993. Characteristics of the
mental representations of novice and expert programmers: an empirical study.
International Journal of Man-Machine Studies 39, 5 (1993), 793–812.[^]

[^phillips]: Nathaniel D Phillips, Hansjoerg Neth, Jan K Woike, and Wolfgang Gaissmaier. 2017. FFTrees: A toolbox to create, visualize, and evaluate fast-and-frugal decision trees. Judgment and Decision Making 12, 4 (2017), 344–368.

Phillips et al. [^phillips] discuss how models containing tiny rule fragments can be quickly comprehended by doctors in emergency
rooms making rapid decisions; or by soldiers on guard making snap
decisions about whether to fire or not on a potential enemy; or by
stockbrokers making instant decisions about buying or selling stock.

- That is, according to this   theory   humans best understand a model:
  - When they can “fit” it into their LTM; i.e., when that model
comprises many small rule fragments;
  - Further, to have an expert-level comprehension of some domain
meaning having rules that can very quickly lead to decisions,
without clogging up memory.

### Theory2. Explanation =  inference

When we explain something, we do **not** just spit out some trite rule.

- Rather, we reflect over the current context, the goals and background knowledge of the audience
- To generate some artifact that is appropriate in that context for those goals, given that background knowledge.

We partially honor this definition in RRP:

- by building our clusters, 
- then offering a different cluster for the
delta between each pair of clusters

### Theory3,4,5,6,7.... . 

So many other theories of explanation.

<img align=right src="xplan1.png" width=400><img align=right src="xplan2.png" width=400>

That's one theory of "explanation". There are many more [^vilone] [^linardatos].

[^vilone]: Vilone, G., & Longo, L. (2020). Explainable artificial intelligence: a systematic review. arXiv preprint [arXiv:2006.00093.](https://arxiv.org/pdf/2006.00093.pdf)
[^linardatos]: Linardatos, Pantelis, Vasilis Papastefanopoulos, and Sotiris Kotsiantis. "Explainable ai: A review of machine learning interpretability methods." Entropy 23.1 (2020): 18. https://www.mdpi.com/1099-4300/23/1/18/pdf

<br clear=all>

<img align=right src="xplan3.png" width=400>

In fact "explanation" is often cited as core sub-routine in 40+ AI tasks.

- Why?
- Well, to explain "it" means summarization  "it" then somehow exercising that summary
- So you can't explain "it" without doing "it"
- Explanation is... everything?
   - Once you clarify "explanation" in logical terms [^menzies96], that clarification also covers many other tasks
    (validation, prediction, classification,   tutoring, qualitative reasoning, planning, monitoring, set-covering diagnosis, and consistency-based diagnosis).
- So once you can explain "it" you can do "it", simpler
  - So the explanation module replaces the thing it is explaining?

[^menzies96]: Tim Menzies, [Applications of abduction: knowledge-level modelling](menzies1.pdf), Int. J. Human–Computer Studies (1996) 45, 305–335