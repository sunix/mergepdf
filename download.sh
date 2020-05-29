#!/bin/bash
mkdir $chap; cd $chap; wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/{01..25}.png; wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/{01..25}.jpg;
for jpgfile in $(ls *.*g); do convert $jpgfile  "$jpgfile".pdf; done
pdftk *.pdf cat output large.pdf && pdf2ps large.pdf very_large.ps && ps2pdf very_large.ps final.pdf && rm large.pdf very_large.ps

# could be executed with:
# for chap in {0..199}; do /download.sh ; cp $chap/final.pdf onepiece-chapitre-"$(printf "%03d" $chap)".pdf; rm $chap -rf; done
