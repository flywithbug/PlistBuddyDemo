

SRC_FILE="$1"
shortVersion="$2"
bundlerNum="$3"



convert origin_1024.png -region 1024x254+0+770 -fill "rgb(0,159,250)" -colorize 100%   -region 1024x254+650+770 -fill "rgb(102,230,32)" -colorize 100%  target-new.png  
convert target-new.png -gravity southwest -fill white -font DINPro-Bold.otf -pointsize 230 -draw "text 60,-10 '$shortVersion'"  -gravity southeast -fill white -pointsize 230 -draw "text 60,-10 '$bundlerNum'" target-new.png


DST_PATH="Jovi/Jovi/JVImages.xcassets/AppIcon.appiconset/"

if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi



info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}
SRC_FILE="target-new.png"

info 'Generate 1024x1024.png ...'
convert "$SRC_FILE" -resize 1024x1024 "$DST_PATH/1024x1024.png"

info 'Generate Icon-20.png ...'
convert "$SRC_FILE" -resize 40x40 "$DST_PATH/Icon-20@2x.png"
info 'Generate Icon-40@2x.png ...'
convert "$SRC_FILE" -resize 60x60 "$DST_PATH/Icon-20@3x.png"


info 'Generate Icon-60@2x.png ...'
convert "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-60@2x.png"
info 'Generate Icon-60@3x.png ...'
convert "$SRC_FILE" -resize 180x180 "$DST_PATH/Icon-60@3x.png"



info 'Generate Icon-Small.png ...'
convert "$SRC_FILE" -resize 29x29 "$DST_PATH/Icon-Small.png"
convert "$SRC_FILE" -resize 58x58 "$DST_PATH/Icon-Small@2x.png"
info 'Generate Icon-Small-40@3x.png ...'
convert "$SRC_FILE" -resize 87x87 "$DST_PATH/Icon-Small@3x.png"



info 'Generate Icon-Spotlight-40@2x.png ...'
convert "$SRC_FILE" -resize 80x80 "$DST_PATH/Icon-Spotlight-40@2x.png"
info 'Generate Icon@2x.png ...'
convert "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-Spotlight-40@3x.png"


info 'Generate Icon.png ...'
convert "$SRC_FILE" -resize 57x57 "$DST_PATH/Icon.png"
info 'Generate Icon-Small@2x.png ...'
convert "$SRC_FILE" -resize 114x114 "$DST_PATH/Icon@2x.png"


info 'Generate Done.'

