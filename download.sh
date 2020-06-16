#!/bin/bash
mkdir $chap; cd $chap;
wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/%20\({1..9}\).png;
wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/%20\({1..9}\).jpg;
rename.ul '(' '0' \ *
wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/%20\({10..25}\).png;
wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/{01..25}.png;
wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/%20\({10..25}\).jpg;
wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/{01..25}.jpg;
wget https://www.scan-vf.net/uploads/manga/one_piece/chapters/chapitre-$chap/{01..25}.webp;
for webpfile in $(ls *.webp); do dwebp "$webpfile" -o "$webpfile".png; done
rename.ul '(' '' \ *
rename.ul ')' '' \ *
rename.ul ' ' '' \ *
for imagefile in $(ls *.*g); do convert "$imagefile"  "$imagefile".pdf; done
pdftk *.pdf cat output large.pdf && pdf2ps large.pdf very_large.ps && ps2pdf very_large.ps final.pdf && rm large.pdf very_large.ps

# could be executed with:
# for chap in {981..982}; do export chap=$chap; /download.sh ; cp $chap/final.pdf onepiece-chapitre-"$(printf "%03d" $chap)".pdf; rm $chap -rf; done
