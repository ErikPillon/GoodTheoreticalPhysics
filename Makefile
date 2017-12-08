title = GoodPhysics

bibliography = bib.bib

bibfiles = *.aux

all: $(title).pdf

clean:
	rm -f *.pdf *.toc *.aux *.out *.log *.dvi *.bbl *.gz *.blg *.xml

archive:
	cd ..\
	zip -r  archive.zip GoodPhysics/
	
$(title).pdf: $(title).tex $(bibfiles)
	echo "==> Compiling file "$(title)".tex"; \
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
	bibtex $(title).aux
	pdflatex $(title).tex
	pdflatex $(title).tex
	

