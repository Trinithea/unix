#based on https://linuxconfig.org/identifying-file-types-in-linux
if [ "$1" == "--typ" ]; then
       if [ -e "$2" ]; then
       		if [ -d "$2" ]; then
	 		echo "directory"
		elif [ -f "$2" ]; then
			echo "regular file"
		elif [ -c "$2" ]; then  
                        echo "character device file"
		elif [ -b "$2" ]; then
                        echo "block device file"
		elif [ -s "$2" ]; then
                        echo "local socket file"
		elif [ -p "$2" ]; then
                        echo "named pipe"
		elif [ -L "$2" ]; then
                        echo "symbolic link"
		fi
	else
		echo "File doesn't exist"
		exit 1
	fi
	exit 0
elif [ "$1" == "--help" ]; then
	echo "Usage: uloha01.sh [--typ|--help] [file_path]"
	echo "	--typ	shows type of file"
	echo "	--help	shows help to uloha01.sh"
	echo "Exit status:"
	echo "	0 ... if file exists"
	echo "	1 ... if file doesn't exist"
	exit 0
fi



