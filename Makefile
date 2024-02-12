saved:
		@read -p "commit msg> " x; y=$${x:-saved}; git commit -am "$$y"; git push; git status; echo "$$y: saved!"

#docs: $(wildcard *.md)

# BODY='BEGIN {RS=""; FS="\n"} NR==1 { next } { print($$0 "\n")  }'
# HEAD='BEGIN {RS=""; FS="\n"} NR==1 { print($$0 "\n"); exit }'
# 
# %.md: ../README.md $(which gawk) 
# 	@echo "# filling in $@ ..."
# 	@gawk --source $(HEAD) ../README.md >  _tmp
# 	@gawk --source $(BODY) $@           >> _tmp
# 	@mv _tmp $@

~/tmp/%.pdf : %.md
	pandoc   -N -s --pdf-engine=pdflatex \
            -V 'geometry:margin=1in' -V 'fontfamily:dejavu' \
           --highlight-style tango \
           -V fontsize=8 -o $@ $^
