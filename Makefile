# Generate standalone version of notebook
all:  README.md star_bashing.html edit_files
	
README.md : star_bashing.md 
	cp star_bashing.md README.md

star_bashing.md : star_bashing.ipynb 
	ipython nbconvert --to markdown star_bashing.ipynb 

# hackery to test if GH's nbviewer can tricked 
# into finding the local files
edit_files: otsu.awk  xyzriph_sparse.awk
	cp otsu.awk ./edit/otsu.awk
	cp xyzriph_sparse.awk ./edit/xyzriph_sparse.awk
	
	
#pdf: star_bashing.pdf
#star_bashing.pdf: star_bashing.ipynb 
#	ipython nbconvert --to pdf star_bashing.ipynb 	
# fails with 
# [NbConvertApp] CRITICAL | pdflatex failed: [u'pdflatex', u'notebook.tex']

star_bashing.html: star_bashing.ipynb 
	ipython nbconvert --to html star_bashing.ipynb 

clean: 
	rm README.md star_bashing.html star_bashing.md
	
.PHONY : all  clean edit_files
