#!/bin/bash

set -e

cleanup_cv_artifacts() {
    rm -f cv.aux cv.log cv.out
}
trap cleanup_cv_artifacts EXIT

echo "Building bilingual website..."
echo ""

# Quarto will not clean output directories outside each language project.
rm -rf _site/en _site/ru

echo "[1/4] Rendering English version..."
cd en
quarto add --no-prompt quarto-ext/fontawesome
quarto render
cd ..
echo "English version complete!"
echo ""

echo "[2/4] Rendering Russian version..."
cd ru
quarto add --no-prompt quarto-ext/fontawesome
quarto render
cd ..
echo "Russian version complete!"
echo ""

echo "[3/4] Compiling CV..."
pdflatex -interaction=nonstopmode -halt-on-error cv/cv.tex
pdflatex -interaction=nonstopmode -halt-on-error cv/cv.tex
echo "CV compilation complete!"
echo ""

echo "[4/4] Copying shared assets..."
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
