.DEFAULT_GOAL := default

LATEXMK_ARGS :=
# -xelatex runs the TeX files through XeLaTeX instead of regular LaTeX
LATEXMK_ARGS += -xelatex
# -shell-escape allows us to use Minted to generate colorized listings
LATEXMK_ARGS += -shell-escape
# -output-directory keeps the build artifacts separate from the source data
LATEXMK_ARGS += -output-directory=build
# -halt-on-error automatically aborts out of the TeX prompt on error.
LATEXMK_ARGS += -halt-on-error
LATEXMK_ARGS += -pvc
LATEXMK_ARGS += -pdf
LATEXMK := latexmk ${LATEXMK_ARGS}

PAPER=main

.PHONY: default
default:
	${LATEXMK} ${PAPER}

.PHONY: clean
clean:
	${LATEXMK} -c

.PHONY: cleanall
cleanall:
	${LATEXMK} -C
