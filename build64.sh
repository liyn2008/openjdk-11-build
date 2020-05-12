#--------------------------------------------
# author：王健，2018-11-28
#配置并编译openjdk
#--------------------------------------------

#移动文件后，原软链接不能使用
#重新创建软链接
rm /usr/bin/autoconf
ln -s /usr/share/autotools/ac-wrapper.sh /usr/bin/autoconf

rm /usr/bin/autoheader
ln -s /usr/share/autotools/ac-wrapper.sh /usr/bin/autoheader

rm /usr/bin/autom4te
ln -s /usr/share/autotools/ac-wrapper.sh /usr/bin/autom4te

rm /usr/bin/autoreconf
ln -s /usr/share/autotools/ac-wrapper.sh /usr/bin/autoreconf

rm /usr/bin/autoscan
ln -s /usr/share/autotools/ac-wrapper.sh /usr/bin/autoscan

rm /usr/bin/autoupdate
ln -s /usr/share/autotools/ac-wrapper.sh /usr/bin/autoupdate

rm /usr/bin/ifnames
ln -s /usr/share/autotools/ac-wrapper.sh /usr/bin/ifnames

rm /usr/bin/python
rm /usr/bin/python2
ln -s /usr/bin/python2.7.exe /usr/bin/python
ln -s /usr/bin/python2.7.exe /usr/bin/python2

rm /dev/fd
ln -s /proc/self/fd /dev/fd

rm /dev/stdin
ln -s /proc/self/fd/0 /dev/stdin

rm /dev/stdout
ln -s /proc/self/fd/1 /dev/stdout

rm /dev/stderr 
ln -s /proc/self/fd/2 /dev/stderr

configurestr='bash configure --with-freetype-include='$(pwd)'/third/freetype-2.9.1/src/include --with-freetype-lib='$(pwd)'/third/freetype-2.9.1/lib --with-boot-jdk='$(pwd)'/third/openjdk-11.0.1_windows-x64_bin --disable-warnings-as-errors --with-toolchain-version=2017 --with-target-bits=64'
cd src
echo $configurestr
${configurestr}
echo "make all"
make all
