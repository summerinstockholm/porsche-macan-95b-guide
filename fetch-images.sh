#!/usr/bin/env bash
set -euo pipefail

mkdir -p assets/images

echo "Downloading real Porsche Macan photos from Wikimedia Commons..."

curl -L --fail --retry 3 \
  "https://upload.wikimedia.org/wikipedia/commons/c/cb/The_frontview_of_Porsche_Macan_S.JPG" \
  -o assets/images/macan-95b1.jpg

curl -L --fail --retry 3 \
  "https://upload.wikimedia.org/wikipedia/commons/c/ce/2020_Porsche_Macan_GTS_grey_front.jpg" \
  -o assets/images/macan-95b2.jpg

# Keep GitHub README images reasonably sized on macOS.
if command -v sips >/dev/null 2>&1; then
  sips -Z 1600 -s formatOptions 82 assets/images/macan-95b1.jpg >/dev/null
  sips -Z 1600 -s formatOptions 82 assets/images/macan-95b2.jpg >/dev/null
fi

echo
echo "Done:"
ls -lh assets/images/macan-95b1.jpg assets/images/macan-95b2.jpg
