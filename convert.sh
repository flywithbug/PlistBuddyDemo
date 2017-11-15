
SRC_FILE="$1"
shortVersion="$2"
bundlerNum="$3"


convert "$SRC_FILE" -region 1024x244+0+780 -fill "rgb(0,159,250)" -colorize 100%   -region 1024x244+650+780 -fill "rgb(102,230,32)" -colorize 100%  target-new.png  
convert target-new.png -gravity southwest -fill white -pointsize 230 -draw "text 60,-10 '$shortVersion'"  -gravity southeast -fill white -pointsize 230 -draw "text 60,-10 '$bundlerNum'" target-new.png
