<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/1YHZPRLfchksx541yaojJE_loOh2g4FaVKtrVcquoYIw/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# Choice

(In this lecture it is argued that "choice" is an important concern in SE.)

This course is about all things SE and AI. There is a seperate 
CSC grad class on generative AI so here we mention LLMs, but focus
mostly on everything else.

And according to Long et al. [^long23]
there is a lot of "everything else". Here's there study from 20 years of
empirical data and 50 years of literature. They break up SE development
into six phases where, in each, software engineers (a) plan what to do;
(b) do some coding; (c) check what you got. 

|phase | activity=<br>planning | activity=<br>coding | activity=<br>testing|
|---------------------------------|----------|---------|--------|
|1. Requirements Analysis         |          |         |        |
|2. Architecture & Design         |          |         |        |
|3. Coding                        |          |         |        |
|4. System Integration            |          |         |        |
|5. Qualification Testing         |          |         |        |
|6. Development Test & Evaluation |          |         |        |

Long et al. argue that, on balance, engineers spend a third of the time
in planning, coding, and testing. And here are their numbers:

<img src="/etc/img/phase.png" width=600>

[^long23]: D. Long, S. Drylie, J. Ritschel and C. Koschnick, 2023,
"An Assessment of Rules of Thumb for Software Phase Management, 
and the Relationship between Phase Effort and Schedule Success," 
in IEEE Transactions on Software Engineering, doi: 10.1109/TSE.2023.3339383.

Now consider where all the LLM tools (co-pilot) help SE development. Its mostly
coding. And accroding to the above, at least two-thirds of SE is not about coding.

What kinds of automated support cover the above tasks? Well, one thing that
falls across all the above phases and activities  is _choice_.

- requirements means helping stakeholders trade-off between choices;
- design means exploring and decising implementation choices;
- testing (all kinds) means choosing to test for this and not for that
  (since we cannot test for everthing).

Choice is a **big issue** since there are so many choices and we usually do them so badly:

- The LINUX kernel is the technological backbone of our global information society (it is used in the servers that power the internet, in data centers, in Android phones, just to name a few). That kernel has a grow number of thousands of features [^passos], each of which can be selected, or ignored in a particular system.

<img width="533" alt="image" src="https://github.com/txt/aa24/assets/29195/0a8a63aa-a9fe-4fff-8007-1d0b216a1c0e">

- Textbooks describing agile processes mentions  over 128 options for  managing agile projects. A model  of  these options has  over a sextillion choices (2<sup>128</sup>=10<sup>38</sup>).   Some of these options are inherently discriminatory against  smaller organizations or organizations that include newcomers to the profession of programming.
- Theorem provers are AI tools for solving logical equations. State-of-the-art theorem provers use a wide range of optional tricks to solve different kinds of problems. For example, the cvc5 smt-lib solver comes with 400 configuration choices (of which 268 are labeled “experts only”, see https://cvc5.github.io/docs/cvc5-1.0.8/options.html). Just think about that. Theorem provers are used to check safety critical systems-- and the conclusions they generate are a quirk of what config settings we use.

[^passos]: L. Passos, et al.,"A Study of Feature Scattering in the Linux Kernel" in IEEE Transactions on Software Engineering, vol. 47, no. 01, pp. 146-164, 2021. doi: 10.1109/TSE.2018.2884911

And we really do not handle those choices very well.

-  The number of control parameters of a software package grows linearly with time. Meanwhile, human understanding of those choices only ever grows sub-linearly [^xu15].

  <img width="311" alt="image" src="https://github.com/txt/aa24/assets/29195/4ed13eeb-48ba-4146-9b11-cf24cbdd8c54">
  <img width="442" alt="image" src="https://github.com/txt/aa24/assets/29195/aab8bf59-1912-4ac3-aa31-d875e1a8d2a4">
  
- 30% of all cloud computing errors come from misconfigurations of cloud software [^zhou19].
- Even more alarming,  59% of the most severe performance bugs are caused by poor configuration--  making bad choices one of the most dangerous threats to software quality [^han16].
  
[^xu15]: Tianyin Xu, Long Jin, Xuepeng Fan, Yuanyuan Zhou, Shankar Pasupathy, and Rukma Talwadker. 2015. Hey, you have given me too many knobs!: understanding and dealing with over-designed configuration in system software. In (ESEC/FSE 2015). 307–319. https://doi.org/10.1145/2786805.2786852
[^zhou19]: Yuanyuan Zhou, Keynote address, IEEE Automated Software Engineering conference, San Diego, California, USA, 2019. https://2019.ase-conferences.org/info/keynotes#yuanyuan-yy-zhou-the-human-dimension-of-cloud-computing
[^han16]: Xue Han and Tingting Yu. 2016. An Empirical Study on Performance Bugs for Highly Configurable Software Systems. ESEM 2016, 23:1–23:10. https://doi.org/10.1145/2961111.2962602

- The internal choices inside a learner can have a dramatic effect on fairness and predictive performance.  
  Here are 10,000 configuration choices for data miners about
  -  left: who gets a bank account, 
  -  Middle: where to send grant money or
  -  Right: whether or not to give  defendants bail or jail time [^cruz21].  
  -  X-axis show accuracy and y-axis shows the ratio of false alarms between (left) men and women;
    (middle) rich schools and poor schools; whites and African American males. Note that the choices have a very wide range of effect.

<img width="500" alt="image" src="https://github.com/txt/aa24/assets/29195/520aee53-51b9-49c9-a109-90cfc13c1812">

[^cruz21]: F.Cruz, P. Saleiro, C. Belém, C. Soares and P. Bizarro, "Promoting Fairness through Hyperparameter Optimization," IEEE ICDM, 2021, pp. 1036-1041, doi: 10.1109/ICDM51629.2021.00119.

## And now the good news

-  It turns out that automatically making decisions about choices in software is a great  unsung success story. AI tools are very  successful at predicting how choices affect software [^siegmund].
-   Those same AI  tools, with small modifications can also tell us how to change those choices in order to improve runtimes, energy usage , fairness and performance [^guo].
-   For example,  automatic configuration tools can find better choices for the design of cell phone apps that uses far less energy [^mario]

<img width="610" alt="image" src="https://github.com/txt/aa24/assets/29195/66be4fee-b3a6-4456-b333-e1c0498a5704">

[^guo]: Jianmei Guo, Krzysztof Czarnecki, Sven Apel, Norbert Siegmund, Andrzej Wasowski:
Variability-aware performance prediction: A statistical learning approach. ASE 2013: 301-311
[^siegmund]: Siegmund, N., Dorn, J., Weber, M., Kaltenecker, C., & Apel, S. (2022). Green configuration: Can artificial intelligence help reduce energy consumption of configurable software systems?. Computer, 55(3), 74-81.
[^mario]: Mario Linares-Vásquez, Gabriele Bavota, Carlos Bernal-Cárdenas, Massimiliano Di Penta, Rocco Oliveto, and Denys Poshyvanyk. 2018. Multi-Objective Optimization of Energy Consumption of GUIs in Android Apps. ACM Trans. Softw. Eng. Methodol. 27, 3, Article 14 (July 2018), 47 pages. https://doi.org/10.1145/3241742

- Outside of SE, it is   standard to see automatic choose tools to self-configure their systems:
  - High performance computing environments come with their own tuning tools [^golovin].  
  - Also, in the 1990s, it was standard practice in the database community to offer tuning tools alongside of databases systems [^chaudhuri].

[^golovin]: Golovin, D., Solnik, B., Moitra, S., Kochanski, G., Karro, J., & Sculley, D. (2017, August). Google vizier: A service for black-box optimization. KDD’17 (pp. 1487-1495).
[^chaudhuri]: Surajit Chaudhuri and Vivek Narasayya. 2007. Self-tuning database systems: a decade of progress. In Proceedings of the 33rd international conference on Very large data bases (VLDB '07). VLDB Endowment, 3–14.

## So Many Challenges Associated with Choice

There is a need to integrate methods for automating choice into legislative frameworks. To date, regulation frameworks and certification standards ignore the fact that software is configurable. Certifying one configuration of a software (by making a set of choices) does not necessarily mean that other configurations (with other choices) shall also be certified or even applicable across other contexts. On the other hand, we cannot certify all configurations, as there are easily billions. To solve this problem, Dr. Apel looks to   configuration-award techniques from program analysis , impact analysis , and tuning methods (see next section).

<img width="364" alt="image" src="https://github.com/txt/aa24/assets/29195/da3e51e9-9af7-4ac0-9092-e4a35e6b7bfe">

[^veerappa]: V. Veerappa and E. Letier, "Understanding clusters of optimal solutions in multi-objective decision problems," 2011 IEEE 19th International Requirements Engineering Conference, Trento, Italy, 2011, pp. 89-98, doi: 10.1109/RE.2011.6051654..

Another open challenge is the integration of human and artificial intelligence while making choices.  There are different kinds of stakeholders so our tools must be tailored to their different needs.  When choices conflict, subjective stakeholder opinion becomes important since those opinions let us make trade-offs across the decision space. Once an algorithm proposes some choices, it may still be up to stakeholders to decide which choices are inappropriate. For example, researchers exploring the requirements   for London ambulances, found that  the feasible solutions formed a couple of different clusters (see Figure 4).  Insert Figure 4 around here This tells us that there is not one solution, but several, and humans are needed to decide which solution they prefer. Many researchers work towards supporting this kind of human-in-the-loop decision making .  




