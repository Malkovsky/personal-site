#!/bin/bash

set -e

cleanup_cv_artifacts() {
    rm -f cv.aux cv.log cv.out
}
trap cleanup_cv_artifacts EXIT

echo "Compiling CV..."
pdflatex -interaction=nonstopmode -halt-on-error cv/cv.tex
pdflatex -interaction=nonstopmode -halt-on-error cv/cv.tex
echo "CV compilation complete: cv.pdf"
