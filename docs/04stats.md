<a name=top><br>
  <p align=center>&nbsp;<a href="/README.md#top">home</a> ::
  <a href="/docs/syllabus.md#top">syllabus</a> ::
  <a href="https://docs.google.com/spreadsheets/d/16yxmklx4zvmfAHE7QocOQZZ4v4UxD5ktJHWMJEjBcMI/edit#gid=0">groups</a> ::
  <a href="/LICENSE.md#top">&copy;&nbsp;2024</a>, <a href="http:/timm.fyi">Tim Menzies</a><br>
  <a href="/README.md#top"><img width=600  
     src="/etc/img/ase24.png"></a></p>


# Stats

Does 42==44?

If we watched 100 women and men walk past us and their mean walking tipped was 42 and 44 cm/second (for men and women respectively), it is true that men walk faster than women?

This is an example of the problem of comparing distributions. These problem as two parts:

- Are the distributions distinguishable?
  - If we picked a number from one distibtuion, can we tell of it can be found on the other?
  - This is the (badly named) singificance test.
- Is the different between them non-trivial:
  - This is the effect size test
  - And we want to ignore small effects.


Easy case: means far away and the curves do not overlap

- So the curves are significantly different
- with large effect

![image](https://github.com/txt/aa24/assets/29195/3a0eaad2-4986-463b-a1f0-e26d8500efae)


Now we increase the standard deviation.

- So much overalp. Curves may not be significantly different
- And now that mean seperation seems less different

![image](https://github.com/txt/aa24/assets/29195/ee3e7184-4f78-4c88-bd66-34c2d61c98e5)

## Parametric Statistical Tests

If we assume that our data comes from a certain distrubtion
