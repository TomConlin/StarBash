# Generate standalone version of notebook
all:  README.md

README.md : star_bashing.md
	mv star_bashing.md README.md

star_bashing.md: star_bashing.ipynb 
	ipython nbconvert --to markdown star_bashing.ipynb 
	

clean: 
	rm README.md

	
.PHONY : all  clean	
