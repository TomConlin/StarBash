# Generate standalone version of notebook
all:  README.html

README.html : star_bashing.html
	cp star_bashing.html README.html

star_bashing.md: star_bashing.ipynb 
	ipython nbconvert --to markdown star_bashing.ipynb 

#pdf: star_bashing.pdf
#star_bashing.pdf: star_bashing.ipynb 
#	ipython nbconvert --to pdf star_bashing.ipynb 	
# fails with 
# [NbConvertApp] CRITICAL | pdflatex failed: [u'pdflatex', u'notebook.tex']

star_bashing.html: star_bashing.ipynb 
	ipython nbconvert --to html star_bashing.ipynb 

clean: 
	rm README.html star_bashing.html star_bashing.md
	
.PHONY : all  clean
