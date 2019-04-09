$( touch /tmp/pom)
$( touch /tmp/vstup)
$( cat > /tmp/vstup)
i=0
NumOfRows=$( cat /tmp/vstup | wc -l )

Func(){
while [ $i -lt $(( $NumOfRows / $1 )) ]
        do
                cat /tmp/vstup | tail -n $1
                CurNOR=$((  $(cat /tmp/vstup | wc -l) - $1))
                $( cat /tmp/vstup | head -n $CurNOR > /tmp/pom)
                $( cat /tmp/pom > /tmp/vstup )
                i=$(( $i + 1 ))
        done
}

if [ "$1" == "-n" ]; then
	Func $2
	if [ $(( $NumOfRows % $2 )) != 0 ]; then
		cat /tmp/vstup
	fi
	
elif [ -z "$1" ]; then
	Func 1
fi
rm /tmp/vstup
rm /tmp/pom
exit 0

