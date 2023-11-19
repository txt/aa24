asa


# Summary: 9 Types of Sampling Methods

Ref: [Sampling in Software Engineering Research](/refs.md#Baltes22)
## What is Sampling?
Sampling involves selecting a subset of subjects from a larger population for statistical studies. It's a practical approach to make research more efficient and cost-effective. Key elements affecting a sample's quality include:
- **Accuracy**: Eliminating bias and influence.
- **Precision**: Providing  answers to research questions.
- **Recall**: Covering all examples of the goal you seek
- **False alarms**: mistaking "not it" for "it"
- **Representativeness**: Reflecting the population's demographics accurately.

# That old Joke

From  wikipedia:

- The streetlight effect, or the drunkard's search principle, is a type of observational bias that occurs when people only search for something where it is easiest to look.[1] Both names refer to a well-known joke:
  - A policeman sees a drunk man searching for something under a streetlight and asks what the drunk has lost. He says he lost his keys and they both look under the streetlight together. After a few minutes the policeman asks if he is sure he lost them here, and the drunk replies, no, and that he lost them in the park. The policeman asks why he is searching here, and the drunk replies, "this is where the light is".[2]

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*8hsuKGOCRyAyrRVauzNgCQ.jpeg)

Timm's comment:

- What do you want to happen? 
- The drunk searches by the car, finds his keys, drives home drunk, thereby
     threatening the general populace
- The drunk searches under the streetlight, finds tracks of a bus, follows that to a bus stop, and is drive safely home by the bus driver.


## Types of Sampling
Sampling methods fall into two categories:
- **Probability sampling**: Allows calculating the probability of each person being selected, offering greater mathematical precision.
- **Nonprobability sampling**: Lacks the ability to calculate individual selection probabilities, often resulting in less accuracy and representativeness.

## When you can't Sampling Everything


- You are the captain of a fishing boat. Your boat has a crew of six. Each day, before you catch anything, you waste hours burning expensive fuel traveling between promising fishing spots. What software help you look at the ocean and find the fish faster?
- You need a car for Monday but you aren't really sure what kind you like. After a day of going to car yards, and doing a few test drives, you buy a car. Can software help you narrow down how many cars you need to look at?
- You are an architect trying to design houses with a house with lots of light but no glare. You client is a busy (and fussy) person and before you show them all the possible designs, can software help you prune them back to an interesting subset?
### Probability Sampling Methods
1. **Simple Random Sampling (SRS)**: Equal selection probability for each participant.
2. **Stratified Sampling**: Dividing the population into strata and sampling from each.
3. **Systematic Sampling**: Selecting a subgroup based on a fixed interval from a list.
4. **Cluster Sampling**: Dividing into clusters, often geographically, and randomly selecting entire clusters.
5. **Multistage Sampling**: Combining different sampling methods at various study stages.

### Nonprobability Sampling Methods
1. **Convenience Sampling**: Choosing readily available participants.
2. **Quota Sampling**: Selecting based on predefined traits.
3. **Judgmental Sampling**: Selection at the researcher's discretion.
4. **Snowball Sampling**: Participants recruit other participants, useful for hard-to-reach groups.

## What to Avoid in Sampling
- **Voluntary Response Sampling**: Attracts only highly opinionated participants, leading to unrepresentative samples.
- **Convenience Sampling**: Prone to bias and non-generalizable results.

In summary, choosing the right sampling method is crucial for research accuracy and representativeness. Probability sampling is generally preferred over nonprobability methods due to its ability to produce unbiased and representative results.

# A Counter View

Sometimes, thrashing around and working it out afterwards is good approach

Things discovered by accident:
- Penicillin (some mouldy bread left out by accident)
- Smoke Detectors (thy were after a poison gas detector)
- Velcro (began by noticing barbs of a dog's fur had many tiny hooks)
- Viagra (intended for high blood pressure)
- Valium (a failed attempt at creating fabric dyes).
- Blood Thinner Warfarin (cattle  grazing on moldy sweet clover hay began to suffer from internal bleeding)
- Matches (accidentally scraped a coated stick across a hearth)
- Coca-Cola (originally, a morphine dependency that he hoped to curb by inventing an effective, opiate-free alternative)
- America (by the Spaniards)
- The Big Bang (residual radiation)

If we raise the cost of experimentation too much, it cuts out those with few resources.

Also, the delays involved in "doing in properly" can delay urgently needed results (COVID vaccine) or drive
scientific attention against not-so-common diseases.

And consider, how much of "science" is getting excited by the affordances  of some newly available instrument
(e.g. LLMs). 

Famous scientist Noam Chomsky offers the streelight effect as a picture of how science actually works.

More generally, [Breimann01](/refs.mid#Briemann01)  talks about "two cultures" in statistics:

- Data modeling Culture: one that seeks to confirm a prior belief in a distribution, 
  - "Assume that the data are generated by the following model:"
- Algorithmic modeling Culture: and the other that just leans in with some data miners and  asks "what can we see here?". Neither
- (a commitment to one culture or the other( has led to irrelevant theory, questionable conclusions, and has kept statisticians from working on a large range of interesting current problems.

Neither is universally right or wrong. Both are appropriate, in certain circumstances.

Having talked much about this to many methodologists, I can offer the following truce between data modeling and Algorithmic modeling.
- The core complaint against the latter is that is
makes up stuff as it goes (no rigor). 
- So if, before we start, we can specify how we will incrementally update our beliefs (before any data is seen)..
  - then this can mollify (some) opponents of algorithmic modeling.

## Anyway, Sampling and SE

- You are the manager of a software project, with many tricks for running a project. Any one project uses just a few of those tricks, but which one to apply? Can software help you learn which tricks are best (and wish to avoid)?
- Your software is being assessed by a focus group (a set of stakeholders). Your software is complex and this group has limited time to understand it and certify that the software is behaving reasonably2.
- Software analytics learn models from data. Data labels are often incorrect and so they need to be checked before they are used. But data sets can be huge, and relabelling everything can be so expensive. So can our software tells us what is the least number of examples to label?
- A software engineer can't try options but after a few experiments, they ship a product. For example:
- Data miners are controlled by billions of hyper-parameter options that control (e.g.) the shape of a neural net or how many neighbors your use for classification4. These parameters let you trade off (e.g.) how many mistakes you tolerate versus how many results you return; or accuracy versus fairness5.
MySQL's Makefile has billions of configurations options, each of which means your SQL queries take different times to run and use different energy


- as a runtime checker (cluster the data, then report any new inputs that fall outside the range of the clusters of the test data used to test the system) [Liu18](/refs.md#Liu18)
- as an optimization tool (don't explore the whole space; instead cluster and run your analysis on many small clusters)i [Majumder18](/refs.md/#Maj18) 
- as an optimizer in its own right (see below) [Chen19](/refs.md#Chen19)
- as a test generation tool (to partition the input space, then run just a few tests per partition) [Stallenberg21](/refs.md#Stallenberg21)
stall]
- as a verification tool to visualize the output space of a system [Davies10](/refs.md#Davies10) 
- as a requirements engineering tool (to encourage a fast discussion across the whole space) [Veerappa11](/refs.md#Veerappa11)
  - In the summer of 2011 and 2012,  I spent two months working on-site at Microsoft Redmond, observing data mining analysts.
    - I observed numerous meetings where Microsoft’s data scientists and business users discussed logs of defect data. 
    - There was a surprising little inspection of the output of data miners as compared to another process, 
        which we might call _fishing_. 
    - In fishing, analysts and users spend much time inspecting and discussing small samples of either raw or exemplary or synthesized project data. 
    - For example, in _data engagement meetings_, users debated the implications of data displayed on a screen. 
    -  In this way, users engaged with the data and with each other by monitoring each other’s queries and checking each other’s conclusions.
- As a privacy tool (why share all the data? why not just cluster and just a few cluster centroids?) [Peters15](/refs.md#Peters15)
  - [Fayola Peters](https://www.ezzoterik.com/papers/15lace2.pdf) used cluster + contrast to prune, as she passed data around a community. 
   - For example, in the following, green rows are those nearest the cluster centroids and blue rows are the ones most associated with the last column
       (bugs/10Kloc).
   - Discard things are aren't blue of green. 
   - She ended up sharing 20% of the rows and around a third of the columns. 1 - 1/5\*1/3 thus offered 93%   privacy
   - As for the remaining 7% of the data, we ran a mutator that pushed up items up the boundary point between classes (and no further). Bu certain common measures of privacy, that made the 7% space 80% private. 
   - Net effect 93% + .8*7 = 98.4% private,
   - And, FYI, inference on the tiny green+blue region was as effective as inference over all


<img width=700 src="https://github.com/timm/tested/blob/main/etc/img/peters1.png">


<img width=700 src="https://github.com/timm/tested/blob/main/etc/img/peters2.png">
