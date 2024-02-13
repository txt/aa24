<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# "Discretiztion" = Making Ranges

_Discretization_: 

> <em> the transformation a set of continuous attributes into discrete ranges, by associating categorical values to intervals and thus transforming quantitative data into qualitative data[^garcia].</em>

Note that once you have the above going, the generating rules   is just a matter of iterative    descritization (see next week).

For another example of this, here the magic applied to diabetes data. Note that:
- No useful divisions were found for `pres`,and `skin` (and attributes whose ranges have the same distributions in all classes are boring)
- Most ranges make very little change to the default class distribution shown bottom right (blue:red = `not`:`diabetic` = 5:3).
  - But there are some beauties e,g, 
    - `plas=hi` is strongly associated with  for `diabetic`
    - `mass=lo` or `plas=lo` is strongly associated with `not`

<img src="/etc/img/diabetes.png" width=600>





For another example, suppose we can clustered some data:

```
398  {:Acc+ 15.6 :Lbs- 2970.4 :Mpg+ 23.8}
| 199
| | 99
| | | 49
| | | | 24  {:Acc+ 17.3 :Lbs- 2623.5 :Mpg+ 30.4}
| | | | 25  {:Acc+ 16.3 :Lbs- 2693.4 :Mpg+ 29.2}
| | | 50
| | | | 25  {:Acc+ 15.8 :Lbs- 2446.1 :Mpg+ 27.2}
| | | | 25  {:Acc+ 16.7 :Lbs- 2309.2 :Mpg+ 26.0}
| | 100
| | | 50
| | | | 25  {:Acc+ 16.2 :Lbs- 2362.5 :Mpg+ 32.0}
| | | | 25  {:Acc+ 16.4 :Lbs- 2184.1 :Mpg+ 34.8}
| | | 50
| | | | 25  {:Acc+ 16.2 :Lbs- 2185.8 :Mpg+ 29.6} <== best?
| | | | 25  {:Acc+ 16.3 :Lbs- 2179.4 :Mpg+ 26.4}
| 199
| | 99
| | | 49
| | | | 24  {:Acc+ 16.6 :Lbs- 2716.9 :Mpg+ 22.5}
| | | | 25  {:Acc+ 16.1 :Lbs- 3063.5 :Mpg+ 20.4}
| | | 50
| | | | 25  {:Acc+ 17.4 :Lbs- 3104.6 :Mpg+ 21.6}
| | | | 25  {:Acc+ 16.3 :Lbs- 3145.6 :Mpg+ 22.0}
| | 100
| | | 50
| | | | 25  {:Acc+ 12.4 :Lbs- 4320.5 :Mpg+ 12.4}
| | | | 25  {:Acc+ 11.3 :Lbs- 4194.2 :Mpg+ 12.8} <== worst
| | | 50
| | | | 25  {:Acc+ 13.7 :Lbs- 4143.1 :Mpg+ 18.0}
| | | | 25  {:Acc+ 14.4 :Lbs- 3830.2 :Mpg+ 16.4}
```

And then we use the same algorithm to wind our way down to the best leaf cluster:

```
398  {:Acc+ 15.6 :Lbs- 2970.4 :Mpg+ 23.8}
| 199
| | 100
| | | 50
| | | | 24   {:Acc+ 17.2 :Lbs- 2001.0 :Mpg+ 33.2}
```

Let _best_ be the 24 examples in best cluster and _rest_ be $|\text{best}|*3$ of
the others, picked at random.


Now we are going to divide all the numeric ranges into 16 buckets, then recursively
merge ranges with the same distribution in _best_ and _rest_. Here's what we get
(and on the RHS, we score how much of each class is selected by that range). Note that

- strongly associated with `best` are `volume=[90..115)` and `Cylinders=3` and `origin=3`  
- most associated with `rest` is `volume >= 115` 


```
all                                       {:best 12 :rest 48}
          [lo<=x< hi)           score
          ===========           ====
Clndrs    -inf       3        | 0.08     | {:best 1}
Clndrs    3          4        | 0.64     | {:best 11 :rest 19}
Clndrs    4        inf        | 0.0      | {         :rest 29}

Volume    -inf     90         | 0.69     | {:best 9  :rest 3}
Volume    90      115         | 0.17     | {:best 3  :rest 6}
Volume    115     inf         | 0.0      | {         :rest 39}

Model    -inf      77         | 0.0     | {         :rest 30}
Model    77        78         | 0.28    | {:best 4  :rest 3}
Model    78        79         | 0.12    | {:best 2  :rest 3}
Model    79        80         | 0.43    | {:best 6  :rest 4}
Model    80       inf         | 0.0     | {         :rest 8}

origin    1         1         | 0.0     | {         :rest 33}
origin    2         2         | 0.0     | {         :rest 8}
origin    3         3         |0.87     | {:best 12 :rest 7}
```

Note that there are very few most powerful ranges

- This is a common result (i.e. a few things matter and the rest can go to he\*ck).
- Once we know the above, then all subsequent inference is just a search through a couple of ranges. Ezy,pezy.

## How to Discretize

There are so many ways to implement discretization [^garcia][^liu]:

[^garcia]: Salvador Garcia, Julian Luengo, Jose A. Saez, Victoria Lopez, and Francisco Herrera. 2013. 
  [A Survey of Discretization Techniques: Taxonomy and Empirical Analysis in Supervised Learning](/etc/pdf/discretization.pdf). 
  IEEE Trans. on Knowl. and Data Eng. 25, 4 (April 2013), 734–750. https://doi.org/10.1109/TKDE.2012.35


![](https://github.com/timm/tested/raw/main/etc/pdf/dischow.png)

<img align=right src="https://github.com/timm/tested/raw/main/etc/img/ewdefd.png" width=500>

Lets just list some simple ones:

- Unsupervised (make no reference to $y$ attributes):
  - EWD: equal width discretization:  `(max-min)/the.bins`
  - EFD: equal frequency discretization: sort numbers, divide into (say) 10% chunks
- Supervised (divide $x$ by reflecting on $y$)
  - EMD: entropy merge discretization
    - post-processor to unsupervised discretization:
      - divide into (say) 16 bins, then remove uninformative bins
      - recursively combine adjacent bins (if the parts are less informative than the combination)

eg. can `alive` supervise our discretization of `age`?

```
age | alive
----|------
  5 | y
500 | y
 33 | y
100 | n
 60 | y
800 | y
 10 | y
120 | n
 40 | y
200 | n  
 90 | n
700 | y
 99 | y
 50 | y
130 | n
999 | y
```
Step1, sort on `age`:

```
age | alive
----|------
  5 | y
 10 | y
 33 | y
 40 | y
 50 | y
 60 | y
----|----
 90 | n
----|----
 99 | y
----|----
100 | n
120 | n
130 | n
200 | n  
----|----
500 | y
700 | y
800 | y
900 | y
```
So we seem to have some long lived  aliens amongst us. 

Now one way to find our bins is to first divide the day into (say) five bins of size two,
then look for adjacent bins that are so similar that we can merge them:

```
age | alive | bins
----|-------|-----
  5 | y     | one
 10 | y     | one
 ------------------
 33 | y     | two
 40 | y     | two
 ------------------
 50 | y     | three
 60 | y     | three
 ------------------
 90 | n     | four
 99 | y     | four
 ------------------
100 | n     | five
120 | n     | five
 ------------------
130 | n     | six
200 | n     | six
 ------------------
500 | y     | seven
700 | y     | seven
 ------------------
800 | y     | eight
900 | y     | eight
```

See note the numbers of "alive=y" and "alive=n" are the same in bins one+two+three and five+six and seven+eight. And a similar pattern happens in the middle (but that 99 messes things up a little).
But accommodating a little bit of noise then we get three bins.

```
age | alive | combined bins
----|-------|-----
  5 | y     | one
 10 | y     | one
 33 | y     | one
 40 | y     | one
 50 | y     | one
 60 | y     | one
 ------------------
 90 | n     | two
 99 | y     | two
100 | n     | two
120 | n     | two
130 | n     | two
200 | n     | two
 ------------------
500 | y     | three
700 | y     | three
800 | y     | three
900 | y     | three
```

OK, lets code that up.

## Preambles 

In the above we did EMD as a port-processor to EFD (equal frequency discretization). 

- It turns out that it is much easier to use EWD (equal width discretization)
  instead (see below).

## RANGES

Since we  are doing _supervised_ discretization, when we define a range,
we need to track the `lo` and `hi` of that  range _and_ the class symbols seen in that range.

```lua
local RANGE=is"RANGE"
function RANGE.new(at,txt,lo,    hi)
  return isa(RANGE, {at=at, txt=txt, scored=0,
                     x = { lo = lo, hi = hi or lo },
                     y = {}}) end

-- RANGEs can be extended 
function RANGE:add(x, y)
    self.x.lo = math.min(self.x.lo, x)
    self.x.hi = math.max(self.x.hi, x)
    self.y[y] = (self.y[y] or 0) + 1 end 
```

Note some hacks in the above (which you might want to change):
- `hi` defaults to to `lo` (which is a nice way to initialize a RANGE when you have only
  seen one value yet)
- LUA's `min` and `max` functions will sort strings as well as numerics so our `extend`
  function does not have to consider them as separate cases
- We never define `a range of numerics` and `a range of symbols` since the following hack
  will do
  - if `lo==hi` then we saying we are looking at a symbolic range.

## Information Content

We need some way to look at adjacent RANGEs  and decide they need to be merged. 
Well, if the merged bins have _less_ information than the parts
then the merge contains fewer classes (i.e. it predicts better for one
class or another).

First things first, what is the primitive for combining the frequency counts
of systems seen in two adjacent RANGEs.

```lua
function RANGE:merge(other,   both)
  both = RANGE.new(self.at, self.txt, self.x.lo)
  both.x.lo = math.min(self.x.lo, other.x.lo)
  both.x.hi = math.max(self.x.hi, other.x.hi)
  for _,t in pairs{self.y, other.y} do
    for k,v in pairs(t) do 
      both.y[k] = (both.y[k] or 0) + v end end
  return both end

function RANGE:merged(other,tooFew,     both,e1,n1,e2,n2)
  both  = self:merge(other) 
  e1,n1 = l.entropy(self.y)
  e2,n2 = l.entropy(other.y)
  if n1 <= tooFew or n2 <= tooFew then return both end
  if l.entropy(both.y) <= (n1*e1 + n2*e2) / (n1+n2) then
    return both end end
```

Ok, that is how is we merge two RANGEs. How do we merge many RANGEs?
The following bottom-up clustering routines expects a set of RANGEs sorted on their `lo`
value. If it can find two neighbors that can be merged, it does the merge then jumps
over 2 spaces to look for anything else. If the result is a smaller set of ranges,
then it loops back to look for other merges.

```lua
-- Bottom-up clustering. Try to merge neighbors. Stop when no new merges found.
-- Before returning, ensure ranges span -inf to +inf with no gaps in the middle.
function _mergeds(ranges,tooFew,  i,a,t,both)
  i,t = 1,{}
  while i <= #ranges do
    a = ranges[i]
    if i < #ranges then
      both = a:merged(ranges[i+1],tooFew)
      if both then 
        a = both
        i = i+1 end end
    t[1+#t] = a
    i = i+1 end
  if #t < #ranges then return _mergeds(t,tooFew) end
  for i = 2,#t do t[i].x.lo = t[i-1].x.hi end
  t[1].x.lo  = -math.huge
  t[#t].x.hi =  math.huge
  return t end
```

## Initializing the RANGEs

Nearly done. All the above assumes we have the columsn divided into, say `the.bins=16`
RANGEs. To generate them, we use the following code.
Note that this code is called per `col` and `rowss` is a dictionary of rows where the keys
of the dictionary are the class names. So if we have two classes `best` and `rest` containing
12 and 48s then

```
{best={row1,row2...row12}
 rest={otherRow1, otherRow2... otherRow48}
}
```

```lua
local _ranges, _ranges1, _mergeds
function _ranges(cols,rowss,     t)
  t={}
  for _, col in pairs(cols) do
    for _, range in pairs(_ranges1(col, rowss)) do
      t[1 + #t] = range end end
  return t end
  
function _ranges1(col,rowss,    out,x,bin,nrows)
  out,nrows = {},0
  for y, rows in pairs(rowss) do
    nrows = nrows + #rows
    for _, row in pairs(rows) do
      x = row.cells[col.at]
      if  x ~= "?" then
        bin = col:bin(x)
        out[bin] = out[bin] or RANGE.new(col.at, col.txt, x)
        out[bin]:add(x,y) end end end
  out = l.asList(out)
  table.sort(out, function(a,b) return a.x.lo < b.x.lo end)
  return col.has and out or _mergeds(out, nrows/the.bins) end
```

## From Ranges to Rules

Now that we've got ranges, "all" we need to do is explore all their subsets.
Next lecture!


[^Liu]: [Discretization: An Enabling Technique](https://sci2s.ugr.es/keel/pdf/algorithm/articulo/liu1-2.pdf)
  Huan Liu
  Farhad Hussain 
  Chew Lim Tan 
  Manoranjan Dash
  Data Mining and Knowledge Discovery, 6, 393–423, 2002
