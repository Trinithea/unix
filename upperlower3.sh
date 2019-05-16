JeR="0"
ZpracujAdresar() {
	find $1 > pom
	while read line; do
		p=`echo $line | awk -F "\/" '{ print $NF }'`
	       	path=`echo $line | awk -F "\/" 'BEGIN { OFS="/"} { $NF=""; print $0 }'`	
		if ! [[ -d "$path"/"$p" ]]; then
			if [[ "$JeR" == "-r" ]]; then
				! [[ "$p" =~ [A-Z] ]] || continue
					nove=`awk '{ print toupper($0); }' <<< "$p"`
			else 
				! [[ "$p" =~ [a-z] ]] || continue
					nove=`awk '{ print tolower($0); }' <<< "$p"`
			fi			
			if [ -e "$path"/"$nove" ]; then
				echo "Chyba! Kolize u souboru $nove" >&2
			else
				mv "$path"/"$p" "$path"/"$nove"
			fi
		fi
	done < pom
}

if [ -n "$1" ]; then 
	JeR="$1"
	if [ "$1" == "-r" ]; then
		shift 1
	fi
	if [ -z "$1" ]; then
		path=$(pwd)
		ZpracujAdresar $path
	else
		while [ -n "$1" ]; do
		       path="$1"
	       		shift 1
			ZpracujAdresar "$path"		
		done
	fi
else 
	path=$(pwd)
	#echo $path	
	ZpracujAdresar "$path"
fi
	
rm pom
