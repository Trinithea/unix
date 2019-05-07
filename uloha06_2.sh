
sort -k 2 --field-separator=';' countrycodes_en.csv > couSort.csv
sort -k 3 --field-separator=';' kodyzemi_cz.csv > kodSort.csv
join -t ";" -1 2 -2 3 couSort.csv kodSort.csv > Sorted
awk -F ";" '{ if ( $2 == $NF ) {
		gsub("\"","",$2)
		print $2
	}
}' Sorted

rm couSort.csv kodSort.csv Sorted
