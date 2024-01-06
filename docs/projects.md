<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/1YHZPRLfchksx541yaojJE_loOh2g4FaVKtrVcquoYIw/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>

# projects

## basic

banchmark smo againt random, rrp

for https://arxiv.org/pdf/2311.17483.pdf, fig 9, what support can you add to support (say) 5 of the lefthand side reqirements? comparing mylo and gate, which is better than the other

table7 of https://arxiv.org/pdf/2311.17483.pdf: how many of these have goals we can optimize for?

table9 of https://arxiv.org/pdf/2311.17483.pdf: how well do any of those work with < 30 samples? can you think of some hybrid of gate/mylo that mught augment/replace any of these?

## process

- management team: milestones management, user liason,
  task priorization
- tooling team: doc, scripts, short cuts, pre-, post- commit hooks
  - please consider pdoc or pycco
- testing team: lots of tests, maintaining the test suite,
  running the test suite, test case prioriization
- coding team; new functionality
  - divide the code base into N bits
- the optimization team. welcome to software 2.0
  - Software 2.0 most often the source code comprises 
   -  the dataset that defines the desirable behavior 
   - the architecture that gives the rough skeleton of the code, 
     but with many details (the config options) to be filled in. 
   - some optimizaion strategy that keeps reviewing the
     data to adjust the config options.

lcocal vs gloab, reset at each stage

## Tasks
- apply rrp to some new domain (in se)
- x is y and when i code it that way, i get results (for x or y) that
  beat the prior state of the art (simpler and faster or better)
- destroy all this tech. find someway to improta tables
  of data with no goal info and after minimal questions
  learn which rows a preferred by most users
  - note: I don't know how to do this. 
- sway vs sequential model optimize (bayes)
- try different clustering. different recursive bi-cluster
- try a project managers toolkit. 
- try and improve xiao's stuff
- anyway to map subjective opinions (from chatgpt) into search-based?
  - https://arxiv.org/pdf/2311.11081.pdf
  - anyway to bias (in a good way), sway's search using LLMs?   
    - maybe not https://arxiv.org/pdf/2306.13298.pdf (\*)
  - hint: maybe dont use chatgpt but a local LLMso
    - see  "LLMs on the command line" at https://www.infoworld.com/article/3705035/5-easy-ways-to-run-an-llm-locally.html
    - see also https://www.infoworld.com/article/3700869/14-llms-that-arent-chatgpt.html
- testing our tools via chatgpt https://dl.acm.org/doi/pdf/10.1145/3624032.3624035
  - make sure you have a baseline (testing via some other defendable approach)

(\*) but see vivek's paper suggesting that don't matter.

- comapre rrp vs cloassification or regresison algorithms for SE taksks
- Table 1,2 of [this paper](https://csdl-downloads.ieeecomputer.org/trans/ts/5555/01/10314766.pdf?Expires=1703969010&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jc2RsLWRvd25sb2Fkcy5pZWVlY29tcHV0ZXIub3JnL3RyYW5zL3RzLzU1NTUvMDEvMTAzMTQ3NjYucGRmIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNzAzOTY5MDEwfX19XX0_&Signature=vkbhgVvW8l9aPJz9K14TAH178rlS9sBiht6nrLq8X~BcgvnTax~LL6GRoIhRLUVMkmWVgyMW-eSqfi3Pe1WlHb5oMxmQxSSIyz4gN5tjAr3MYergqd4OPSfTxjEm2hN-pBXwVpaeMHZTJ077YMVcTIqMqn9bJmzaOHvhDKYeJa3K~ZmFQuvUzDL4263mT8NQr-nPTi6136O1DmqtxIOKXVpMSddcPhNx~2GWrEX63O7mEkSfS6vBfZpsYXMHqeEkqsoxd3H5SziuAcoHt0kr7ttdYGSUrmjicDXEOd19gXC8ksZmgx2Mw2dBLI-LBEvTsCfgwF0d8ueYR1F3AiFeFw__&Key-Pair-Id=K12PMWTCQBDMDT)
  discussed ways to reduce human fatigure. any work at our scale? (les than 30 questions)
  - R. Casamayor, C. Cetina, O. Pastor and F. Perez, "Studying the Influence and Distribution of the Human Effort in a Hybrid Fitness Function for Search-Based Model-Driven Engineering" in IEEE Transactions on Software Engineering, vol. 49, no. 12, pp. 5189-5202, 2023.
doi: 10.1109/TSE.2023.3329730
- another approach is to do fix the daa drougth via data synthesis
  - take all that is known of the independent attributes
  - generate a very large sample of those attributes. attach known labels. label everything 
    else via (e.g.) expected value k=2 nearest neighbors.
    - then do (say) classification on the result
    - or do optimizaiton and when new isntaces are proposed, apply k=2 nNN.

