#/bin/bash

BASEDIR="."
INPUTDIR=$BASEDIR/source
OUTPUTDIR=$BASEDIR/output
TEMPLATEDIR=$BASEDIR/templates
STYLEDIR=$BASEDIR/style

BIBFILE=$INPUTDIR/references.bib
OUTPUTFILE=$OUTPUTDIR/hausarbeitasdf.pdf


docker run --rm \
--volume "$(pwd):/data" \
--user $(id -u):$(id -g) \
pandoc/extra \
source/*.md \
-o output/hausarbeitasdf.pdf \
--template eisvogel \
--listings \
--bibliography=$BIBFILE 2>pandoc.log \
--csl="$STYLEDIR/deutsche-gesellschaft-fur-psychologie.csl" \
-V lang=de-CH \
-V papersize=A4 \
-V fontsize=12pt \
-V mainfont=LiberationSerif \
-V sansfont=LiberationSans \
-V monofont=LiberationMono \
-V linestretch=1.5 \
-V titlepage=true \
-V toc=true \
-V toc-own-page=true \
-V header-left="\\hspace{1cm}" \
-V header-center="\\leftmark" \
-V header-right="Page \\thepage" \
-V footer-left="\\thetitle" \
-V footer-center="This is \\LaTeX{}" \
-V footer-right="\\theauthor" \
-V footnotes-pretty=true \
--filter pandoc-latex-environment \
--citeproc




#https://github.com/cagix/pandoc-thesis

