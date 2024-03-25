<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>
     
# Data and Mutation and Inference

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

But why make parametric guesses? What not just draw from the data at hand. The data knows its own distributons. Why not use it>

You'll need at least a few   numbers from the domain:

```
lst={1,3,5,10,17,18,22,23,28,31,32,34,35,36,38,39,40,43,
     46,47,49,53,55,56,61,65,74,75,76,83,85,87,88,90,91,93,94,95,96,99}
```

With these you could compute the mean (_sum/n_) or   standard deviation (90th-10th)/2.56 then go Gaussian.

Or, if you dontknow what distribution to use, you could you could just draw from the data:

```lua
function any(a) return a[ math.random(#a) ] end
```

- interpolate
  - `new = any(lst) + f*(any(lst) - any(lst))`
  - if `f` is small, say 0.2, you will get numbers within the list
- if the `new` falls outside of `lo..hi` then you can
  - truncate : `return max(lo, min(hi, new))`
    - trucanting a lot drives numerics up to `hi` or down to `lo` (like soliders walking in a straingt line till they nump into walls)
    - so instead, wrap
  - wrap:
    -  `below, above = lo - x, x - hi`
    - `if below > 0 then return hi - (below % (hi-lo))`; i.e. wrap around from top
    - `if above > 0 then return lo + (above % (hi - lo)); i.e. wrap around from bottom

By what about when you  mutating vectors, not points?
- how to maintain the associations between items in the vector (e.g. do not mutate such that whales have wings or men can get pregnant)
- tactic1: constraint rule
  - have an explicit constraint predicate that checks (e.g.) if `day=saturday then sleepLate=true end`
  - ok for simple constraints.
- tactic2: for complex constraints,
    - use a theorem prover that will only generate vectors that satisfy the constraints
    -  e.g. if all your variables are boolean, try [picoSat](https://fmv.jku.at/picosat/).
    -  and if all your variables come from numbers, lists, etc, try [Z3](https://microsoft.github.io/z3guide/).
- tactic3: muate by vector
  - let `F` be the amount you want to mutate.
    - e.g. F=0.1
  - let `CF` by the cross-over frequency
    -e g. CF = .5
  - pick three vectors
    - a = [1,2,3,4]
    - b = [10,20,30,40]
    - c  =[15,25,35,45]

```lua
def delta(       a,b,c): return a+F*(b-c)
def crossover(   a,b,c): return delta(a,b,c) if math.random() < CF else a 
def vectorMutate(a,b,c): retrun [delta(a[i], b[i], c[i]) for i,_ in enumuerate(a)]
``` 

e..g. a + F*(b-c) = [1,2,3,4] + [1,1,1,1] = [2,3,4,5] 

## From Mutation to Optimization

In the following, the "energy function" is the thing that gets the y-labels. We will assume below that more enegery is better (but that could be reversed).

Simulated annealing

```python
def SIMULATED-ANNEALING(problem, schedule, CF=0.3, F=0.3)
  returns: a solution state
  current ← problem.INITIAL-STATE
  for t = 1 to Tmax do
     T ← schedule(t)  # e.g. T=t
     if T = 0 then return current 
     next ← mutate(current,CF,F)   # often just assuming uniform distributions and wrapping
     ΔE ← VALUE(next) - VALUE(current)  
     if ΔE > 0 then current ← next  
     else current ← next only with probability eΔE/T # initially, jump out of local maxima
  return current
```

Max walk sat (often applied to vectors of boolean values or low arity)

- change mutuate to always change only one attribute
- half the time, change at random
- half the time, run up and down the range of that attribute looking the the seting with highest energy (best solution)

DE = Differential evolution

- if optimizing n variables, create a vector for n*NP randomly assigned solutions
- for G generations
    - for every item X in frontier
       - pick three other items at random (a,b,c)
       - build a new solution using `vectorMutate`
       - replace X if new better than X

I've had a lot of success with DE
