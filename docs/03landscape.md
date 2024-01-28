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

## Example

Given some distance measure (e.g. $d(a,b)=\sqrt(\sum_i(a_i-b_i)^2)$):

- Using just the independent $x$ values,
- find two distance points (sort them by distance to heaven)
- Draw a line between them
- Everyone else point to their closest point on that line
- Cut line in the middle
- Recurse on each half

1. Find two distant points  _A,B_
2. Evaluate their  _Y_, sort them by distance to heaven such that for   _A,B_, _A_
   is better than _B_
3. Draw a line from _A_ to _B_ of length _c_.
4. All other points have a distance _a,b_ to _A,B_. therefore by cosine rule, they project
   to a point x= 


Landscap analysis:
-  data mining/ optimization =  as a search across landscapes. 
-  Given many examples of _(𝑋1, 𝑌1), (𝑋2, 𝑌2), .._ etc then a learner _𝐿_ seeks some model_ f_ that knows where parts
of the _𝑋_ landscape connect to particular parts of the 𝑌 landscape.
