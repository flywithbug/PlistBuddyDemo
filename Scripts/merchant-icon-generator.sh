

SRC_FILE="$1"
shortVersion="$2"
bundlerNum="$3"

convert "$SRC_FILE" -region 1024x244+0+780 -fill "rgb(0,159,250)" -colorize 100%   -region 1024x244+650+780 -fill "rgb(102,230,32)" -colorize 100%  target-new.png  
convert target-new.png -gravity southwest -fill white -pointsize 230 -draw "text 60,-10 '$shortVersion'"  -gravity southeast -fill white -pointsize 230 -draw "text 60,-10 '$bundlerNum'" target-new.png



DST_PATH="Jovi/JVImages.xcassets/AppIcon.appiconset/"


info 'Generate Icon-29 ...'
convert "$SRC_FILE" -resize 29x29 "$DST_PATH/Icon-29.png"
info 'Generate Icon-Small@2x.png ...'
convert "$SRC_FILE" -resize 58x58 "$DST_PATH/Icon-29@2x.png"
info 'Generate Icon-Small@3x.png ...'
convert "$SRC_FILE" -resize 87x87 "$DST_PATH/Icon-29@3x.png"

info 'Generate Icon-Small-40@2x.png ...'
convert "$SRC_FILE" -resize 80x80 "$DST_PATH/Icon-Small-40@2x.png"
info 'Generate Icon-Small-40@3x.png ...'
convert "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-Small-40@3x.png"

info 'Generate Icon-40.png ...'
convert "$SRC_FILE" -resize 40x40 "$DST_PATH/Icon-40.png"
info 'Generate Icon-40@2x.png ...'
convert "$SRC_FILE" -resize 80x80 "$DST_PATH/Icon-40@2x.png"

info 'Generate Icon-60@2x.png ...'
convert "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-60@2x.png"
info 'Generate Icon-60@3x.png ...'
convert "$SRC_FILE" -resize 180x180 "$DST_PATH/Icon-60@3x.png"


info 'Generate Icon-76.png ...'
convert "$SRC_FILE" -resize 76x76 "$DST_PATH/Icon-76.png"
info 'Generate Icon-76@2x.png ...'
convert "$SRC_FILE" -resize 152x152 "$DST_PATH/Icon-76@2x.png"

info 'Generate Icon.png ...'
convert "$SRC_FILE" -resize 57x57 "$DST_PATH/Icon.png"
info 'Generate Icon@2x.png ...'
convert "$SRC_FILE" -resize 114x114 "$DST_PATH/Icon@2x.png"

info 'Generate Icon-72.png ...'
convert "$SRC_FILE" -resize 72x72 "$DST_PATH/Icon-72.png"
info 'Generate Icon-72@2x.png ...'
convert "$SRC_FILE" -resize 144x144 "$DST_PATH/Icon-72@2x.png"

info 'Generate Icon-Small-50.png ...'
convert "$SRC_FILE" -resize 50x50 "$DST_PATH/Icon-Small-50.png"
info 'Generate Icon-Small-50@2x.png ...'
convert "$SRC_FILE" -resize 100x100 "$DST_PATH/Icon-Small-50@2x.png"

info 'Generate Done.'

