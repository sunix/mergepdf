#!/bin/bash
chap=1032
mkdir -p $chap
cd $chap;
wget https://p.calameoassets.com/$id/p{0..25}.svgz;
rename -e 's/\d+/sprintf("%02d",$&)/e' -- *.svgz
cp ../onepiece-blank-page.svgz p01bis.svgz;

for svgzfile in $(ls *.svgz);
do
  sed -i '1s/^/<?xml version="1.0" encoding="UTF-8" standalone="no"?>\n/' "$svgzfile"
  convert "$svgzfile"  "$svgzfile".pdf;
done

pdfjam p01bis.svgz.pdf p01.svgz.pdf \
       p03.svgz.pdf p02.svgz.pdf \
       p05.svgz.pdf p04.svgz.pdf \
       p07.svgz.pdf p06.svgz.pdf \
       p09.svgz.pdf p08.svgz.pdf \
       p11.svgz.pdf p10.svgz.pdf \
       p13.svgz.pdf p12.svgz.pdf \
       p15.svgz.pdf p14.svgz.pdf \
       p17.svgz.pdf p16.svgz.pdf \
       --nup 2x1 --landscape --outfile final.pdf
       #p19.svgz.pdf p18.svgz.pdf \
       #p21.svgz.pdf p20.svgz.pdf \

cd ../;
cp $chap/final.pdf onepiece-chapitre-"$(printf "%03d" $chap)".pdf;
rm $chap -rf;
