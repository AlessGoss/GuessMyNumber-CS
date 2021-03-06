@echo off
title Cleaning up...
choice /m "Do you want to move the publish folder to the root?"
if %ERRORLEVEL%==1 (
if exist "bin\Debug\net5.0\win-x86\publish" (
if exist "Release" (del /f /s /q Release & rd /s /q Release)
cd "bin\Debug\net5.0\win-x86"
move /Y "publish" "..\..\..\..\Release"
cd "..\..\..\..\"
cd "Release"
del /f /q "*.pdb"
cd ".."
)
)
choice /m "Do you want to delete bin and obj?"
if %ERRORLEVEL%==1 (
if exist "bin" (
del /f /s /q bin
rd /s /q bin
)
if exist "obj" (
del /f /s /q obj
rd /s /q obj
)
)
choice /m "Do you want to zip the Release folder "
if %ERRORLEVEL%==1 (
title Zipping Release...
ren "Release" "GuessMyNumber"
"C:\Program Files\7-Zip\7z.exe" a -tzip -mx8 GuessMyNumber.zip GuessMyNumber
ren "GuessMyNumber" "Release"
echo.
echo Release folder zipped successfully.
echo Please create a public release.
echo Press any key to delete the zip file.
pause >NUL
del /f /q GuessMyNumber.zip
)