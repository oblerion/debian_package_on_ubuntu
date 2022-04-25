#! /bin/bash
# oblerion makedeb 1.0 2022
input=""
str=""
BIN="main"
NDIR=""

Vpack=""
Vvers=""
Varch=""
Vmaint=""
Vdescr=""

function init_dir()
{
	NDIR=$1
	DDEBIAN="${1}/DEBIAN"
	mkdir $1
	mkdir -p $1/usr/local/bin
	cp $BIN $1/usr/local/bin/.
	mkdir $1/opt
	mkdir $DDEBIAN
	mkdir ${1}/debian
	touch ${1}/debian/control
	touch $DDEBIAN/control
}

function init_control()
{
	echo "Package:" ;
	read input;
	Vpack=$input

	echo "Version: (def:1.0)";
	read input;
	if [ "$input"="" ];then 
		input="1.0"; 
	fi
	Vvers=$input;

	echo "Architecture: (def:amd64)";
	read input;
	if [ "$input"="" ];then 
		input="amd64"; 
	fi
	Varch=$input

	echo "Maintainer: exemple -> name <name@mail.com>";
	read input;
	Vmaint=$input

	echo "Descrition:";
	read input;
	Vdescr=$input
}
function write_control()
{
	command echo "Package: ${Vpack}">>$NDIR/DEBIAN/control
	command echo "Version: ${Vvers}">>$NDIR/DEBIAN/control
	command echo "Architecture: ${Varch}">>$NDIR/DEBIAN/control
	command echo "Maintainer: ${Vmaint}">>$NDIR/DEBIAN/control
	command echo "Descrition: ${Vdescr}">>$NDIR/DEBIAN/control
}
if [ -f $1 ];then
	BIN=$1;
	init_control;
	init_dir "${Vpack}-${Vvers}-${Varch}";
	write_control;
	cd $NDIR
	command dpkg-shlibdeps -e usr/local/bin/$BIN;
	cd ..
	command dpkg-deb --build --root-owner-group $NDIR
else
	echo "first arg isn t file"
fi