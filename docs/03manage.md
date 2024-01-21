sssdas

# Management AI projects

<img src="https://miro.medium.com/v2/resize:fit:1400/1*k66hoz5Y_9DId_a3UrgIpA.jpeg"
     width=500 align=right>

- waterfall: plan-based [^Royce70]
  - a linear walk through analysis, design, code, test with 
    feedback from `step[i]` updating `step[i+1]`. 

- agile: maintain a backlog of stuff not yet done [^agile] [^hoda]
  - loop
    - sort backlog by value/time
    - sprint to finish the top N items
    - repeat
- agilefall : working at a continuum between plan-driven (a.k.a. waterfall) 
  project management and agile project management
  - usually a pejorative term.
    - we pretend to be agile but actually, we never adapt to change.
  - taken seriously by some [^Bakg]
- spiral model: iterate to explore and (hopefully) retire risk, before committing to a fixed plan [^Boehm88].

<img width="658" alt="image" src="https://github.com/txt/aa24/assets/29195/d8037ca9-0195-45ec-a5ed-dcc5d8c306f8">

[^hoda]: Hoda, Rashina, Norsaremah Salleh, and John Grundy. "The rise and evolution of agile software development." IEEE software 35.5 (2018): 58-63.
[^agile]: Beck, K., Beedle, M., Van Bennekum, A., Cockburn, A., Cunningham, W., Fowler, M., Grenning, J., Highsmith, J., Hunt, A., Jeffries, R. and Kern, J., 2001. Manifesto for agile software development. https://agilemanifesto.org/
[^Royce70]: Winston W. Royce (1970). "Managing the Development of Large Software Systems" in: Technical Papers of Western Electronic Show and Convention (WesCon) August 25–28, 1970, Los Angeles, USA.
[^Bakg]: Bakhirkin, M.V., Lukin, V.N. (2022). Agilefall—Modern Realities of IT Project Management. In: Favorskaya, M.N., Nikitin, I.S., Severina, N.S. (eds) Advances in Theory and Practice of Computational Mechanics. Smart Innovation, Systems and Technologies, vol 274. Springer, Singapore. https://doi.org/10.1007/978-981-16-8926-0_26
[^Boehm88]: Boehm, B (August 1986). "A Spiral Model of Software Development and Enhancement". ACM SIGSOFT Software Engineering Notes. 11 (4): 14–24. doi:10.1145/12944.12948. S2CID 207165409.  https://www.cse.msu.edu/~cse435/Homework/HW3/boehm.pdf

# Some  Variants:

- Timm1: hop, skip, jmup
  - hop : fixed time (e.g. three months), no fixed deliverables (just a progress report), a few people
    - a.k.a. requirements develioment phase
  - skip:  longer fixed times (e.g. six months), some defined deliverables, more people
    - a.k.a. analysis phase
  - jump:  much more fixed time (e.g. twelve months),  well-defined deliverables, yet more people, all fixed deliverables

- Timm2: the four month rule
  - weekly meetings, subject matter experts and AI team
  - month1:  I don't understand the problem but lets keep talking
  - month2:  I'm beginning to see what is going on, code up analysis tools
  - month3:  I know what I'm doing, I'm trying different things
  - month4:  Finally, we can say useful things to the local experts and they can  undersand what I am doing. Much interaction and interpreation of results.  Report writing.
  
- Karpathy: Software 2.0 [^kel]
  - Team1: standard se. development. GUIs. Database optimization. etc etc etc 
  - Team2: define choice space for Team1. Explore choices with an optimizer
    - "Gradient descent can write better code than you. I'm sorry".
    - often described within a neural context
    - but as we know, there are more options.
  - "To make the analogy explicit, 
    - in Software 1.0, human-engineered source code (e.g. some .cpp files) is compiled into a binary that does useful work. 
     - In Software 2.0 most often the source code comprises
       - the dataset that defines the desirable behavior 
       - the learner  architecture that gives the rough skeleton of the code, but with many details (weights, rules) to be filled in.


[^kel]: Andrej Karpathy, Software 2.0, https://karpathy.medium.com/software-2-0-a64152b37c35, [pdf](soft2.pdf), Nov 11, 2017

