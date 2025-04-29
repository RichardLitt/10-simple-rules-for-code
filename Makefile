LATEX=pdflatex
BIBTEX=bibtex
STEM=code-rules

all : commands

## commands : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} \
	| sed -e 's/## //g' \
	| column -t -s ':'

## pdf : re-generate PDF
pdf :
	${LATEX} ${STEM}
	${BIBTEX} ${STEM}
	${LATEX} ${STEM}
	${LATEX} ${STEM}

## spell: check spelling
spell:
	aspell --mode tex check code-rules.tex

## clean : clean up junk files.
clean :
	@rm -rf _site
	@find . -name '*~' -exec rm {} \;
	@find . -name '*.aux' -exec rm {} \;
	@find . -name '*.bak' -exec rm {} \;
	@find . -name '*.bbl' -exec rm {} \;
	@find . -name '*.blg' -exec rm {} \;
	@find . -name '*.dvi' -exec rm {} \;
	@find . -name '*.log' -exec rm {} \;
	@find . -name '*.out' -exec rm {} \;
	@find . -name .DS_Store -exec rm {} \;
