#!/bin/bash

OUT_MIUI_FRAMEWORK_DIR=$1
OUT_FRAMEWORK_DIR=$2
if [ "$OUT_FRAMEWORK_DIR" == "out/framework" ];then
    cp ${OUT_FRAMEWORK_DIR/out\//}.jar.out/smali/android/widget/Editor*.smali $OUT_FRAMEWORK_DIR/smali/android/widget/
fi

APKTOOL="$PORT_ROOT/tools/apktool --quiet"
GIT_APPLY=$PORT_ROOT/tools/git.apply
BUILD_OUT=out

SEP_FRAME="framework2.jar.out"

function appendSmaliPart() {
    for file in `find $1/smali -name *.part`
    do
        filepath=`dirname $file`
        filename=`basename $file .part`
        dstfile="out/$filepath/$filename"
        cat $file >> $dstfile
    done
}

function overlaySmali() {
    for file in `find $1/smali -name *.smali`
    do
        filepath=`dirname $file`
        cp -f $file out/$filepath
    done
}

function applyPatch() {
	for file in $1/*.patch
	do
		cp $file out/
		cd out
		git.apply `basename $file`
        for file2 in `find $2 -name *.rej`
        do
            echo "$file2 fail"
            exit 1
        done
		cd ..
	done
}

if [ $2 = "$BUILD_OUT/services" ]
then
    applyPatch "overlay/services"
fi
