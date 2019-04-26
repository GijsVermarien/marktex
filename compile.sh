# /bin/bash
notforconversion="readme.md"
echo $notforconversion is excluded from the conversion
markdownfiles=$(find ./ -iname "*.md" -and ! -name $notforconversion)
echo Trying to convert: $markdownfiles
for markdownfile in $markdownfiles; do
	latextarget="$(echo $markdownfile | sed -e 's/.md/.tex/')"
	if [ $latextarget -ot $markdownfile ]; then
		latextarget="$(echo $markdownfile | sed -e 's/.md/.tex/')"
		pandoc -f markdown -t latex $markdownfile >$latextarget
	echo "converted" $markdownfile "to" $latextarget
	else
		echo $markdownfile did not need converting as $latextarget is newer
	fi
done
echo "done"
exit 0
