#!/bin/bash

echo "=== Building QT now..."
cd /tmp/

# We use openssl 1.1.0, but Qt 5.9 uses openssl 1.0
# wget http://download.qt.io/official_releases/qt/5.9/5.9.5/single/qt-everywhere-opensource-src-5.9.5.tar.xz
# tar xf qt-everywhere-opensource-src-5.9.5.tar.xz
# cd /tmp/qt-everywhere-opensource-src-5.9.5

# ./configure -static -confirm-license -release -opensource -no-sql-sqlite -nomake examples -nomake tests -no-sse2 -xplatform win32-g++ -device-option CROSS_COMPILE=i686-w64-mingw32- -skip qtactiveqt -skip qtmultimedia -skip qtdoc -skip qtactiveqt -skip qtenginio -skip qtlocation -skip qtmultimedia -skip qtserialport -skip qtquickcontrols -skip qtscript -skip qtsensors -skip qtxmlpatterns -opengl desktop

https://bugreports.qt.io/browse/QTBUG-70487
wget http://download.qt.io/official_releases/qt/5.12/5.12.1/single/qt-everywhere-src-5.12.1.tar.xz
tar xf qt-everywhere-src-5.12.1.tar.xz
cd /tmp/qt-everywhere-src-5.12.1

# We can not buil Qt 5.12 with the current toolchain
# qrandom.cpp fails to build using 32-bit MinGW -- internal compiler error.
# Because this we should apply this patch.
# patch -p1 < /verge/VERGE/contrib/docker/forwindows/disable-qt_random_cpu_new.patch

# ./configure -static -confirm-license -release -opensource -no-sql-sqlite -nomake examples -nomake tests -no-sse2 -xplatform win32-g++ -device-option CROSS_COMPILE=i686-w64-mingw32- -skip qtactiveqt -skip qtmultimedia -skip qtdoc -skip qtactiveqt -skip qtlocation -skip qtmultimedia -skip qtserialport -skip qtquickcontrols -skip qtscript -skip qtsensors -skip qtxmlpatterns -opengl desktop

# wget http://download.qt.io/official_releases/qt/5.11/5.11.3/single/qt-everywhere-src-5.11.3.tar.xz
# tar xf qt-everywhere-src-5.11.3.tar.xz
# cd /tmp/qt-everywhere-src-5.11.3

# wget http://download.qt.io/official_releases/qt/5.10/5.10.0/single/qt-everywhere-src-5.10.0.tar.xz
# tar xf qt-everywhere-src-5.10.0.tar.xz
# cd /tmp/qt-everywhere-src-5.10.0

wget http://download.qt.io/official_releases/qt/5.10/5.10.1/single/qt-everywhere-src-5.10.1.tar.xz
tar xf qt-everywhere-src-5.10.1.tar.xz
cd /tmp/qt-everywhere-src-5.10.1

# We have to fix a bug in qmake for Qt 5.10.0: https://bugreports.qt.io/browse/QTBUG-63659
echo "QMAKE_LINK_OBJECT_MAX = 10" >> qtbase/mkspecs/win32-g++/qmake.conf
echo "QMAKE_LINK_OBJECT_SCRIPT = object_script" >> qtbase/mkspecs/win32-g++/qmake.conf

# We can not buil Qt 5.10.1 with the current toolchain
# qrandom.cpp fails to build using 32-bit MinGW -- internal compiler error.
# Because this we should apply this patch.
patch -p1 < /verge/VERGE/contrib/docker/forwindows/disable-qt_random_cpu_new.patch

OPENSSL_LIBS='-L/usr/local/lib -lssl -lcrypto -lcrypt32' ./configure -static -confirm-license -release -opensource -no-sql-sqlite -nomake examples -nomake tests -no-sse2 -xplatform win32-g++ -device-option CROSS_COMPILE=i686-w64-mingw32- -skip qtactiveqt -skip qtmultimedia -skip qtdoc -skip qtactiveqt -skip qtenginio -skip qtlocation -skip qtmultimedia -skip qtserialport -skip qtquickcontrols -skip qtscript -skip qtsensors -skip qtxmlpatterns -opengl desktop -ssl -openssl-linked -I /usr/local/include -L /usr/local/lib 

make -j 4
make install

echo "=== done building QT =="
