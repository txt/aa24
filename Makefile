saved:
		@read -p "commit msg> " x; git commit -am "$$x"; git push; git status

docs: $(wildcard *.md)

BODY='BEGIN {RS=""; FS="\n"} NR==1 { next } { print($$0 "\n")  }'
HEAD='BEGIN {RS=""; FS="\n"} NR==1 { print($$0 "\n"); exit }'

%.md: ../README.md $(which gawk) 
	@echo "# filling in $@ ..."
	@gawk --source $(HEAD) ../README.md >  _tmp
	@gawk --source $(BODY) $@           >> _tmp
	@mv _tmp $@
