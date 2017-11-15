#!/bin/sh

# we have 2 arguments: source file name and dest file name
if [ $# -ne 2 ] ; then 
  echo "Usage: tony-convert-1.sh [source path] [dest path]"
  echo "Example: ./tony-convert-1.sh src/1234.jpg out/1234_100x200.jpg"
  exit 1 
fi

srcFile="$1"
dstFile="$2"

index1=`expr index "${srcFile}" /`
index2=`expr index "${srcFile}" .`
file=`expr substr "${srcFile}" \`expr ${index1} + 1\` \`expr ${index2} - ${index1} - 1\``
ext=`expr substr "${srcFile}" \`expr ${index2} + 1\` \`expr length "${srcFile}" - ${index2}\``

#identify image num
picCount=`/usr/local/sbin/bin/bin/identify ${srcFile}|grep -c "${file}.${ext}"`
echo animate pictures: ${picCount}

if [ ${picCount} -gt 1 ] ; then
  echo "No handle for animate pictures"
  cp ${srcFile} ${dstFile} 
  exit 0 
fi

#identify image size
sizeMatrix=`/usr/local/sbin/bin/bin/identify -format "%wx%h %f\n" ${srcFile}`

index1=`expr index "${sizeMatrix}" x`
width=`expr substr "${sizeMatrix}" 1 \`expr ${index1} - 1\``
echo width: ${width}
index2=`expr \`expr index "${sizeMatrix}" ' '\` - ${index1} - 1`
height=`expr substr "${sizeMatrix}" \`expr ${index1} + 1\` ${index2}`
echo height: ${height}

if [ ${width} -lt 300 ] ; then
  if [ ${height} -lt 300 ] ; then
    echo Image size less than 300x300
    cp ${srcFile} ${dstFile}
    exit 0
  fi
fi

if [ `echo ${ext}|tr 'a-z' 'A-Z'` = "BMP" ] ; then
  index1=`expr index "${dstFile}" .`
  dstFile=`expr substr "${dstFile}" 1 \`expr ${index1} - 1\``.png
fi

#convert image/usr/local/sbin/bin/bin/convert +profile '*' ${srcFile} -resize '1024x1024>' /data/tony/watermark_1.png -gravity southeast -compose Dissolve -composite  ${dstFile}