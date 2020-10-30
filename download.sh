#!/bin/bash
mkdir $chap; cd $chap;
wget https://lelscan.net/mangas/one-piece/$chap/{00..25}.jpg;
for jpgfile in $(ls *.*g); do convert "$jpgfile"  "$jpgfile".pdf; done
pdftk *.pdf cat output large.pdf && pdf2ps large.pdf very_large.ps && ps2pdf very_large.ps final.pdf && rm large.pdf very_large.ps

# could be executed with:
# for i in {981..982}; do export chap=$i; /download.sh ; cp $chap/final.pdf onepiece-chapitre-"$(printf "%03d" $chap)".pdf; rm $chap -rf; done
