<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# Rules

## Generate Ranges

In our last lecture, we built ranges by combing EWD and EMD
(equal width discretization and entropy merge descretization):

- EWD: divide numerics into $(hi - lo)/16$:
  - Then find adjacent bins where one of them has less than $1/16$ th of the data;
     - and merge them 
- EMD: find adjacent bins  where the pattern of classes is very similar
  - as measured by entropy
  - then merge them.
- If you can merge those 16 bins into less than 16
  - then loop to try again
  - stopping when you can no longer find anything to merge.
  - For code on this, see `merged` in
    [mylo.lua](https://github.com/timm/lo/blob/main/src/mylo.lua).

## Genering Rules from Ranges

Now we:

- sort the ranges
- find the top (say) $N_1=10$ best ranges 
- and explore all the $R=2^{N_1}$ combinations.

Then we:

- sort the rules
- find the top (say) $N_2=10$ best rules 
- and report all the $R=2^{N_2}$ combinations.

For that to work, we need to be able to score ranges and tules the same way
- In code, rules and ranges both have a `scored` attriuite

```lua
function RULES:top(t,       u)
  table.sort(t, function(a, b) return a.scored > b.scored end)
  u = {}
  for _,x in pairs(t) do
    if x.scored >= t[1].scored * the.Cut then
      u[1+#u] = x end end
  return l.slice(u, 1, the.Beam) end -- e.g. Beam=10
```

And we'll need a function that sorts `score`s things and returns the top items:
- My `score` function assumes we are working with two classes, one containing a
  _LIKE_ number of items
  and the other containing a  _HATE_ number of items.
- So we sccore things on how strongly we select for _LIKE_ and avoid _HATE_. 

```lua
function RULES:score(t)
  return l.score(t, self.goal, self.LIKE, self.HATE) end

function l.score(t, goal, LIKE, HATE,         like, hate,tiny)
    like, hate, tiny = 0, 0, 1E-30
    for klass, n in pairs(t) do
        if klass == goal then like=like + n else hate=hate + n end end
    like, hate = like / (LIKE + tiny), hate / (HATE + tiny)
    if hate > like then return 0 else return like ^ the.Support / (like + hate) end end
```

## Rules contains ranges that select for rows

Rules mention ranges, ranges mention attributes.

If a rule mentions ranges from different attributes

- Both those ranges have to be true
- That is a conjunction (and `and`).

But  a rule mentions two ranges from the same attribute

- then that is a disjunction (an `or`);

So when we build a rule from ranges, we have to sort those ranges
into different buckets for each attribute.

```lua
local RULE = is "RULE"
function RULE.new(ranges, rule, t)
  rule = isa(RULE, { parts = {}, scored = 0 })
  for _, range in pairs(ranges) do
      t = rule.parts[range.txt] or {}
      t[1 + #t] = range
      rule.parts[range.txt] = t end 
  return rule end
```
This means that to find out what rows are selected by a rule,
we have to explore the `or`s inside the `and`s.
```lua
function RULE:selects(rows,    t)
  t = {}; for _,r in pairs(rows) do
            if self:_and(r) then t[1+#t]=r end end; return t end

function RULE:_and(row)
  for _,ranges in pairs(self.parts) do
    if not self:_or(ranges,row) then return false end end
  return true end

function RULE:_or(ranges, row, x, lo, hi) 
  x = row.cells[ranges[1].at]
  if x == "?" then return true end
  for _, range in pairs(ranges) do
    lo, hi = range.x.lo, range.x.hi 
    if lo==hi and lo == x or lo<=x and x <hi then return true end end
  return false end
```

## Pretty print

By the way, it is a little tricky displaying a rule. So ranges are contiguous and,
for those rules, we can show less than all the ranges. To combine
those rules, we rreuse the greddy agglomerative  code we used before.

```lua
local _showLess
function RULE:show(        ands) 
  ands={}
  for _, ranges in pairs(self.parts) do
    local ors = _showLess(ranges)
    local at
    for i, range in pairs(ors) do  at=range.at; ors[i]=range:show() end
    ands[1+#ands]= table.concat(ors, " or ") end 
  return table.concat(ands," and ") end

-- try and merge contiguous ranges
function _showLess(t,  ready,       i,u,a)
  if not ready then
    t = l.copy(t) -- important, since we are about to mess up the y counts
    table.sort(t, function(a,b) return a.x.lo < b.x.lo end) end
  i, u = 1, {}
  while i <= #t do
    a = t[i]
    if i < #t then
      if a.x.hi == t[i + 1].x.lo then
        a = a:merge(t[i + 1]) -- warning. the y counts now may be very wrong
        i = i + 1 end end
    u[1 + #u] = a
    i = i + 1 end 
  return #u == #t and t or _showLess(u,ready) end
```

## Top-level Loop

We build rules by exploring all subset of interesting ranges. 
- All the rules are generated, sorted, pruned, by `top` (defined above).

```lua
local RULES=is"RULE"
function RULES.new(ranges, goal, rowss, self)
  for k,v in pairs(rowss) do print(k,#v) end
  self = isa(RULES, {sorted={}, goal=goal,rowss=rowss, LIKE=0, HATE=0})
  self:likeHate() 
  for _, range in pairs(ranges) do  range.scored = self:score(range.y)  end 
  self.sorted = self:top( self:try( self:top(ranges)))
  return self end

function RULES:likeHate()
  for y,rows in pairs(self.rowss) do
    if   y == self.goal
    then self.LIKE = self.LIKE + #rows 
    else self.HATE = self.HATE + #rows end end end

function RULES:try(ranges,     u, rule,n)
  u={}
  for _, subset in pairs(l.powerset(ranges)) do
    if #subset > 0 then
      rule  = RULE.new(subset)
      rule.scored = self:score( rule:selectss(self.rowss) )
      if rule.scored > 0.01 then u[1+#u] = rule  end end end
  return u end
```

Note the last line above.
If the max score is $N$ then we will ignore all ranges with a score
less than $N/10$.

