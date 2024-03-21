import itertools

x = ["b", "c", "d"]
y= [1, 4, 9]
z=[10,20]

combinations = list(itertools.product(x,y,z))

print(len(combinations))
