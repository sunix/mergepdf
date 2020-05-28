#!/bin/bash
mkdir $chap; cd $chap; wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/{01..50}.jpg;
for jpgfile in $(ls *.jpg); do convert $jpgfile  "$jpgfile".pdf; done
pdftk *.pdf cat output large.pdf && pdf2ps large.pdf very_large.ps && ps2pdf very_large.ps final.pdf && rm large.pdf very_large.ps
