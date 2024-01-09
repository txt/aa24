<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# Tricks to Simplify Choice

## Pareto Optimization:

"Give me a fruitful error any time, full of seeds, bursting with its own corrections. You can keep your sterile truth for yourself." ~ Vilfredo Pareto

For $N$ "generations:
- Generate a lot of decisions
- Prune the bad ones
- Use the remaning ones to produce generation $N+1$

E.g. here is 120 generations trying to minimize the $x$ and $y$ values. 
- about 200 gueses per generation
  
![image](https://github.com/txt/aa24/assets/29195/be2c75c7-18b8-4fa0-8838-7e6fbb6f5e0e)

Key concepts:

- **dominance** if $A$ worse than $B$ across $g$ goals, then you are $A$ is said to be dominated by $B$.
- **Pareto frontier** items not dominated by anything else
  
This tactic is used in genetic algortihms [^holland]:
- generation $N+1$ items are  produced by mixing together two good decisions fro generation $N$
- also, add a mutation (less than 5%) to randomly adjust the popualtion (so you don't get stuck in cul de sacs)

[^holland]:  John H. Holland, " Genetic Algorithms", Scientific American, Vol. 267, No. 1 (JULY 1992), pp. 66-73 (8 pages). https://www.jstor.org/stable/24939139

## Automated Support for Better Choices 

### Keys

"In any series of elements to be controlled, a selected small fraction, in terms of numbers of elements, always accounts for a large fraction in terms of effect." ~ Vilfredo Pareto

- THe keys effect

- In those explorations, often it was seen that

_A small number of **key** variables control the rest_
 
Just to state the obvious, there is a clear
connection between  keys and how many choices are required to control a systems.  Specifically: for a system
with keys, we only need to look
at a few keys to 
  understanding and/or critique and/or control  that system. 

Outside of SE, I have seen keys in hospital nutrition analysis [^part] and avionic control systems [^gay]. Within SE, I have seen keys in:

 [^part]: Susan N Partington, Tim J Menzies, Trina A Colburn, Brian E Saelens, and Karen
Glanz. 2015. Reduced-item food audits based on the nutrition environment
measures surveys. American Journal of Preventive Medicine 49, 4 (2015), e23–e33

[^gay10]: Gregory Gay, Tim Menzies, Misty Davies, and Karen Gundy-Burlet. 2010. Auto-
matically finding the control variables for complex system behavior. Automated
Software Engineering 17 (2010), 439–468.

- Defect prediction datasets [^men16] where two to three attributes were
enough to predict for defects
- Effort estimation models [^chen05] where four to eight attributes
where enough to predict for defects;
- Requirements models for NASA deep space missions [^jalali] where
two-thirds of the decision attributes could be ignored while still finding effective 
optimizations; 
- 11 Github issue close time data sets [^rees17]
where only 3 attributes (median) were needed for   effective prediction.

[^men16]: Tim Menzies, Jeremy Greenwald, and Art Frank. 2006. Data mining static code
attributes to learn defect predictors. IEEE transactions on software engineering 33,
1 (2006), 2–13.

[^chen05]: Zhihao Chen, Tim Menzies, Daniel Port, and D Boehm. 2005. Finding the right
data for software cost modeling. IEEE software 22, 6 (2005), 38–46

[^jalali]: Omid Jalali, Tim Menzies, and Martin Feather. 2008. Optimizing requirements
decisions with keys. In Proceedings of the 4th international workshop on Predictor
models in software engineering. 79–86

[^rees17]: Ritch Rees-Jones, Matthew Martin, and Tim Menzies. 2017. Better predictors for
issue lifetime. arXiv preprint arXiv:1702.07735 (2017)

One way to see how many keys are in a system is to ask how many {\em prototypes} (minimum number of examples)  are required to explore that system. 
- At PROMISE"08, the keys were found in 50 examples (selected at random) since the models built from this small sample performed no worse than the models learned from thousands of additional examples [^me08a].
- In 2023 we made a similar observation.  In a study that explored 20 years of data from 250 Github projects with 6000 commits per project (average).
 In that study, the defect models learned from only the first 150 commits were predicted, as well as the models learned from much larger samples [^shrikanth]

[^me08a]: Tim Menzies, Burak Turhan, Ayse Bener, Gregory Gay, Bojan Cukic, and Yue
Jiang. 2008. Implications of ceiling effects in defect predictors. In Proceedings of
the 4th international workshop on Predictor models in software engineering. 47–54

[^shrikanth]: Shrikanth N.C. and Tim Menzies. 2023. Assessing the Early Bird Heuristic (for
Predicting Project Quality). ACM Trans. Softw. Eng. Methodol. 32, 5, Article 116
(jul 2023), 39 pages. https://doi.org/10.1145/3583565

Of course, not all data sets can be explored by a few dozen keys. 
Recently,  we have successfully modeled security violations in 28,750 Mozilla functions with 271 exemplars and 6000 Github commits using just 300 exemplars [^yu19] 
(specifically, after   incremental active
learning, the SVM had   under 300 support vectors). Although 300 is not an especially small
number, it is small enough so that, given (say) two analysts and a month, it would be possible
to review them all.

[^yu19]: Zhe Yu, Christopher Theisen, Laurie Williams, and Tim Menzies. 2019. Improving
vulnerability inspection efficiency using active learning. IEEE Transactions on
Software Engineering 47, 11 (2019), 2401–2420.

### Relax

Don't go for best solution, just one that is near best.

- Rosenthal et al.  [^rosen]  discuss   methods for asserting that
one result is with some small effect of another (i.e. it is “close to”).
- He asserts that
non-parametric tests have less statistical power than parametric ones
  - so he prefers
methods that 
use (1) the Pearson correlation coefficient;
(2) $d$, the
absolute differences normalized by the size of the standard deviation.
  - He comments that “none is intrinsically better than the other”.
  - So lets use $d$.
- In a 2009 paper with 3,000+ citations,  Sawilowsky [^sawil]   <img width="400" align=right alt="image" src="https://github.com/txt/aa24/assets/29195/6245b588-2317-401d-9847-dbdae094841c"> asserts that
  -  “small” and “medium” effects can be measured using  d = 0.2; and d = 0.5; (respectively).
  - Splitting the difference,  we look for things that are within d=.35; of "best"
  - For the "z-curve" (a normal curve of standard deviation = 1),
     - $x$ ranges $-3 \le x \le 3$ 
     - .35 of th $x$ range is $.35/6 {\approx} 0.06%$
  - Hamlet [^hamlet] says that to be be $C$% certain of finding a certain $x_i$ at probability $p$, we need at least 
    $n(C,p)=\frac{\log{1-C}}{\log{1-p}}$ testes.
  - $n(C=.95,p=0.06)\approx 49$ tests.

[^hamlet]:  Hamlet, R. G. (1987). Probable correctness theory. Information processing letters, 25(1), 17-22. Hamlet show that $n$ tests will find an event of proability $p$  with certainty $C(n,p)=1-(1-p)^n$ which rearrages to $n(C,p)=\frac{\log{1-C}}{\log(1-p}}$.
[^rosen]: Rosenthal, R., Cooper, H., Hedges, L.: Parametric measures of effect size. The handbook
of research synthesis 621(2), 231–244 (1994)
[^sawil]: Sawilowsky, S.S.: New effect size rules of thumb. Journal of Modern Applied Statistical
Methods 8(2), 26 (2009)

### Use more X than Y

Consider learning a function $f$ from many examples $x,y$:

$$y_1,y_2,.. = f(x_1,x_2,x_3,x_4,x_5,....)$$

(BTW, some terminology: $y$= goals, dependent variables; $x$=independent variables, controllables, observables.)

In many domains, much easier to collect $x$ than $y$

- e.g. got a car yard,
 - qucikly glance at many cars, list their $x$ e.g. colors, sizes, makes, etc
 - but which car do you $y$ like driving?
- e.g. pick a universirty
     - go on line and find details on $x$ locations, subjects, etc
     - but $y$ it takes years to attend and work out which one you like.
- e.g. can run millions of tests to check for (e.g.) core dumps
  - but in practice, only have time to make a much smaller number of runs

More generally, any process where humans are part of the evaluation means you can only ask a few dozen questions before
- they get tired and make mistakes
- or they have to run away to attend all their other work
  

### Use Pareto pruning
- generate (e.g. interpolate between two near neighbors; crossover two parents)
- select (domination, severl different kinds)
- think (e.g. mutate surivoros)

### Use volumes, points
Rules, not instances

### use neighborhood (don't ask if there is known nearby answer)
- cluster in $x$ space before evaluating
- if you mutate to somewhere better, take your neihgbors in $y$  space with out (MOEA/D) 

### Use Ranking
- better yet, if we can somehow heuristically order the things we are testing, then a binary chop can quickkly find this "as-good-as-best" urn
- returning to the above $\log_2(n(C=.95,p=0.06))\approx 6

### use background knowldge
-  role of LLMs? 

### use surrogates

incremental learn surrogates as you go
-  seqeantial model optimization:  focus on where the surrogate disagrees

