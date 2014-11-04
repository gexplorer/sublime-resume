#!/bin/sh

BASEDIR=$(dirname $0)

HEADER=$BASEDIR/header.html
BODY=$BASEDIR/orig.html
FOOTER=$BASEDIR/footer.html

OUTPUT=index.html
cat $HEADER > $OUTPUT;

sed -e "
s/<\//\&lt;\&#47;/g;
s/\/>/\&#47;\&gt;/g;
s/</\&lt;/g;
s/>/\&gt;/g;

s/\&lt;[A-Za-z0-9\"= \.,\/\@]*\&gt;/<div><span>&<\/span>/g;
s/\&lt;[A-Za-z0-9\"= \.,\/\@]*\&#47;\&gt;/<div><span>&<\/span><\/div>/g;
s/\&lt;&#47;[a-z0-9]*\&gt;/<span>&<\/span><\/div>/g;

s/[ ]\([a-zA-Z]*\)=\(\"[a-zA-Z0-9\.\/ ,\@]*\"\)/ <span class=\"attr\"><span class=\"name\">\1<\/span>=<span class=\"value\">\2<\/span><\/span>/g;

s/\&#47;\|\&lt;\|\&gt;/<span>&<\/span>/g;
" $BODY >> $OUTPUT

cat $FOOTER >> $OUTPUT;
