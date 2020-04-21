#! /bin/bash

# Marshall all the variable we'll need
OUTPUT=$1
ATLAS=${OUTPUT}.atlas
PNG=${OUTPUT}.png

# Clean up any pre-existing stuff
rm -f ${ATLAS}
rm -f ${PNG}

# Turn each folder into a single horizontal animation strip
for folder in */ ; do
  montage ${folder}*.png -tile x1 -geometry +0+0 ${folder%%/*}.png
done

# Stack the strips on top of each other to build the atlas
montage *.png -tile 1x -geometry +0+0 ${PNG}
PNG_WIDTH=$(convert ./${PNG} -format "%w" info:)
PNG_HEIGHT=$(convert ./${PNG} -format "%h" info:)

# Write the atlas file's header information
touch ${ATLAS}
echo ${PNG} >> ${ATLAS}
echo "size: ${PNG_WIDTH},${PNG_HEIGHT}" >> ${ATLAS}
echo "format: RGBA8888" >> ${ATLAS}
echo "filter: Linear,Linear" >> ${ATLAS}
echo "repeat: none" >> ${ATLAS}

Y=0
for folder in */ ; do
  rm ${folder%%/*}.png
  X=0
  INDEX=0
  for image in ${folder}*.png ; do 
    WIDTH=$(convert ./${image} -format "%w" info:)
    HEIGHT=$(convert ./${image} -format "%h" info:)
    echo ${folder%%/*} >> ${ATLAS}
    echo " rotate: false" >> ${ATLAS}
    echo " xy: ${X}, ${Y}" >> ${ATLAS}
    echo " size: ${WIDTH}, ${HEIGHT}" >> ${ATLAS}
    echo " orig: 0, 0" >> ${ATLAS}
    echo " offset: 0, 0" >> ${ATLAS}
    echo " index: ${INDEX}" >> ${ATLAS}
    ((X+=WIDTH))
    ((INDEX++))
  done
  ((Y+=HEIGHT))
done
