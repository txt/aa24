<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>
     
# Data and mutation

Some details from last week.

Optimizers explore a sapce of options? Where does that data come from?

## Before we beign... remember your seeds

We are about to sample randomly. Which means drawing from a string of random numbers. For reasons of repeatability and debug-ability, we want to be
able to replay that random number generation.

so we do not want realy random numbers

We want psuedo-randoms where 
- Some _seed_ is fiddled to make number1 (and update the seed). 
- Then the seed is fiddled again to make number2 (and update the seed)
- And so on

So if we reset the seed, then we can recereate the same sequence.

So maintain and watch over your seeds!


##  Mutate Parametrically

Say you know the background shape of your data (e.g. gaussian or triangular).

![](https://i.stack.imgur.com/WfSV0.png)

triangles can be skewed

![image](https://github.com/txt/aa24/assets/29195/0ebdf749-c0a2-4768-a575-c7958fbad3c7)

So lets mutate:

```lua
egs={}
eg[1] = {x={10, 7, 4,  10s},
         y={2,3}} --  <== available if we have evalauted this example.

tmu = 3
tlo = 1
thi = 20

cf=0.2

for _,eg in pairs(egs):
  for i,x in pairs(eg.x) do
     if math.random() < cf then eg.x[i] = s.tri(tlo,tmu,thi) end end end
```
Note that as cf drops, we mutate less

Some details

```lua
function s.tri(a,     -- lo
              mode,   -- middle
              b)      -- high
  local c   = (mode-a)/(b-a) -- convert mode to 0..1
  local u,v = r(), r()
  c= (1-c)*math.min(u,v) + c*math.max(u,v)
  return a+(b-a)*c end -- inject back into range
```

And if we were normal:

```lua
function s.norm(mu,sd)
  mu = mu or 0
  sd = sd or 1
  return mu + sd * ((-2 * math.log(r()))^0.5
                        * math.cos(2*math.pi*r())) end
```

And if we knew nothing except the `lo`, `hi` values:

```lua
function s.uniform(lo,hi)
  return lo + math.random()*(hi - lo) end
```

And so on for 100 different distributions (from ![](https://www.itl.nist.gov/div898/handbook/eda/section3/eda366.htm)):

![image](https://github.com/txt/aa24/assets/29195/38a1f698-f11c-420a-9976-8d9114bd3323)


##  Mutate Non-Parametrically

Qhy nake parametric guesses? What not respect the distributions in the data.

Say you ahve some numbers from the domain

```
lst={1,3,5,10,17,18,22,23,28,31,32,34,35,36,38,39,40,43,
     46,47,49,53,55,56,61,65,74,75,76,83,85,87,88,90,91,93,94,95,96,99}
```

You could compute the mean (_sum/n_) or   standard deviation (90th-10th)/2.56

Or, if you are lazy, you could

```lua
function any(a) return a[ math.random(#a) ] end
```

- interpolate
  - `new = any(lst) + f*(any(lst) - any(lst))`
  - if `f` is small, say 0.2, you will get numbers within the list
- if the `new` falls outside of `lo..hi` then you can
  - truncate : `return max(lo, min(hi, new))`
  - wrap: 

## Why optimize?

Next-release planning?
- What to do next?
- Such that next-next is better?
- Sometimes you have to pause in delivering functionality to clients in order to re-organize
- So next release planning is global inference to plan local steps

Beware optimization traps:

- holes and poles
- narrow ridges
- flat terrains with distant ridges


![](https://github.com/timm/tested/raw/main/etc/img/3dfront.png)  


[![](https://github.com/timm/tested/raw/main/etc/img/birds.png)](https://www.youtube.com/watch?v=KnndQgIUraQ)

More generally: Search-based software engineering

![image](https://github.com/txt/aa24/assets/29195/4cef3022-db51-4051-b36c-f647a884e160)

![image](https://github.com/txt/aa24/assets/29195/05b343f4-af0f-46c4-aeef-1c389513b813)



## Data Mining and optimization

Data mining = "what is"; i.e they divide things up. 


Optimization = "what to do" i.e.  tell you where to go.


Optimization problems in life:
- Do the least work for most reward


Essential: you can't always get what you want
- but if you try some time, you just might find, you get what you need


![](https://github.com/timm/tested/raw/main/etc/img/build.png)


Optimization problems in SE:
- What is the smallest set of test cases that covers all branches in this program?
- What is the best way to structure the architecture of this system to enhance its maintainability?
- What is the set of requirements that balances software development cost and customer satisfaction?
- What is the best allocation of resources to this software development project?
- What is the best sequence of refactoring steps to apply to this system?
- These topics are explored in the SE _search-based software engineering_[^sbse][^search] community:
  - Using techniques like local search,  tabu search, simulated annealing, genetic algorithms, 
    and   hill climbing.


The great secret:
- all learners need a little (or a lot) of  optimizers:
https://github.com/timm/tested/raw/main/etc/img/grad.png

![](https://github.com/timm/tested/raw/main/etc/img/grad.png)![](https://github.com/timm/tested/raw/main/etc/img/roc.png)


## Some History: How Rationality Became an Experimental Science


<img align=right src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTen66W99fr6cZWAG9Y1BAguBj2EyQuv8l_umY8QlB1B7cUvF69">


For centuries, philosophers and scientists explored the Platonic goal of total rational decisions. That fell apart when:


- Godel's 1930 incompleteness theorem showed that in any interesting axiomatic system (where "interesting" means "able to at least support integer arithmetic") there exists conclusions that are true, but not reachable from the premises.
- Turing's 1937 work on the halting problem showed that, in the general case, it is not possible to decide beforehand whether or not a computer program is "hard" or "easy" (where "easy" meant "will finish processing some arbitrary input"). More specifically, the halting problem is undecidable over a Turing machine (a general description of all computational processes).


While this sounds like very bad news, it had a curious and profound side effect.
- For Godel and Turing to make their conclusions, they first had to precisely define what it meant to do "computing".
- That definition was precise enough to allow for the construction of the post-WWII new generation of general computers.
- For example, after the war at the Institute for Advanced Studies at Princeton, the engineers designing the next generation of general-purposes computers literally tore apart Turing's books (since they read them so obsessively).


So in a very real sense, the legacy of Turing and Godel's work on "limits to computing" was actually a statement of "how to compute".
- Sure, that computational process had limits but between current human ignorance and those eventual limits lay a very useful middle zone.
- And in that zone, since WWII, we have built UNIX, the Internet, the open source revolution, social and ubiquitous computing, Google, Facebook, Microsoft, etc etc.


<img src="https://c8.alamy.com/comp/HRKNPH/von-neumann-and-oppenheimer-1952-HRKNPH.jpg" align=right width=300>


One of the first pioneers to use Turing and Godel's work was John Von Neumann.
-  Von Neumann was a towering figure in the history of the 20th century. Apart from his seminal contributions to the mathematics of shaped charges, geometry, measure theory, ergodic theory, operator theory, lattice theory, mathematical formulation of quantum mechanics, quantum logic, game theory, mathematical economics, linear programming, mathematical statistics, fluid dynamics, weather systems, etc, etc, etc, etc he also lead the computer work at Princeton's Institute for Advance Studies.
- He was the one who told his engineers to read Turing in such great detail.
- He was also a great fan of Godel's work. In his book Turing's Cathedral, Geroge Dyson documents the extraordinary efforts of Von Neumann in rescuing Godel from the pre-WWII chaos in Europe (after which, he gave Godel an office two doors down from his at Princeton).


Von Neumann was the one of the first to fully appreciate the engineering implications of Turing and Godel's work. In summary:
-  He realized that thanks to Godel and Turing, rationality had just become an experimental science.
- Given that we cannot guarantee what happens when we fire up a computer program, all we can do is "try it and see" what happens next.


Von Neumann's Princeton group was very successfully in selling this idea to the American government.
- As a result, they had funds to build the computers needed for very large scale "try it and see" studies.
- At the height of their research in the 1950s, they were simulating everything from weather effects to stars to atomic bombs:
  - Stellar evolution: simulating the lifetime of the sun, over $10^{14}$ years;
  - Biological evolution: simulation the human life space, over 30 years;
  - Meteorology: simulating 8 hours of atmospheric effects;
  - Shock waves in ballistic: simulating events that happen in the blink of an eye;
  - Nuclear explosions: simulating events over the lifetime of a neutron in a nuclear explosion (a mere 10^{-8}) seconds).
 
## Methods


### When there was very little memory (1950s):


- 1+1 reasoning (one canidate solution and 1 mutant)
- e.g. simulated anneallong:
  - need a way to score $S$ each possibilities
  - repeat for time t=1... N 
    -  $m$= mutant = jiggle( current solution $c$) 
    - if S(c) &gt; S(m) then better so, current = mutant
    - else, maybe if (abs(S(m) - S(c))/t < random()) then current = mutatn
      - i.e. initially (when $t$ is small) ,we take chances
      - this is how we escape local maxima
  - in the following, temperature does DOWN and time goes UP


 
<img src="https://github.com/timm/tested/raw/main/etc/img/Hill_Climbing_with_Simulated_Annealing.gif" width=600 > 


<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/TwoPointCrossover.svg/226px-TwoPointCrossover.svg.png" align=right width=300>


### When there was more memory (1960s):
- m+n rationing (many candidates and many mutants)
- e.g. genetic algorithms [^holland]
  - given an population $P_i$
  - **mutant** some, a little
  - **crossover** (take two "parents" and combine their bits into a "child)
  - new population = $P_{i+1}$ = **select** (prune worse kids) 
  - Typical parameter: 100 individuals, evolved for 100 generations, 1% mutation rate


[^holland]: John H. Holland:
  [Genetic algorithms](http://papers.cumincad.org/data/works/att/7e68.content.pdf)
  Scholarpedia 7(12): 1482 (2012)

![image](https://github.com/txt/aa24/assets/29195/b5558177-3a67-4582-8c5c-2ad3b66ed684)

 
Important ideas from this era:
- stochastic search, is good
  - escapes dead ends, finds novel solutlions
- _domination_ (see 
  [from clustering to optimization](onCluster.md#from-clustering-to-optimization)
- the external archive
  - when generating mutants, draw from a special population of candidates known to be better
      than most others.
  - e.g. Differential evolution [^storn]:
    - Population $P_i$ = 10 items per variable being optimized
    - In generation $G_i$, for $d \in P_i$, pick three other items $a,b,c$ then build $d'$ using
      - let $d'$ have fields $d'_1,d'_2,d'_3..$
      - if cr &lt; random() then $d'_j=a_j  + f(b_j - c_j)$
        - e.g. (cr,f) = 0.5, 0.8
      - replace $d$ with $d'$ if latter is better
    - At end of $G_i$ everything there is better than at least one other solution
      - So $G_{j>i}$ mutates using better and better options


[^storn]: Storn, R.; Price, K. (1997). "Differential evolution - a simple and efficient heuristic for global optimization over continuous spaces". Journal of Global Optimization. 11 (4): 341–359. doi:10.1023/A:1008202821328. S2CID 5297867.


### When there was more CPU (1990s)
- stochastic methods
- e.g ISAMP: run ahead with mutants $m_1 \rightarrow m_2 \rightarrow m_3 ...$,
  reset to start when no further progress seen
  - i.e. run forward as fast as you
  - when nothing new is happening, give up and start again
  - works well when the CPU is fast end evaluation is cheap[^lurch]
- e.g.  GSAT [^gsat]
  - given N clauses to satisfy, makes the change which minimizes the number of unsatisfied clauses 
  - more generally this is called _local search_ 
    -  sometimes mutate at random
    - other times, do a hill climb on just on variable
    - its like sking: sometimes you ski in any direction
      - other times, you just see what happens if you only go backwards and forwards


[^gsat]: Selman, B.; Levesque, H.; and Mitchell, D. 1992.
  [A New Method for Solving Hard Satisfiability Problems](http://www.cs.cornell.edu/selman/papers/pdf/92.aaai.gsat.pdf)
  In Proceedings of the Tenth National Conference on Artificial Intelligence (AAAI-92), 440-446.


[^lurch]: Owen, D., & Menzies, T. (2003, July). 
  [Lurch: a Lightweight Alternative to Model Checking](https://menzies.us/pdf/03lurch.pdf)
  In SEKE (Vol. 3, pp. 158-165).


### When there were more than one goals (2000s)
- 20th century optimization: given N goals, add magic weights and try to change the sum:
  - $\sum_iw_i{\times}G_i$
  - problem: results dependent on $w_i$ 
    - so a standard technique in the 20th century was to re-run the analysis with perturbations to $w_i$
      - tedious
- Then came algorithms that reasoned across Pareto frontier
  - Generate across the whole space, then see you find
  - In the following, the blue lines are the Pareto frontier (all the solutions not dominated by something else)


[![](/etc/img/fairness.png)](https://github.com/timm/tested/raw/main/etc/img/fairness.png)


Important ideas from this era:
- Non-dominated sorting 
  - when binary domination leaves you with too many options
  - the NSGA-II (2003) algorithm sorts frontier the returns the items that dominate the most[^deb]
- Indicator-based dominance: the Zitzler algorithm:
  - multi-objective "better" is a gradient, not some trite binary[^zizt]
- Decomposition (MOEA/D)[^moead]
  - before
    - generate population
    - assign random weights to each item
    - cluster population on that weight (each cluster is one decomposition)
  - during optimization
    - if anyone finds an improvement, drag all your near neighbors along for the right
    - this is FAST since near neighbors are pre-computed and cached
- $\epsilon$ domination: if goal difference less than $\epsilon$ do not matter
  - just optimize to $\epsilon$ and stop.


[^chen]: J. Chen, V. Nair, R. Krishna and T. Menzies, 
 ["Sampling” as a Baseline Optimizer for Search-Based Software Engineering,"](https://arxiv.org/pdf/1608.07617.pdf)
 in IEEE Transactions on Software Engineering, vol. 45, no. 6, pp. 597-614, 1 June 2019, doi: 10.1109/TSE.2018.2790925.


[^moead]; Q. Zhang and H. Li, 
  ["MOEA/D: A Multiobjective Evolutionary Algorithm Based on Decomposition,"](https://core.ac.uk/download/pdf/228200360.pdf)
  in IEEE Transactions on Evolutionary Computation, vol. 11, no. 6, pp. 712-731, Dec. 2007, doi: 10.1109/TEVC.2007.892759.


[![](https://github.com/timm/tested/raw/main/etc/img/epsdom.png)


### When data miners got good (2010)

https://github.com/timm/tested/raw/main/etc/img/sway.png

<img src="https://github.com/timm/tested/raw/main/etc/img/sway.png" width=400 align=right>


- Landscape analysis (simple)
  - Peek at the data
  - Jump away from dull regions [^chen]
- Surrogates
  - Don't evaluate all
  - Evaluate some and use those results and  data mining to build a _surrogate_ (a decision tree that guesses
    what the evaluation scores might be)
  - From then one, evaluate new items using the surrogate (so we no longer have to build every car,
    we only need ask the surrogate a quick question)
  - Note that the surrogate need not give great predictions
    - Just as long as it can guess that $x \lt y$.
- Acquisition functions
  - suppose your data miner can report predictions AND variance on those predictions
  - e.g. random forest with 100 decision trees: count how many agree with some conclusion X
  - sample the data a little, build a little surrogate, apply that surrogate to the rest of the data
  - grab the data item with (say) the most variance [^flash].


[^deb]: K. Deb, A. Pratap, S. Agarwal and T. Meyarivan, 
  ["A fast and elitist multiobjective genetic algorithm: NSGA-II,"](https://pdfs.semanticscholar.org/df2b/c681c725f89218dbabdd53780b42be754c4a.pdf?_ga=2.122853000.2057283161.1673318967-975372106.1668530242)
  in IEEE Transactions on Evolutionary Computation, vol. 6, no. 2, pp. 182-197, April 2002, doi: 10.1109/4235.996017.


[^nair]: Nair, V., Menzies, T., Siegmund, N., & Apel, S. (2017, August). 
  [Using bad learners to find good configurations](https://dl.acm.org/doi/pdf/10.1145/3106237.3106238)
  In Proceedings of the 2017 11th Joint Meeting on Foundations of Software Engineering (pp. 257-267).


[^flash]: Vivek Nair, Zhe Yu, Tim Menzies, Norbert Siegmund, Sven Apel:
 [Finding Faster Configurations Using FLASH](https://arxiv.org/pdf/1801.02175.pdf). 
 IEEE Trans. Software Eng. 46(7): 794-811 (2020)


https://github.com/timm/tested/raw/main/etc/img/smbo.png

![](https://github.com/timm/tested/raw/main/etc/img/smbo.png)


- Other acqusition functions:


![](https://github.com/timm/tested/raw/main/etc/img/gate.png)


[^stork]: Stork, J., Eiben, A.E. & Bartz-Beielstein, T. 
  [A new taxonomy of global optimization algorithms](https://link.springer.com/article/10.1007/s11047-020-09820-4)
  Nat Comput 21, 219–242 (2022). https://doi.org/10.1007/s11047-020-09820-4


[^sbse]: Mark Harman and Bryan F. Jones. Search based software engineering. Information and Software
Technology, 43(14):833–839, December 2001.


[^search]: Mark Harman, S. Afshin Mansouri, and Yuanyuan Zhang. 2012. 
           Search-based software engineering: Trends, techniques and applications. ACM Comput. Surv. 45, 1, Article 11 (November 2012), 61 pages. https://doi.org/10.1145/2379776.2379787
           https://bura.brunel.ac.uk/bitstream/2438/8811/2/Fulltext.pdf


[^simon]: From Wikipeda: Satisficing (satisfy + suffice) =  a decision-making strategy or cognitive heuristic.
          Search through available alternatives till an acceptability threshold is met.i
          Introduced by Herbert A. Simon in 1956 to explain the behavior of decision makers
          under circumstances in which an optimal solution cannot be determined. 
          He maintained that many natural problems are characterized by
          computational intractability or a lack of information, 
          both of which preclude the use of mathematical optimization procedures.
          He observed in 
          his Nobel Prize in Economics speech that "decision makers can satisficed
          either by finding optimum solutions for a 
          simplified world, or by finding satisfactory solutions for a more realistic world.
          Neither approach, in general, 
          dominates the other, and both have continued to co-exist in the world of management science".


### 2020? When background knowledge got good?


Recently, researchers have applied large pre-trained language
models to take a set of domain terms, then expand that to a large one using associations offered by the
language model. For example, Fu et al. [^fu] recently reported success in improving predictions using
BERT to expand the usecase stories vocab [^vocab]. Co-PI Kuttal used transformer-based language models,
specifically, BERT, GPT2, and XLNet, to classify the intent of developer conversations [^kuttal]


[^vocab]: J. Burstein, C. Doran, and T. Solorio, Eds., Proceedings of the 2019 Conference of the North American
Chapter of the Association for Computational Linguistics: Human Language Technologies, NAACL-HLT
2019, Minneapolis, MN, USA, June 2-7, 2019, Volume 1 (Long and Short Papers). Association for
Computational Linguistics, 2019. [Online]. Available: https://aclanthology.org/volumes/N19-1/


So can we use generative language models to create detailed backgorund models? Guide search using that extra information? Here's a crazy idea:


- Researchers in _particle swam optimization_ (PSO) [^pso1]  implements
optimization   as   a set of candidates
"flying around"
(i.e.   being mutated)  a shared space. 
 -  One advantage of this  scheme is that it lends itself to a group performing model maintenance. 
    - In PSO, particles do not just arrive at some location and stop. 
    - Instead, each particle is like a   helicopter buzzing around the landscape. 
    - New model conditions are like a breeze that pushes the particles   some distance across the decision space in a model.  
    - Our particles then must make new decisions as they   negotiate their way back to their preferred positions.   


[^kuttal]: J. A. J. Hart and S. K. Kuttal, “Feasibility of using youtube conversations for pair programming
  intent classification,” in VL/HCC, 2022


[^fu]: M. Fu and C. Tantithamthavorn, “Gpt2sp: A transformer-based agile story point estimation ap-
  proach,” IEEE Transactions on Software Engineering, no. 01, pp. 1–1, mar 5555.


[^pso1]:  J. Kennedy and R. C. Eberhart, “Particle swarm optimization,” in Proceedings of the IEEE International
  Conference on Neural Networks, 1995, pp. 1942–1948


<img align=right src="https://github.com/timm/tested/raw/main/etc/img/pso101.png">
 
Is
 PSO is  a natural method for negotiating  shared solutions.
- Particle velocity   is controlled by     
_inertial_,   _cognitive_, and  
_social_ weights $w,\phi_p,\phi_g$ 
(where $p, g$ are short for "personnel" and "group").
- In a swam of "particles" $p$ 
   "flying around"  
  (i.e. being mutated across a set of vectors),
  then:
  - The $w$ 
   _interia_ factor pushes   $p_i$ along the  
  current direction. 
  - While  the _cognitive_ and 
    _social_ weightings 
    $\phi_p,\phi_g$ pulls $p_i$ towards
    - the best solution found this
  particle or
    - the best solution found by the entire
  swarm of particles. 
  - $w,\phi_p,\phi_g$ serve to  nudge
    $p_i$ to a new direction.


So for current velocity $V_i^t$ and position $V_i$ at time $t$, particle $i$ is updated as follows:


$$V_i^{t+1} = wV_i^t + \phi_pr(P_p - X^t_i) + \phi_gr(P_g - X_i^t)$$ 
 
 (where $P_p$ and $P_q$ are the best solutions found by this particle or the group, respectively; and $r$ is a random number generator)


In this scheme,  PSO's particles  find a balance between   past decisions $w$, the preferences of one explorer 
$\phi_p$, and the preferences made by the team $\phi_g$.
 Stakeholders  gets multiple particles, initialized to:


- An initial random  position within the space of options.
- Or, if the crowd knowledge is available (see next section), 
positioned  admist the crowd knowledge collected for one stakeholder.


Initial particle velocity is  set according to how far, and in what direction, are the ideal answers for each individual (the further  you start from your ideal, the more aggressively you jump towards it). 


New idea:
- add a new term $x$ preference
term $\phi_x$ to
the set $w,\phi_p,\phi_g$  that controls
PSO.    
- The PSO proposed has
different particles assigned to different stakeholders;
and an extra term $\phi_x$ that nudges particles towards/away from  things that this stakeholder likes/dislikes. 
- Weight 
terminology from the domain
   by how  much
  humans like (or loathe) each term.
