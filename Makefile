saved:
		@read -p "commit msg> " x; git commit -am "$$x"; git push; git status



