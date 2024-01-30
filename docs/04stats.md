<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>


# Stats

Does 42==44?

If we watched 100 women and men walk past us and their mean walking tipped was 42 and 44 cm/second (for men and women respectively), it is true that men walk faster than women?



This is an example of the problem of comparing distributions. Which can get tricky.

![image](https://github.com/txt/aa24/assets/29195/5b1331fc-3bba-470e-a6d1-407bac9b7fb6)


These problem as two parts:

- Are the distributions distinguishable?
  - If we picked a number from one distibtuion, can we tell of it can be found on the other?
  - This is the (badly named) singificance test.
- Is the different between them non-trivial:
  - This is the effect size test
  - And we want to ignore small effects.


Easy case: means far away and the curves do not overlap

- So the curves are significantly different
- with large effect

![image](https://github.com/txt/aa24/assets/29195/3a0eaad2-4986-463b-a1f0-e26d8500efae)


Now we increase the standard deviation.

- So much overalp. Curves may not be significantly different
- And now that mean seperation seems less different

![image](https://github.com/txt/aa24/assets/29195/ee3e7184-4f78-4c88-bd66-34c2d61c98e5)

## Parametric Statistical Tests

If we assume that our data comes from a certain distrubtion then we could write a formula to compute the overlap or, if we throw darts at both diistributions, waht are the odds
that we will hit numbers from one distribution, not aother.

This is called parametric statisitics. You assume a formula (e.g. Gaussian) then look to filling in the parameters of that distribution (for Gaussian, the mean $\mu$ and the standard deviation $\sigma$ ).

But there are so many distributions so it is not clear what formula we should use.

![image](https://github.com/txt/aa24/assets/29195/0d871993-9ddd-4535-aad3-b1d567310e08)

Also, reall world data may be conform to a simple single distribution. For exam,e here are the query times for 50 SQL statements in one program.

<img src="https://github.com/txt/aa24/assets/29195/3ad878b4-4f47-4db2-9a2c-c3e74ac97c29)" width=400>


## Non-parametric stats

### Scott-Knott:

Many statistical methods (e.g.  t-test, Tukey, Duncan, Newman-Keuls procedures) suffer from  have overlapping
problems. 
- By overlapping we mean the possibility of one or more treatments to be classified in
more than one group.
- In fact, as the number of treatments icnrease, so to does the the number of overlaps, which makes it hard  to
    distinguish the real groups to which the means should belong.
- The Scott-Knott method [^sk] does not have this problem, what is often cited as a very good quality of this
procedure.

Scott-Kott is a recursive clustering procedure that 
- sorts the treatmetns
- divided them and the larges expects different in the mean before and after division
- then recuses on each half, but only if the two halfs are statistically different

The halves are picked to maximize:

$$    E(\Delta) = \frac{|l_1|}{|l|}abs(E({l_1}) - E({l}))^2 + \frac{|l_2|}{|l|}abs(E({l_2}) - E({l}))^2$$

(here   $|l_1|$ means the size of list $l_1$)


[^sk]: Scott R.J., Knott M. 1974. A cluster analysis method for grouping mans in the analysis of variance.
Biometrics, 30, 507-512.
 
The Scott & Knott method make use of a clever algorithm of cluster analysis, where, starting from
the the whole group of observed mean effects, it divides, and keep dividing the sub-groups in such
a way that the intersection of any two groups formed in that manner is empty.

This means that $N$ treatments might  get ranked using    only $\log_2(N)$ statistical comparisons
- and even less, if ever sub-trees high up int he process are found to be not statistically different
- Also, Scott-Knott converts the  problem of ranking treatments becomes more a clustering probkem (which I do understand) than a stats problem (which, in all fairness, I understand only weakly).


```lua
def sk(nums):
  "sort nums on median. give adjacent nums the same rank if they are statistically the same"
  def sk1(nums, rank,lvl=1):
    all = lambda lst:  [x for num in lst for x in num.has]
    b4, cut = NUM(all(nums)) ,None
    max =  -1
    for i in range(1,len(nums)):  
      lhs = NUM(all(nums[:i])); 
      rhs = NUM(all(nums[i:])); 
      tmp = (lhs.n*abs(lhs.mid() - b4.mid()) + rhs.n*abs(rhs.mid() - b4.mid()))/b4.n 
      if tmp > max:
         max,cut = tmp,i 
    if cut and different( all(nums[:cut]), all(nums[cut:])): 
      rank = sk1(nums[:cut], rank, lvl+1) + 1
      rank = sk1(nums[cut:], rank, lvl+1)
    else:
      for num in nums: num.rank = rank
    return rank
  #------------ 
  nums = sorted(nums, key=lambda num:num.mid())
  sk1(nums,0)
  return nums
```
