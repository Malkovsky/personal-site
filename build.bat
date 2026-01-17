@echo off
echo Building bilingual website...
echo.

echo [1/3] Rendering English version...
cd en
quarto render
cd ..
echo English version complete!
echo.

echo [2/3] Rendering Russian version...
cd ru
quarto render
cd ..
echo Russian version complete!
echo.

echo [3/3] Copying language selector...
copy index.html _site\index.html
echo Language selector copied!
echo.

echo ========================================
echo Build complete! 
echo English site: _site/en/index.html
echo Russian site: _site/ru/index.html
echo Language selector: _site/index.html
echo ========================================
