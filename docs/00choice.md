-

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

![](/etc/img/phase.png)

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


