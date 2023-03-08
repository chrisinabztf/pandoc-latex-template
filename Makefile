BASEDIR="."
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(BASEDIR)/templates
STYLEDIR=$(BASEDIR)/style

BIBFILE=$(INPUTDIR)/references.bib
OUTPUTFILE = $(OUTPUTDIR)/arbeit.pdf

help:
	@echo ' 																	                                    '
	@echo 'Makefile für Pandoc Markdown Vorlage                                   '
	@echo 'für Seminar-/Bachelor-/Master-/Diplomarbeiten                          '
	@echo ' 																	                                    '
	@echo 'Autor: Christian Inauen 																	            '
	@echo ' 																	                                    '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '   make pdfdocker				generate a PDF File with Docker                                                                    '
	@echo ' 																	  																	'


pdfdocker:
	docker run --rm \
    --volume "./:/data" \
    --user $(id -u):$(id -g) \
    pandoc/extra "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTFILE)" \
	--template eisvogel
	--listings
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/deutsche-gesellschaft-fur-psychologie.csl" \





pdf:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTFILE)" \
	-H "$(STYLEDIR)/preamble.tex" \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/deutsche-gesellschaft-fur-psychologie.csl" \
	--highlight-style=pygments \
	--listings \
	-V lang=de-DE \
	-V papersize=A4 \
	-V fontsize=12pt \
	-V mainfont=LiberationSerif \
	-V sansfont=LiberationSans \
	-V monofont=LiberationMono \
	-V linestretch=1.5 \
	-N \
	--latex-engine=xelatex \
	--normalize

.PHONY: help pdf pdfdocker
