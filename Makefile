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
LATEXMK_ARGS += -pdf
LATEXMK := latexmk

LATEXINDENT_ARGS :=
LATEXINDENT_ARGS += -c build
LATEXINDENT_ARGS += -y="defaultIndent: '    '"
LATEXINDENT := latexindent

PAPER=main

.PHONY: default
default: watch

.PHONY: watch
watch:
	${LATEXMK} ${LATEXMK_ARGS} -pvc ${PAPER}

.PHONY: build
build:
	${LATEXMK} ${LATEXMK_ARGS} ${PAPER}

.PHONY: fmt
fmt:
	${LATEXINDENT} -w ${LATEXINDENT_ARGS} ${PAPER}.tex

.PHONY: check-fmt
check-fmt:
	${LATEXINDENT} -k ${LATEXINDENT_ARGS} ${PAPER}.tex

.PHONY: clean
clean:
	${LATEXMK} -c

.PHONY: cleanall
cleanall:
	${LATEXMK} -C
