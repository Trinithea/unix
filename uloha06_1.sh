# 

sort $1 > S1
sort $2 > S2
sort $3 > S3
#TODO smaz ty soubory pak zase
join -1 1 -2 1 S1 S2 > S4
join -1 1 -2 1 S4 S3 > S5
awk '{ 
	if( $2 == $3 && $3 == $4) 
	       	print $1, $2;
      	}' S5
rm S1 S2 S3 S4 S5
