#/bin/bash

BASEDIR="."
INPUTDIR=$BASEDIR/source
OUTPUTDIR=$BASEDIR/output
TEMPLATEDIR=$BASEDIR/templates
STYLEDIR=$BASEDIR/style

BIBFILE=$INPUTDIR/references.bib
OUTPUTFILE=$OUTPUTDIR/DOKUMENT.pdf


docker run -it --rm \
--volume "$(pwd):/data" \
--user $(id -u):$(id -g) \
pandoc/extra \
source/*.md \
-o $OUTPUTFILE \
--metadata-file=config/metadata.yml \
--template eisvogel \
--filter pandoc-crossref \
--filter pandoc-latex-environment \
--bibliography=$BIBFILE \
--csl="$STYLEDIR/deutsche-gesellschaft-fur-psychologie.csl" \
--citeproc \
--number-sections



# --listings \
# --variable=documentclass:report \
# --pdf-engine=xelatex \
# "config/crossrefmeta.yml" \

#https://github.com/cagix/pandoc-thesis

