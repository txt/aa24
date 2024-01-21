<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>


# Management AI projects

## Case Study

<img width="500" align=right alt="image" src="https://github.com/txt/aa24/assets/29195/197aea1a-8930-487a-993a-192da5787f70">

LexisNexis asked us to use AI to help manage their cloud services [^chen]:

- Mis-managed cloud services results in server downtime and an associated loss of revenue, 
  - particularly for organizations with penalty clauses in their service contracts. 
  - Even down times of just a few hours is detrimental to the professional reputation of an cloud-service provider. 
  - Poor reputation for reliability =  harder time attracting and retaining clients.
  - Service spikes can freeze up a cloud server. 
- Spikes like those shown below can lead to frustratingly slow systems performance (e.g. very slow displays of new web pages). 
  - Predicting service spikes is hard since they can occur rarely and may occur as sudden extreme outliers. 
  - Spike prediction is cmplicatied by rapidly changing nature of cloud environments. For example, 
  - In the year or two, LexisNexis has retired its locally managed CPU farms in favor of CPU farms managed by multiple major cloud vendors. 
  - Given the rapid pace of change in this area, more changes are expected soon.

[^chen]: Jianfeng Chen, Joymallya Chakraborty, Philip Clark, Kevin Haverlock, Snehit Cherian, and Tim Menzies. 2019. Predicting Breakdowns in Cloud Services (with SPIKE). 
FS'19 (industrial track).  August 26–30, 2019, Tallinn, Estonia. ACM, New York, NY, USA, 9 pages. https://doi.org/10.1145/3338906.3340450

Initially, we imagined that we would be building a recommender system that would

- suggest the number and type of cloud server instances that should be added or deleted
- in order to maintain service availability (at minimum cost). 
- In theory, such a recommender system could be learned from the historical logs of prior nominal and off-nominal behavior.
- But, once we realized how fast the cloud services were changing, i
  - we also realized that much of the historical log was no longer relevant to current practice. 

So we changed track and asked
“what are the major pain points of running the LexisNexis cloud
service?”. 
- This new question prompted our subject matter experts to
recounted various war stories about what happens when a service
spike occurs. 
- “It can take five to ten minutes to realize we have a
problem”, we were told, “after which it can take another few minutes
of calling/texting to get everyone we need into a conference call”.
- New goals:
  - Build comprehensible and effective predictors for service spikes, 30 minutes into the future

So welcome to the management of AI-releated projects
- Initial plans... change

## How to Manage Projects When the Requirements Keep Changing?

<img src="https://miro.medium.com/v2/resize:fit:1400/1*k66hoz5Y_9DId_a3UrgIpA.jpeg"
     width=500 align=right>

-  waterfall: plan-based [^Royce70]
  - a linear walk through analysis, design, code, test with 
    feedback from `step[i]` updating `step[i+1]`.  <br clear=all>

- spiral model: slowly, iterate to explore and (hopefully) retire risk, before committing to a fixed plan [^Boehm88].

<img width="658" alt="image" src="https://github.com/txt/aa24/assets/29195/d8037ca9-0195-45ec-a5ed-dcc5d8c306f8">

<br clear=all>

<img width=500 align=right   alt="image" src="https://github.com/txt/aa24/assets/29195/0b8727c4-912b-4026-aaaf-91ba699beef3">

- agile: maintain a backlog of stuff not yet done [^agile] [^hoda]
  - loop
    - sort backlog by value/time
    - sprint to finish the top N items
    - repeat <br clear=all>
- agilefall : working at a continuum between plan-driven (a.k.a. waterfall) 
  project management and agile project management
  - usually a pejorative term.
    - we pretend to be agile but actually, we never adapt to change.
  - taken seriously by some [^Bakg]

[^hoda]: Hoda, Rashina, Norsaremah Salleh, and John Grundy. "The rise and evolution of agile software development." IEEE software 35.5 (2018): 58-63.
[^agile]: Beck, K., Beedle, M., Van Bennekum, A., Cockburn, A., Cunningham, W., Fowler, M., Grenning, J., Highsmith, J., Hunt, A., Jeffries, R. and Kern, J., 2001. Manifesto for agile software development. https://agilemanifesto.org/
[^Royce70]: Winston W. Royce (1970). "Managing the Development of Large Software Systems" in: Technical Papers of Western Electronic Show and Convention (WesCon) August 25–28, 1970, Los Angeles, USA.
[^Bakg]: Bakhirkin, M.V., Lukin, V.N. (2022). Agilefall—Modern Realities of IT Project Management. In: Favorskaya, M.N., Nikitin, I.S., Severina, N.S. (eds) Advances in Theory and Practice of Computational Mechanics. Smart Innovation, Systems and Technologies, vol 274. Springer, Singapore. https://doi.org/10.1007/978-981-16-8926-0_26
[^Boehm88]: Boehm, B (August 1986). "A Spiral Model of Software Development and Enhancement". ACM SIGSOFT Software Engineering Notes. 11 (4): 14–24. doi:10.1145/12944.12948. S2CID 207165409.  https://www.cse.msu.edu/~cse435/Homework/HW3/boehm.pdf

## My  Variants:

I've often had to offer project plans to companies that like fixed price structures. So I offer them the following:

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
 
## Other Variants

### Software 2.0

- 2017: Karpathy: Software 2.0 [^kel]
  - One perpetually prototyping team supporting another standard SE team
  - Team1: standard se. development. GUIs. Database optimization. etc etc etc 
  - Team2: define choice space for Team1. Explore choices with an optimizer
    - "Gradient descent can write better code than you. I'm sorry".
    - often described within a neural context
    - but as we know, there are more options.
  - "To make the analogy explicit, 
    - in Software 1.0, human-engineered source code (e.g. some .cpp files) is compiled into a binary that does useful work. 
    - In Software 2.0 most often the source code comprises
       - the dataset that defines the desirable behavior 
       - rhe process of training learner compiles the dataset into a model, from which we can set the options.  
    - SE moves from a coding process to a decision process:

<img width="1161" alt="image" src="https://github.com/txt/aa24/assets/29195/8997b3f4-d142-4d73-907e-ecf0e3f4c4ed">


[^kel]: Andrej Karpathy, Software 2.0, https://karpathy.medium.com/software-2-0-a64152b37c35, [pdf](soft2.pdf), Nov 11, 2017

### Process Data from Microsoft



- 2017, time spent on variaous tasks in a data science team [^kim17]

  <img width="565" alt="image" src="https://github.com/txt/aa24/assets/29195/604e9079-6479-46e6-93f4-9c6701733232">

  <img width="823" alt="image" src="https://github.com/txt/aa24/assets/29195/898c03ef-054c-48c7-97d9-8f28421a42b6">



[^kim17]: Kim, M., Zimmermann, T., DeLine, R., & Begel, A. (2017). Data scientists in software teams: State of the art and challenges. IEEE Transactions on Software Engineering, 44(11), 1024-1038.

- 2019: Microsoft's analytics team [^Amershi19]:

[^Amershi19]: S. Amershi et al., "Software Engineering for Machine Learning: A Case Study," 2019 IEEE/ACM 41st International Conference on Software Engineering: Software Engineering in Practice (ICSE-SEIP), Montreal, QC, Canada, 2019, pp. 291-300, doi: 10.1109/ICSE-SEIP.2019.00042.


  <img width="898" alt="image" src="https://github.com/txt/aa24/assets/29195/44c95f45-bdff-4011-9e95-f20960b23048">

## Anyway, Back to LexisNexis

In the end, we optimized for   comprehensibility rather than just predictive performance. 

- Our experts required some report of the lessons learners that they can read, understand and audit.
- Hence, we used data mining methods that produce human readable models (e.g. not Naive Bayes classifiers, not neural networks, not instance-based learners, not random forests).

<img width="1039" alt="image" src="https://github.com/txt/aa24/assets/29195/65ef1cb9-9fae-47c8-87e7-26aaf2c66351">

<img width="1026" alt="image" src="https://github.com/txt/aa24/assets/29195/7b254602-fe84-45f7-8fed-8e8ad451670d">

<img width="1025" alt="image" src="https://github.com/txt/aa24/assets/29195/4365904f-c22d-4900-b2ad-fb4e3f6507d8">


In all, these results  took three
months to generate:

- 1 month of a LexisNexis data engineer generating our training
data by writing complex joins across large datasets.
- 1 month of inductive engineering, applying different data
mining methods to the data. As mentioned above, this proved
to be a tedious task that required developed and discarding a
dozen very bad predictors before finding one that achieved
useful results
- 1 month of a senior LexisNexis engineer serving as a liaison
between our team and the rest of LexisNexis. The importance
of the liaison cannot be overstated. That person (a) maintained senior management’s awareness and enthusiasm for
this project; (b) organized access to numerous subject matter
experts.

When staffing similar efforts in the future, I'd  recommend a similar
“three-sided” team comprising inductive engineers, data engineers,
and business knowledge experts.




