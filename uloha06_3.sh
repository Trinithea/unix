awk -F ":" '{
	n=split($4,A,",")	
	sub("$",":"n)
	print $0
}' $1 > pom

sort -r -k 5 --field-separator=":" pom > pomSorted

awk -F ":" ' BEGIN { i=1 } {
if(i==1) { n=$5; i=i+1 }
	if($5 == n) {
	 	print $1 	
	}
}' pomSorted
