#!/bin/bash
# Create a simple 24x24 calendar icon using ImageMagick
# This creates a retro green calendar icon matching the portfolio theme

magick -size 24x24 xc:transparent \
  -fill "#4AF626" \
  -draw "rectangle 3,5 21,21" \
  -fill "black" \
  -draw "rectangle 5,7 19,19" \
  -fill "#4AF626" \
  -draw "rectangle 7,3 9,7" \
  -draw "rectangle 15,3 17,7" \
  -draw "line 6,11 18,11" \
  -draw "rectangle 8,13 10,15" \
  -draw "rectangle 12,13 14,15" \
  -draw "rectangle 16,13 18,15" \
  -draw "rectangle 8,16 10,18" \
  calendar_icon.png

echo "Calendar icon created!"
