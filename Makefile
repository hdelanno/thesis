all:
	pdflatex thesis
	bibtex thesis
	pdflatex thesis
	pdflatex thesis
	rm thesis-blx.bib thesis.aux thesis.bbl thesis.blg thesis.log thesis.lof thesis.lot thesis.out thesis.run.xml thesis.toc thesis.bcf feynman-draw.* feyngraph.* diagram.pdf diagram.png

save:
	git ls-files --deleted -z | xargs -0 git rm
	git add .
	git commit -m "Quick save at `date -u`"
	git push origin
	git push iihe-daq

plots:
	root -q -b -l tools/import_plots.cpp
	$(eval FILES := `ls img/plots/*.pdf`)
	for f in $(FILES) ; do \
		pdfcrop $$f; \
	done

feynman:
	cp tools/feynman-draw.tex .
	latex feynman-draw.tex
	mpost feyngraph.mp
	latex feynman-draw.tex
	dvipdf feynman-draw.dvi
	pdfcrop feynman-draw.pdf diagram.pdf
	sips -s format png diagram.pdf --out diagram.png
	rm feynman-draw.* feyngraph.* diagram.pdf
