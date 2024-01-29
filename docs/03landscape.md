<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>


# Landscape Analysis and Recursive Random Projections

The motto on SMO might be, learn a little, find regions of doubt, try there.

The motto of RRP is "look before your leap".

RRP is a landscape analysis technique:
- for _y=f(x)_ ,
  - if _x_ is cheap to explore but _y_ is expensive
  - look for patters in the independent _X_ variables
    - before exploring the _Y_ s
  - e.g in the following picture, if _y_ is some vertical goal function, then the other
    two dimensions are the _x_ choices

For multi-goal-reasoning, it is useful to consider things as two spaces, the _X_ s and the _Y_ s
(so _f_ is the magic that bridges _X_  s to  _Y_ s)

<img src="xy.png" width=600>

In _Y_ space, many algorithms work in _generations_, find the best fo far (pruning the rest) then designing the next generation solution from the Pareto frontier seen so far,
- **Definition:** The Pareto frontier is a set of solutions that represents the best trade-off   between all  the      objective functions

<img src="https://github.com/timm/tested/raw/main/etc/img/evolve.png" width=600>

To know the landscape is to know how to optimize, how to avoid getting stuck on being over-adapted (hence overspecialized) on some local peak, when as Stewart Brand so aptly puts it...

- "Whole mountain ranges of opportunity could be glimpsed in the distance, but getting to them involved venturing 'downhill' into regions of lower fitness".

Studying such landscapes made Brand distrust claims for "optimality" since what you call "optimum" may actually be just a stepping zone to a better place.
 
<img src="rabbits.jpeg" align=right width=600>

Brand's favorite landscape comes from a 1932 genetics paper[^wright] that discusses how different breeding strategies respond well (or badly) to environmental pressures. In the following, the horizontal and vertical axis represent combinations of genetic choices
(e.g.   "length of hair"   "body weight", "how fast can u run?") and the contours  might "probability of winning a fight".

- Each frame represents different evolutionary scenarios and their impact on the population in question.
- Frame C differs from the other five frames in that it represented a changing environment, which would create a dynamic landscape, so the population is shown tracking a moving landscape by the arrow.

[^wright]:  The Roles of Mutation, Inbreeding, crossbreeding and Selection in Evolution. Wright, S. Proceedings of the XI International Congress of Genetics, 8:209-222, 1932.



Once you get this diagram, you'll never un-see it. 

- The world as you know it, will no longer be merely three-dimensional. 
- Instead as you walk down the street, you
will realize you are walking a landscape to maximize shade, minimize travel time, minimize distance
to coffee shop and dry-cleaners, etc. etc, etc.


FYI, while it is not commonly stated, in my view,
Landscape analytics generalizes a range of
algorithms from different fields:

- When used on the _𝑋_ shape, landscape analytics might be called “clustering”.
- And once we find what parts of _X_ parts to what parts of _Y_ then we can do prediction
  (regression and classification to predict numbers and symbols)
- And the delta between different parts of the landscape (with dufferent _Y_ scores)
  might be called "planning" or "optimizaton"
- When used on the _𝑋, 𝑌_ shape, if we only sample a few times at each part of
  the landscape, then limited sampling might be called “semi-supervised learning”;
- Similarly, in a joint analysis of the _𝑋, 𝑌_ shape, if we bias our “leaps” towards regions that (in
the past) had good _𝑌_ scores,
  - landscape analytics might be called “reinforcement learning”.
- And if we use landscape analytics to jointly explore the _Y_ goals such as performance
   shapes, then this could be called
   “hyperparameter optimization”


[^malan]:  Katherine M. Malan. 2021. A Survey of Advances in Landscape Analysis for Optimisation. Algorithms 14, 2 (2021), 40.
https://doi.org/10.3390/a14020040

In a recent survey of landscape analytics methods, Malan [^malan]  reports no less than 33 “families” of landscape analytics methods. 
- Most
of these methods tend to enumerate the whole landscape, before exploring it. 
- I.e. much eval of the _Y_ values 
- So I do as much landscape analysis in _X_ spacee, then only ask for _Y_ isa few spots

## Lets go Look at the Landscape

Given some distance measure: 

$$ d(a,b)=\sqrt{\sum_i(a_i-b_i)^2} $$

Then lets peek at the landscape:

- Using just the independent $x$ values,
- Find two distance points (sort them by distance to heaven)
- Draw a line between them
- Everyone else point to their closest point on that line
- Cut line in the middle
- Recurse on each half
- Stop at $\sqrt{N}$

Apply to auto93.csv. Note that by just   recursively exploring $X$, we seem
to be doing a good job of sorting out $Y$.

```
|.. 
|.. |.. 
|.. |.. |.. 
|.. |.. |.. |..              {3.96, 90.87, 0, 80.71, 3, 2045.71, 16.6, 35.42}
|.. |.. |.. |..              {3.88, 89.04, 0, 75.2, 3, 2087.4, 17.03, 28.8}
|.. |.. |.. 
|.. |.. |.. |..              {4.0, 125.92, 0, 81.68, 1, 2504.2, 16.52, 30.8}
|.. |.. |.. |..              {4.48, 129.68, 0, 78.28, 3, 2562.76, 14.96, 26.4}
|.. |.. 
|.. |.. |.. 
|.. |.. |.. |..              {4.2, 109.28, 0, 76.16, 2, 2462.92, 15.68, 26.8}
|.. |.. |.. |..              {4.0, 104.4, 0, 72.04, 2, 2309.24, 16.74, 26.0}
|.. |.. |.. 
|.. |.. |.. |..              {4.24, 110.24, 0, 77.76, 2, 2423.72, 17.77, 32.8}
|.. |.. |.. |..              {4.0, 122.96, 0, 78.52, 1, 2426.52, 16.04, 29.2}
|.. 
|.. |.. 
|.. |.. |.. 
|.. |.. |.. |..              {4.17, 128.6, 0, 73.38, 1, 2393.5, 16.91, 24.58}
|.. |.. |.. |..              {6.0, 232.0, 0, 74.96, 1, 3359.96, 17.18, 20.0}
|.. |.. |.. 
|.. |.. |.. |..              {6.0, 215.76, 0, 79.2, 1, 3194.44, 16.33, 22.0}
|.. |.. |.. |..              {7.6, 300.08, 0, 78.16, 1, 3727.64, 15.53, 20.4}
|.. |.. 
|.. |.. |.. 
|.. |.. |.. |..              {6.64, 255.2, 0, 71.12, 1, 3317.08, 14.82, 18.4}
|.. |.. |.. |..              {8.0, 311.96, 0, 74.44, 1, 4011.28, 13.55, 15.2}
|.. |.. |.. 
|.. |.. |.. |..              {8.0, 364.96, 0, 73.8, 1, 4353.44, 12.53, 12.8}
|.. |.. |.. |..              {8.0, 397.16, 0, 70.84, 1, 4286.92, 11.0, 12.4}

                             {5.45, 193.43, 0, 76.01, 1, 2970.42, 15.57, 23.84}
                             {Clndrs, Volume, HpX, Model, origin, Lbs-, Acc+, Mpg+}
```
(In the above, we only score the _Y_ values _after_ clustering.)

Let's fix up a few things: 

- Use fewer _Y_ measurements:
  - When recursing, reuse on far point from parent
    - So the above tree only needed 16 evals
    - (No reuse would have needed 30)    
  - Find distant points without looking at everything
    - the Fastmap heuristic for finding far points [^Faloutsos]  ( $O(2N)$ not $O(N&2)$ )
    - pick _any_ point at random
    - find a point far from _any_
    - find a point far from that first _point_ 
  - When exploring for far points, don't use all the data (just use, say, 256 points picked at random)
    - Aside: for prudence, do not take the most distant points (that can be confused by outliers)
      - Instead, only go 95%
- Use fewer _X_ measurements:- Use fewer _Y_ measurements:
  - When recursing, reuse on far point from parent
    - So the above tree only needed 16 evals
    - (If no reuse would we have needed 30)
  - When recursing, ignore the branch furthest from heaven:
    - So in 5 evals, we can find the top-most cluster seen above:        
      {3.96, 90.87, 0, 80.71, 3, 2045.71, 16.6, 35.42} 
    - And now we are competitive with SMO.

## Distance Measures

- The above distance calculation assume all numerics. But what about mixtures of nums and syms?
  - Aha's distance measure [^aha] (note: slow. Ungood for large dimensional spaces. We'll fix that below.)
  -  d(a,b )= (&sum; (&Delta;(a,b))<sup>p</sup>))<sup>1/p</sup>
  - euclidean : p=2
  - But what is &Delta; :
    -  &Delta; Symbols: 
      - return 0 if x == y else 1
    - &Delta;  Numbers:
      -  x - y
      - to make numbers fair with symbols, normalize x,y 0,1 using (x-min)/(max-min)
  - But what about missing values:
    - assume worst case
    - if both unknown, assume &delta; = 1
    - if one symbol missing, assume &delta; = 1
    - if one number missing:
      - let x,y be unknown, known
      - y = normalize(y)
      - x = 0 if y > 0.5 else 1
      - &Delta; =  (x-y)

```lua
function SYM:dist(x,y)
  return  (x=="?" and y=="?" and 1) or (x==y and 0 or 1) end

function NUM:norm(x) 
  return x=="?" and x or (x - self.lo) / (self.hi - self.lo + 1E-30) end

function NUM:dist(x,y)
  if x=="?" and y=="?" then return 1 end
  x,y = self:norm(x), self:norm(y)
  if x=="?" then x=y<.5 and 1 or 0 end
  if y=="?" then y=x<.5 and 1 or 0 end
  return math.abs(x-y) end

function ROW:dist(other,data,     d,n,p)
  d, n, p = 0, 0, the.p
  for _, col in pairs(data.cols.x) do
    n = n + 1
    d = d + col:dist(self.cells[col.at], other.cells[col.at]) ^ p end
  return (d/n)^(1/p) end
``` 

Finding two distant, points, sorting by their distance to heaven, reusing far points from parents:XXXXdisnace. 

```lua  
function ROW:neighbors(data,  rows)
  return l.keysort(rows or data.rows,
                   function(row) return self:dist(row,data) end) end

function DATA:farapart(rows,  sortp,a,    b,far,evals)
  far = (#rows * the.Far) // 1
  evals   = a and 1 or 2
  a   = a or l.any(rows):neighbors(self, rows)[far]
  b   = a:neighbors(self, rows)[far]
  if sortp and b:d2h(self) < a:d2h(self) then a,b=b,a end
  return a, b, a:dist(b,self),evals end
```
Given two distant points, project everyone else onto a line drawn between them

```lua 
function DATA:half(rows,sortp,before,evals)
  local some,a,b,d,C,project,as,bs
  some  = l.many(rows, math.min(the.Half,#rows))
  a,b,C,evals = self:farapart(some, sortp, before)
  function d(row1,row2) return row1:dist(row2,self)  end
  function project(r)   return (d(r,a)^2 + C^2 -d(r,b)^2)/(2*C) end
  as,bs= {},{}
  for n,row in pairs(l.keysort(rows,project)) do
    table.insert(n <=(#rows)//2 and as or bs, row) end
  return as, bs, a, b, C, d(a, bs[1]), evals end


[^Faloutsos]: Christos Faloutsos and King-Ip Lin. 1995. FastMap: a fast algorithm for indexing, data-mining and visualization of traditional and multimedia datasets. SIGMOD Rec. 24, 2 (May 1995), 163–174. https://doi.org/10.1145/568271.223812

[^aha]: Section 2.4 or Aha, D.W., Kibler, D. & Albert, M.K. Instance-based learning algorithms. Mach Learn 6, 37–66 (1991). https://doi.org/10.1007/BF00153759
 