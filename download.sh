#!/bin/bash
chap=
url=
titleprefix=
# extract from url what is before "p1.svgz"
urlprefix=$(echo $url | sed 's/\(.*\)p1.svgz.*/\1/')
# extract from url what is after "p1.svgz"
urlsuffix=$(echo $url | sed 's/.*p1.svgz\(.*\)/\1/')

mkdir -p $chap
cd $chap;
# download the pages
for i in {1..25};
do
  wget -O p$i.svgz ${urlprefix}p$i.svgz${urlsuffix};
done

cp ../p1bis.svgz .;

for svgzfile in $(ls *.svgz);
do
  sed -i '1s/^/<?xml version="1.0" encoding="UTF-8" standalone="no"?>\n/' "$svgzfile"
  convert "$svgzfile"  "$svgzfile".pdf;
done

# dynamically generate the folowing command with the existing pages in a string
# pdfjam p1bis.svgz.pdf p1.svgz.pdf \
#       p3.svgz.pdf p2.svgz.pdf \
#       p5.svgz.pdf p4.svgz.pdf \
#       p7.svgz.pdf p6.svgz.pdf \
#       p9.svgz.pdf p8.svgz.pdf \
#       p11.svgz.pdf p10.svgz.pdf \
#       p13.svgz.pdf p12.svgz.pdf \
#       --nup 2x1 --landscape --outfile final.pdf


command="pdfjam p1bis.svgz.pdf p1.svgz.pdf";
# if double cover page it should be this command instead:
# command="pdfjam ";

# for each odd page, add the even page before it
for i in {2..25};
do
  if [ $((i%2)) -eq 0 ]; then
    #if file exists
    if [ -f p$(($i+1)).svgz.pdf ]; then
      command="$command p$(($i+1)).svgz.pdf p$i.svgz.pdf";
    fi
  fi
done
command="$command --nup 2x1 --landscape --outfile final.pdf"
# display the command
echo $command;
# execute the command
$command;

cd ../;
cp $chap/final.pdf $titleprefix-"$(printf "%03d" $chap)".pdf;
rm $chap -rf;
