tooldir=`echo $0 | sed "s/\(\/\)[a-z.]*$/\1/"`
binpath=`pwd`/$tooldir"bin"
installed=`echo $PATH | grep $binpath`

if [ "$installed" != "" ]; then
	echo "i am already installed!"
	exit
fi

inbashrc=`cat ~/.bashrc | grep "$binpath"`

if [ "$inbashrc" != "" ]; then
	echo "i am installed to your users .bashrc but somehow not in your current path"
	exit
fi

echo "export PATH=\$PATH:$binpath" >> ~/.bashrc
