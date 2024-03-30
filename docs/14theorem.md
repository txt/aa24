<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# Theorem Proving and SE

## More on Formal Methods (example)

### "Testing" and Product Lines and Formal Methods

A feature model is a "product line"; i.e. a description of a space 
of products.

Question: what are the _different_ products we can pull from the following?


![image](https://github.com/txt/aa24/assets/29195/b1291348-7198-49d6-9d1b-ad6b10ff7fa3)

![image](https://github.com/txt/aa24/assets/29195/6d3a6b6a-e378-4408-884f-1773e5a96498)

![image](https://github.com/txt/aa24/assets/29195/c336f774-7593-4855-800d-f5d6bd3c02c7)

![image](https://github.com/txt/aa24/assets/29195/7bbe9a45-b10e-4b9e-886c-7d2c7bb56d3e)



Now that was a small feature modelwhich maybe we could have done by hand. But suppose we are talking about something
really big like a formal model of the LINUX kernel with 4000 variables
and 300,000 contrast. Q: How to reason over that space? A:  theorem provers.
e.g. maxWalkSat (to roll your own), _Pycosat_ (for boolean variables) _Z3_ for other kinds of vars,

## But first, what else can you use theorem provres for?

Designing a build startegy: 

- navigating sets of dependancies
  [running code](https://github.com/ContinuumIO/pycosat/blob/master/examples/opium.py).
- in conjuection with mutli-objective optimizers:
  - to geenrate initial data space
  - to check if a mutate is valid
  - to repair an invalid mutant
    - in genetic algorithms, if mummy and daddy are valid,
      - the set to "?" any value not seen in mummy and daddy
      - ask the theorem prover to fill in the rest

## The dream

- Manual step
  - Say anthing in English.
- Automatically
  - Automatically translated english to logic.
  - Run the logic.
  - apply the solution

In practice, much harder than that

- After we translate natual langauge to logic, may need a [planning step](https://aclanthology.org/J82-3002.pdf) to simpleify and clarify the resulting formulae.
- As for 2017:
  - general SAT solvers, such as the Z3, MathSAT  , vZ  et al.,  are challenged by the complex- ity of real-world software models. For example, the largest benchmark  for SAT Competition 2017   had 58,000 variables– which is far smaller than (e.g.) the 300,000  variable problems seen in the recent SE testing literature.
  - need to check: where are we today?
- And not all goals are logical. When we explored product lines (like the above),theorem provers became sub-routines since we have other goals
  to satisfy:
  - Pick the most number of features..
  - .. that we have used before ..
  - .. with a history of least bugs ..
  - .. which are fastest to code up , etc
  - See theorem provers became a way to initialize the problem space, after which we had to run optimizers
    -  [Scalable product line configuration: A straw to break the camel's back](https://www.semanticscholar.org/paper/Scalable-product-line-configuration%3A-A-straw-to-the-Sayyad-Ingram/3384176ef4196797603ae2ca68ff353bb4233668)
  Abdel Salam Sayyad, Joseph Ingram, H. Ammar, Tim Menzies
  2013 28th IEEE/ACM International Conference on Automated Software Engineering (ASE)

But ignoring these small issue of scalabilty, expressability, etc. The following come from
[Peter Norving](https://github.com/norvig/pytudes/blob/main/ipynb/PropositionalLogic.ipynb)
 


```python
rules = [
    Rule('{P} ⇒ {Q}',         'if {P} then {Q}', 'if {P}, {Q}'),
    Rule('{P} ⋁ {Q}',          'either {P} or else {Q}', 'either {P} or {Q}'),
    Rule('{P} ⋀ {Q}',          'both {P} and {Q}'),
    Rule('～{P} ⋀ ～{Q}',       'neither {P} nor {Q}'),
    Rule('～{A}{P} ⋀ ～{A}{Q}', '{A} neither {P} nor {Q}'), # The Kaiser neither ...
    Rule('～{Q} ⇒ {P}',        '{P} unless {Q}'),
    Rule('{P} ⇒ {Q}',          '{Q} provided that {P}', '{Q} whenever {P}', 
                               '{P} implies {Q}', '{P} therefore {Q}', 
                               '{Q}, if {P}', '{Q} if {P}', '{P} only if {Q}'),
    Rule('{P} ⋀ {Q}',          '{P} and {Q}', '{P} but {Q}'),
    Rule('{P} ⋁ {Q}',          '{P} or else {Q}', '{P} or {Q}'),
    ]

negations = [
    (word("not"), ""),
    (word("cannot"), "can"),
    (word("can't"), "can"),
    (word("won't"), "will"),
    (word("ain't"), "is"),
    ("n't", ""), # matches as part of a word: didn't, couldn't, etc.
    ]
```

Figaro and Susanna will wed provided that either Antonio or Figaro pays
and Bartolo is satisfied or else Marcellina's contract is voided and the
Countess does not act rashly. 

- Logic: ((((P ⋁ Q) ⋀ R) ⋁ (S ⋀ ～T)) ⇒ (U ⋀ V))
  - P: Antonio
  - Q: Figaro pays
  - R: Bartolo is satisfied
  - S: Marcellina's contract is voided
  - T: the Countess does act rashly
  - U: Figaro
  - V: Susanna will wed
- Some errors:   "Figaro" and "Susanna will wed" as two separate propositions; this should really be one proposition.
- see the [code](https://github.com/norvig/pytudes/blob/main/ipynb/PropositionalLogic.ipynb)

Also, for a more classical approach, see https://aclanthology.org/J82-3002.pdf 

![image](https://github.com/txt/aa24/assets/29195/60d71438-dbf5-4cdc-8299-7f4c525901c3)



## Feature Models and Formal Methods

The following example comes from the excellent documentation
at the
[Python Picostat Github page](https://github.com/ContinuumIO/pycosat/blob/master/README.rst)

Let us consider the following clauses, represented using
the DIMACS `cnf <http://en.wikipedia.org/wiki/Conjunctive_normal_form>`_
format::

        p cnf 5 3
        1 -5 4 0
        -1 5 3 4 0
        -3 -4 0

Here, we have 5 variables and 3 clauses, the first clause being

_x1  or not x5 or x4_

Note that the variable x2` is not used in any of the clauses,
which means that for each solution with x2 = True, we must
also have a solution with x2 = False.  In Python, each clause is
most conveniently represented as a list of integers.  Naturally, it makes
sense to represent each solution also as a list of integers, where the sign
corresponds to the Boolean value (+ for True and - for False) and the
absolute value corresponds to i-th variable::

        >>> import pycosat
        >>> cnf = [[1, -5, 4], [-1, 5, 3, 4], [-3, -4]]
        >>> pycosat.solve(cnf)
        [1, -2, -3, -4, 5]

This solution translates to: x1=x5=True,
x2=x3=x4=False

To find all solutions, use `itersolve`::

        >>> for sol in pycosat.itersolve(cnf):
        ...     print sol
        ...
        [1, -2, -3, -4, 5]
        [1, -2, -3, 4, -5]
        [1, -2, -3, 4, 5]
        ...
        >>> len(list(pycosat.itersolve(cnf)))
        18

In this example, there are a total of 18 possible solutions, which had to
be an even number because x2 was left unspecified in the clauses.

The fact that `itersolve` returns an iterator, makes it very elegant
and efficient for many types of operations.  For example, using
the `itertools` module from the standard library, here is how one
would construct a list of (up to) 3 solutions::

        >>> import itertools
        >>> list(itertools.islice(pycosat.itersolve(cnf), 3))
        [[1, -2, -3, -4, 5], 
         [1, -2, -3, 4, -5], 
         [1, -2, -3, 4, 5]]

### Feature Models and Product Lines

[Software installation as a formal methods problem](http://cseweb.ucsd.edu/~lerner/papers/opium.pdf)

Lets represent software dependencies in a logical framework:

<img src="../etc/img/opium.png">

If we run Picosat over these formulae then:

- Any solution that satisfies all the constraints...
- Is a different way to create a valid install of the program.

Variants:

- min install: 
   - add a cost to the install effort of each part
   - score everything coming out of `itersolve` (sum that cost)
   - pick the easiest thing to install
- optimizing:
   - generate one solution, ask some human what they think
   - if they don't like, negate it add it to the theorems
   - so future solutions will _not_ contain the thing you don;t like

**Important note:** in practice, except for trivally small 
problems, no one writes DIMACS manually. 

- Instead, we write code to generate DIMACS via some code. 
- For example:


## Scale-up Issues

### Scaling up SAT Solvers

In summary, in theory, it is can be useful to reformulate SE tasks as a SAT task. As Micheal Lowry said at a panel at ASE’15:

- It used to be that reduction to SAT proved a prob- lem’s intractability. But with the new SAT solvers, 
  that reduction now demonstrates practicality."

However, in practice, general SAT solvers, such as the Z3, MathSAT [29], vZ  et al., 
are challenged by the complex- ity of real-world software models. For example, the largest benchmark 
for SAT Competition 2017 [31] had 58,000 variables– which is far smaller than (e.g.) the 300,000 
variable problems seen in the recent SE testing literature [4]. 

So SAT solvers are great but as software gets really really big, they need help.

-
- [Building Very Small Test Suites (with Snap)](https://arxiv.org/pdf/1905.05358.pdf),
  Jianfeng Chen, Xipeng Shen, Tim Menzies, 2020
