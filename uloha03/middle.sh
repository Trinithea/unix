$( touch /tmp/doc )
if [ "$1" == "-l" ] || [ "$1" == "--lines" ]; then
	X=$(echo `echo $2 | grep -oPe  '[^-][0-9]*'`)
	M=$(echo $X | cut -d' ' -f1)
	N=$(echo $X | cut -d' ' -f2)
	if [ -z "$3" ]; then
		$( head -n $N > /tmp/doc)
	else 
		$(cat $3 | head -n $N > /tmp/doc)
	fi
	R=$( wc -l < /tmp/doc )
	cat /tmp/doc | tail -n $(( $R - $M + 1))
elif [ "$1" == "-f" ] || [ "$1" == "--fraction" ]; then
	X=$(echo `echo $2 | grep -oPe  '[^\/][0-9]*'`)
	Y=$(echo `echo $3 | grep -oPe  '[^\/][0-9]*'`)
	A=$(echo $X | cut -d' ' -f1)
        B=$(echo $X | cut -d' ' -f2)
	C=$(echo $Y | cut -d' ' -f1)
        D=$(echo $Y | cut -d' ' -f2)
	$( touch /tmp/vstup )
	if [ -z "$4" ]; then
		$(cat > /tmp/vstup)
	else 
		$(cat $4 > /tmp/vstup)
	fi
	N=$(cat /tmp/vstup | wc -l )
	if [  $((($N*$C) % $D)) == 0 ]; then 
		$(cat /tmp/vstup |  head -n $(( $N*$C / $D  )) > /tmp/doc)
	else #zaokrouhleni nahoru
		$(cat /tmp/vstup |  head -n $(( $N*$C / $D + 1 )) > /tmp/doc)
	fi
	R=$(cat /tmp/doc | wc -l)
	cat /tmp/doc | tail -n $(( $R - $N*$A / $B + 1))
	rm /tmp/vstup
elif [ "$1" == "-p" ] || [ "$1" == "--part" ]; then
	X=$(echo `echo $2 | grep -oPe  '[^\/][0-9]*'`)
	A=$(echo $X | cut -d' ' -f1)
	B=$(echo $X | cut -d' ' -f2)
	$( touch /tmp/vstup )
	if [ -z "$3" ]; then
                $(cat > /tmp/vstup)
        else
                $(cat $3 > /tmp/vstup)
	fi
	C=$(( $(cat /tmp/vstup | wc -l) / $B ))
	cat /tmp/vstup | head -n $(( $A * $C )) | tail -n $C 
	rm /tmp/vstup
fi
rm /tmp/doc
exit 0
#TODO smaz tmp soubory
#TODO to zaokrouhlovani: treba pro 4/4
# a u 4/3 to dava zase tri cisla i kdyz uz by melo jen jedno
	

