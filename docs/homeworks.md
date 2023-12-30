# Homeworks

Recode my Lua code in Python. 
- Understand my code
- Use ChatGPT, if you are brave.
- But you need to understange EVERY LINE of my code
  - Exams will show you buggy version of my Lua and you will  be asked the following question:
    -  Locate and list the bugs;
    -  Described in Eglish the effects of those bugs
    -  Describe in English  how to change the code  

Using minimal imports 
- no: noscikitlearn,   pandas,   argparse,   optparse,   fire,   click
- yes: re, ast, etc

## Resubmission

Homeworks can be submitted once, then resubmitted twice more. But homeworks due week in week "i" will not be remarked after week "i+2".  

## Grading

Graded weekly
- 2 = good enough
- 1 = do more
- -1 = not enough

If no submission each week, then -1.  If not enough submitted each week then -1.

## Branches
Work any braching system you like but  students will lose marks if we do not see, from each student,   regular submissions to a branch named "main".


## Tasks

For weeks 2,3,4,5 work from gate.lua. After that, move to mylo.lua

### Week2

- make maintainable: divide into N files
- make readable: add documentation
  - a "-h" flag on the command line.
  - generation of pretty html pages for the code
- make testable:
  -  your code needs test cases (at least 3 per student per week)
  -  add pre-commit hook for tests pass/fail
  -  build a test engine where
     -   from command line can run one or all or tests (and if running all, return number of failing tests to oeprating system)
     -   ensure your setup resets the seed and caches the config
     -   ensure your teardown resets to config to the cached values
- make automated : add a Makefile to automatically rebuild all the docs, rerun all the tests.
- do eg.csv.

### Week3

- do eg.data

### Week4

- do eg.bayes and eg.km

### Week5

- do eg.gate
