tooldir=`echo $0 | sed "s/\(\/\)[a-z.]*$/\1/"`
binpath=`pwd`/$tooldir"bin"
installed=`echo $PATH | grep $binpath`

if [ "$installed" != "" ]; then
	echo "i am already installed!"
	exit
else
	echo "welcome to adminutils! the utils are now in your path."
fi

export PATH=$PATH:$binpath
sh
