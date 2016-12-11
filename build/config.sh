#!/bin/bash
current_dir=`pwd`
build_dir=$current_dir/build_dir
if ! [ -e  $build_dir ];then
    mkdir -p $build_dir
fi
source_dir=`readlink -f "$current_dir/../source"`

cd $build_dir
$source_dir/configure \
    --prefix=$build_dir \
    --disable-shared \
    --enable-static \
    --with-glib=no

make && make install

cd -
