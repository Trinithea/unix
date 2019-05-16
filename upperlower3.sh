
ZpracujAdresar() {
	pom=$( ls "$1" )
	while read p; do
		if [ -d "$1"/"$p" ]; then
			ZpracujAdresar "$1"/"$p"
		else
			if [[ "$JeR" == "-r" ]]; then
				if [[ "$p" =~ [^A-Z]+ ]]; then
					nove=`awk '{ print toupper($0); }' <<< "$p"`
				fi
			elif [[ "$p" =~ [^a-z]+ ]]; then
				nove=`awk '{ print tolower($0); }' <<< "$p"`
			fi
			if [ -e "$1"/"$nove" ]; then
				echo "Chyba! Kolize u souboru" "$nove" >&2
			else
				mv "$1"/"$p" "$nove"
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
	ZpracujAdresar "$path"
fi
	

