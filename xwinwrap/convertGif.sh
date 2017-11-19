#/bin/bash

#get screen resolution
SCRW=`xrandr | awk '/current/ { print $8  }'`
SCRH=`xrandr | awk '/current/ { print $10  }'`
SCRH=${SCRH%\,}

#get gif resolution
IMGWH=`gifsicle --info $1 | awk '/logical/ { print $3  }'`
IMGW=${IMGWH%x*}
IMGH=${IMGWH#*x}

echo "screen resolution: " ${SCRW}x${SCRH}
echo "image resolution: " ${IMGW}x${IMGH}

convert $1 -coalesce prashant_temp.gif
convert -size ${IMGW}x${IMGH} prashant_temp.gif -resize ${SCRW}x${SCRH} $1
rm prashant_temp.gif

