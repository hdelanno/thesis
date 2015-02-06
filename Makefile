all: _express clean

bib: _complete clean

_express:
	pdflatex thesis
	pdflatex thesis

_complete:
	pdflatex thesis
	bibtex thesis
	pdflatex thesis
	pdflatex thesis

clean:
	rm thesis-blx.bib thesis.aux thesis.bbl thesis.blg thesis.log thesis.lof thesis.lot thesis.out thesis.run.xml thesis.toc
