#!/usr/bin/awk -f

BEGIN {
	RS="<"
	FS="\""
}

/^[Aa] / {
	for (i = 1; i<= NF; ++i) {
		#print i
		if ($i ~ /[Hh][Rr][Ee][Ff]/) {
	#		print $i
				if ($i ~ /=/) { 
					
					if($i ~ /'/) {
						split($i,A,"\'")
						print A[2]
						next
					}
					l = $ (i + 1)
					gsub("&quot;", "\"", l)
					gsub("&lt;", "<", l)
					gsub("&gt;", ">", l)
					gsub("&amp;", "&", l)
					print l 
					next
	 			}
			}
		}
	}
