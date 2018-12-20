BUILD=texstudio_build
LATEX=pdflatex
BIBTEX=bibtex

# Make sure that the build directory exists.
$(shell mkdir -p $(BUILD) >/dev/null)


all: pdf/thesis.pdf pdf/handout1.pdf pdf/handout2.pdf


pdf/thesis.pdf: thesis.tex thesis.bib
	$(LATEX) -output-directory=$(BUILD) thesis.tex
	$(BIBTEX) $(BUILD)/thesis.aux
	# Compile twice so references work.
	$(LATEX) -output-directory=$(BUILD) thesis.tex
	$(LATEX) -output-directory=$(BUILD) thesis.tex
	mv $(BUILD)/thesis.pdf pdf

pdf/handout1.pdf: handouts/handout1.tex thesis.bib
	$(LATEX) -output-directory=$(BUILD) handouts/handout1.tex
	$(BIBTEX) $(BUILD)/handout1.aux
	# Compile twice so references work.
	$(LATEX) -output-directory=$(BUILD) handouts/handout1.tex
	$(LATEX) -output-directory=$(BUILD) handouts/handout1.tex
	mv $(BUILD)/handout1.pdf pdf

pdf/handout2.pdf: handouts/handout2.tex thesis.bib
	$(LATEX) -output-directory=$(BUILD) handouts/handout2.tex
	$(BIBTEX) $(BUILD)/handout2.aux
	# Compile twice so references work.
	$(LATEX) -output-directory=$(BUILD) handouts/handout2.tex
	$(LATEX) -output-directory=$(BUILD) handouts/handout2.tex
	mv $(BUILD)/handout2.pdf pdf

clean:
	rm -f $(BUILD)/* thesis.pdf pdf/*.pdf

.PHONY: clean
