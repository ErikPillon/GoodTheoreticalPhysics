title = GoodPhysics

bibliography = bib.bib

bibfiles = *.aux

all: $(title).pdf 

clean:
	rm -f *.toc *.aux *.out *.log *.dvi *.bbl *.gz *.blg *.xml *.bcf

archive:
	cd ..\
	zip -r  archive.zip GoodPhysics/
	
$(title).pdf: $(title).tex $(bibliography) 
	pdflatex $(title).tex
	echo "==> Compiling Bibliography"; \
	for i in $(bibfiles); do \
		bibtex $$i ; \
		done
	pdflatex $(title).tex
	pdflatex $(title).tex
		
$(title).tex: $(chapters) 
	touch $(title).tex


full:
	pdflatex $(title).tex
	for i in $(bibfiles); do \
		bibtex $$i ; \
		done
	pdflatex $(title).tex
	pdflatex $(title).tex
	

