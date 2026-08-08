#!/bin/bash

set -e

echo "Building bilingual website..."
echo ""

# Quarto will not clean output directories outside each language project.
rm -rf _site/en _site/ru

echo "[1/3] Rendering English version..."
cd en
quarto add --no-prompt quarto-ext/fontawesome
quarto render
cd ..
echo "English version complete!"
echo ""

echo "[2/3] Rendering Russian version..."
cd ru
quarto add --no-prompt quarto-ext/fontawesome
quarto render
cd ..
echo "Russian version complete!"
echo ""

echo "[3/3] Copying shared assets..."
cp index.html _site/index.html
cp -r images _site
cp cv.pdf _site/en/cv.pdf
echo "Shared assets copied!"
echo ""

echo "========================================"
echo "Build complete!" 
echo "English site: _site/en/index.html"
echo "Russian site: _site/ru/index.html"
echo "Language selector: _site/index.html"
echo "========================================"
