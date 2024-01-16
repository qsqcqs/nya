#!/bin/sh


#for until I do uname -r stuff
git clone https://github.com/FWDekker/mommy.git
cd mommy
p=0
k=`uname -r`
if [[ -z `echo $k | grep -1 "bsd"` ]]
then
    echo n-bsd
else
    p=1
    sudo gmake install/freebsd
    sudo gmake install/netbsd
    sudo gmake install/openbsd
fi
if [[ -z `echo $k | grep -1 "deb"` ]]
then
    echo n-deb
else
    p=1
    sudo make install/deb
fi
if [[ -z `echo $k | grep -1 "ubuntu"` ]]
then
    echo n-ubu
else
    p=1
    sudo make install/deb
fi
if [[ -z `echo $k | grep -1 "mac"` ]]
then
    echo n-mac
else
    p=1
    sudo gmake install/osxpkg
fi
if [[ -z `echo $k | grep -1 "osx"` ]]
then
    echo n-osx
else
    p=1
    sudo gmake install/osxpkg
fi
if [[ $p == 0 ]]
then
    sudo make install
fi


git clone https://github.com/qsqcqs/phwish
rm -rf /bin/mommy
mv phwish/mommy /bin/mommy
