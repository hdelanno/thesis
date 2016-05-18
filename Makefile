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
	git commit -m "Quick save at `date -u`"
	git push origin
	git push iihe-daq

plots:
	root -q -b -l tools/import_plots.cpp

clean:
	rm thesis-blx.bib thesis.aux thesis.bbl thesis.blg thesis.log thesis.lof thesis.lot thesis.out thesis.run.xml thesis.toc
