path=$(pwd)
if [[ -z "$1" ]]; then #pokud neni prazdny
	echo "ano"
	if [ "$1" != "-r" ]; then # UPPER to LOWER
		echo "ano2"
		#for arg in "$@"; do
		#	echo "anooo"
		#	path=$arg
			ls -l $path | awk '{ if($9 != "") { print $9 } }' > pom6
			while read p; do
				if [ -d "$path$p" ]; then
					echo $path$p
				else 
								
					ToLower() $p
					mw $path$p $n
				fi
			done < pom6
		#	done
	fi
fi


ToLower() {
	nove=$(awk '{ if ( $0 ~ /\b[^a-z]*[A-Z]*[^a-z]*[A-Z]+[^a-z]*\b/) {
		print tolower($0)
		}
	else { 
		print $0
       		}
	}' <<< "$1"  )
echo $nove
}
