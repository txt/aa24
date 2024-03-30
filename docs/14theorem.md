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


- Program verification: now demanded by several widely applied aerospace software standards.
- Verifying security properties
  - Amazon runs btheorem provers billions of times a day on config files of their user's cloud-based apps (to check if everyone is playing nice)
    -     See [One-click format methods](https://www.amazon.science/publications/one-click-formal-methods)
    - "We can now use automated reasoning to provide 
       inexpensive and provable assurance to customers.”
- - Designing a build startegy:
  - navigating sets of dependancies
    [running code](https://github.com/ContinuumIO/pycosat/blob/master/examples/opium.py).
- in conjuection with multi-objective optimizers:
  - to generate initial data space
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



## A reality check 

- Theorem provers  are software. 
So may contain  bugs
- Especially if you are using the latest and greatest and newest research prototype.
  - E.g. formal verification tools using theorem provers as 3rd party components 
- Which is a worry. Theorem provers  are now in  industrial standards documents.  
  -  E.g. automotive and aeronautical safety assurance ISO 26262 and DO-178C
- [Some Researchers](https://ieeexplore.ieee.org/document/9678881)  
advocate
ensembles of 
experts 


![image](https://github.com/txt/aa24/assets/29195/6596062a-5102-4c01-aedf-43b2e1e6549b)

 Can N slightly 
faulty systems 
sum  to one 
trustworthy 
device?
