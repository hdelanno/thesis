all: fast clean

full: bib clean

fast:
	pdflatex thesis
	pdflatex thesis

bib:
	pdflatex thesis
	bibtex thesis
	pdflatex thesis
	pdflatex thesis

save:
	git add .
	git rmd
	git commit -m "Quick save at `date -u`"
	git push origin
	git push iihe-daq

plots:
	root -q -b -l tools/import_plots.cpp

feynman:
	cp tools/feynman-draw.tex .
	latex feynman-draw.tex
	mpost feyngraph.mp
	latex feynman-draw.tex
	dvipdf feynman-draw.dvi
	pdfcrop feynman-draw.pdf diagram.pdf
	sips -s format png diagram.pdf --out diagram.png
	rm feynman-draw.* feyngraph.* diagram.pdf

clean:
	rm thesis-blx.bib thesis.aux thesis.bbl thesis.blg thesis.log thesis.lof thesis.lot thesis.out thesis.run.xml thesis.toc feynman-draw.* feyngraph.* diagram.pdf diagram.png
