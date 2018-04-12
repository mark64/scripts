if [ $# -lt 1 ]; then
	printf "Usage\n$0 TEX_FILE ...\n"
	return 0
fi

for file in "$@"
do
	xelatex $file
	filename=$(basename $file)
	filedir=$(dirname $file)
	base=${filename%.tex}
	bibfile=$filedir/$base.bib
	tocfile=$filedir/$base.toc
	if [ -e $bibfile ]; then
		cp $bibfile .
		biber $base
		xelatex $file
		xelatex $file
		rm $base.{bcf,bbl,blg,toc,lot}
		if [ "$bibfile" != "./$base.bib" ] && [ "$bibfile" != "$filedir/$base.bib" ]; then
			print "\n\n$bibfile\n"
			rm $base.bib
		fi
	elif [ -e $tocfile ]; then
		xelatex $file
		rm $tocfile
	fi
	rm $base{.aux,.log,.out,.run.xml}
	mkdir -p $(dirname $file)/pdfs/
	mv $base.pdf $(dirname $file)/pdfs/
#	sh /home/mark/berkeley/r4b/proof.sh $file
#	perl /home/mark/berkeley/r4b/proof.perl $file
done
