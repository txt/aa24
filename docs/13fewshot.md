<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>


# Few shot Learning 

In the following, the author says **LLMs** not **learners** but given the results of this subject, I think an edit is in order:

- A particularly exciting aspect of **learners** is their knack for few-shot and zero-shot learning: they can learn to perform a task with very few examples. Few- shotting has particular synergies in software engineering, where there are a lot of phenomena (identifier names, APIs, terminology, coding patterns) that are known to be highly project-specific. However, project-specific data can be quite limited, especially early in the history of a project; thus the few-shot learning capacity of **learners** might be very relevant. 
- In the extreme case, training data consists of only one instance for each target class, which is known as one-shot learning

Need another name

- Few-shot learning is usually a neural model concept
  - Uses a large language models trained on massive code corpora
  - Generalize to new tasks via a sequence of prompts, starting  composed of natural language instructions, then  few instances of task demonstration, and a query 
- Few-shot learning (version 2.0)
  - takes no model as an input (but it could be initialized from a model learned at a prior session) 
  - Generalize to new tasks via a sequence of queries to the data, selected by the model built so far.  
- Perhaps it might be useful to combine SMO and few-shot into another term

Generalize to new tasks via a sequence of prompts, starting  composed of natural language instructions,
- Data-Efficient Sequential Learning (DESL)
  - Sequential Decision-Making  : how to making decisions one after another, where each decision is based on prior outcomes. 
  - Data Selection Strategy : how to selecting which data points to label or otherwise interact with next. In SMO, this is the acquire function. 
  - Model Adaptivity : how to update your models for SDM and/or DSS as a result of the interaction seen in DSS
  - Label Efficiency : concerns the cost of labelling. DESL is least useful when the label effeciency is high.
- Other analaogous terms include active learnin which  in statistics literature also called optimal experimental design or query learning,
    is a class of strategies to choose the data from which to learn.

Few-shot learning is a subfield of machine learning and deep learning that aims to teach AI models how to learn from only a small number of labeled training data.

More generally  "n-shot learning" a category of artificial intelligence that also includes:

- one-shot learning (in which there is only one labeled example of each class to be learned)
- and zero-shot learning (in which there are no labeled examples at all

Applications:

- Healthcare: rarity of certain conditions or the expertise required to accurately annotate medical data (like MRIs or echocardiography) 
  can make the acquisition of a large number of labeled samples prohibitively difficult
- Robotics:  enable robots to quickly adapt to new environments
- SE: Any learning task when labels are short: e.g. what tests to run next, etc etc


Methods:

- transfer learning (use knowledge from elswhere)
  - adapt a pre-trained model
  - e.g. for us in SMO, intialize our best,rest models from prior applications
    - this can be very useful since, rarely, do we ever do things once
    - if it is important, we will do it again and again and again...
- Data-level approach
  -  automatically generate additional training samples
  - Data generation
    - GANs (generative adaptive networks)
      - Two models discrimninator  and adversay
      - Model1 produces
      - Model2 classifies as right,wrong
      - Model1 stops when model2 can  no long distinguish good from bad
      - Feedback from one model can be used to guide the other
      - And if you thought one deep learner was slow, try running two
  - Data augmentation
    - Find ways to add in the missing bits
    - Semi-supervised learning e.g. RRP, label once per leaf, share the label across entire leaf
    - Active learning; e.g. SMO, only ask for labels on most informative examples. 


## Few Shot Learning in SE

March 2024: Google query: "few-shot learning and 'software engineering'"

In the first 100 returns, after paper70, no more published few shot learning papers in SE.

In the remaining 70 papers:

|year|citations|venue|j=journal; <br>c=conf;<nr> w=workshop|title|pdf|data|
|--|--|--|--|--|--|--| 
|2023|1|Icse_NLBSE|w|Few-Shot Learning for Issue Report Classification|[pdf](Few-Shot_Learning_for_Issue_Report_Classification.pdf)|200 + 200|
|2023|2|SSBSE|c|. Search-based Optimisation of LLM Learning Shots for Story Point Estimation|[pdf](SB_LLM_Shot_optimisation.pdf)|6 to 10|
|2023|2|ICSE|c|Log Parsing with Prompt-based Few-shot Learning|[pdf](Log_Parsing_with_Prompt-based_Few-shot_Learning.pdf)|4 to 128. most improvement before 16|
|2023|3|AST|c|FlakyCat: Predicting Flaky Tests Categories using Few-Shot Learning|[pdf](FlakyCat_Predicting_Flaky_Tests_Categories_using_Few-Shot_Learning.pdf)|400+|
|2023|5|ICSE|c|Retrieval-Based Prompt Selection for Code-Related Few-Shot Learning|[pdf](Retrieval-Based_Prompt_Selection_for_Code-Related_Few-Shot_Learning.pdf)|6-7 (for code generation (40 to 50 (for code repair)|
|2022|7|Soft.Lang.Eng|c|Neural Language Models and Few Shot Learning for Systematic Requirements Processing in MDSE|[pdf](3567512.3567534.pdf)|8 to 11|
|2023|12|ICSE|c|Towards using Few-Shot Prompt Learning for Automating Model Completion|[pdf](Towards_using_Few-Shot_Prompt_Learning_for_Automating_Model_Completion.pdf)|212 classes|
|2020|15|IEEE ACCECSS|j|Few-Shot Learning Based Balanced Distribution Adaptation for Heterogeneous Defect Prediction|[pdf](Few-Shot_Learning_Based_Balanced_Distribution_Adaptation_for_Heterogeneous_Defect_Prediction.pdf)|100s - 1000s|
|2019|21| Big Data|j|. Exploring the applicability of low-shot learning in mining software repositories|[pdf](s40537-019-0198-z.pdf)|100 =>70% accuracy; 100s ==> 90% accuracy|
|2021|27|ESEM|c|An Empirical Examination of the Impact of Bias on Just-in-time Defect Prediction||10^3 samples of defects|
|2020|29|ICSE|c|Unsuccessful Story about Few Shot Malware Family Classification and Siamese Network to the Rescue|[pdf](3377811.3380354.pdf)|10,000s ?|
|2022|65|ASE|c|Few-shot training LLMs for project-specific code-summarization|[pdf](3551349.3559555.pdf)|10 samples|
|2022|101|FSE|c|Less Training_ More Repairing Please: Revisiting Automated Program Repair via Zero-Shot Learning|[pdf](3540250.3549101.pdf)|?|



## Challenges

Use LLMs as the oracle?

- But were to get the model trained on the specifics of our data?
  - https://arxiv.org/pdf/2308.10620.pdf#page=15
