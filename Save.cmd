@ECHO OFF
for /f "delims=" %%i in ('git ls-files --deleted') do git rm %%i
set datetime=%date%_%time%
git add .
git commit -m "Quick save at %datetime%"
git push origin
git push iihe-daq
@ECHO ON
