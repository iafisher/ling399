BUILD=texstudio_build
LATEX=pdflatex
BIBTEX=bibtex

# Make sure that the build directory exists.
$(shell mkdir -p $(BUILD) >/dev/null)


thesis.pdf: thesis.tex thesis.bib
	$(LATEX) -output-directory=$(BUILD) thesis.tex
	$(BIBTEX) $(BUILD)/thesis.aux
	# Compile twice so references work.
	$(LATEX) -output-directory=$(BUILD) thesis.tex
	$(LATEX) -output-directory=$(BUILD) thesis.tex
	mv $(BUILD)/thesis.pdf .

clean:
	rm -f $(BUILD)/* thesis.pdf

.PHONY: clean
