@echo off
cd c:\Users\%username%
echo Hello, with this program you will be able to find any file or folder that matches your search.
echo.
echo First specify which directory you want to search in.
echo.
echo Available Directories:
echo Disks, F:\ or C:\
echo Downloads
echo Pictures
echo Documents
echo Music
echo Videos
echo.
echo The search delay may vary depending on the quality of the computer and the number of files.
echo Searches on drives like C:\ and F:\ may take longer than other directories because of the amplitude of the search.
echo.

:Rsearch

set /p LookFORdir=Type the directory name: 
echo.
cd %LookFORdir%

: echo %L% > UserDIR.txt

echo Ok, now type the name of the file or whatever you remember of its name. You can also search for files by their file extension. (example: .txt .jpg etc...)
echo.

set /p UserFileName=
set UserFile=%UserFileName%
echo %UserFileName% > UserFileName.txt
echo.

echo Perfect, the search will begin. *ALL* files with your specified directory path that contain the specified extension or word in their name will be displayed.
echo.

find /c "." UserFileName.txt > nul


if %ERRORLEVEL%==0 FOR /F "usebackq delims=" %%p IN (`dir %LookFORdir% /s /b *%UserFile% ^| findstr /e "%UserFile%" `) DO ( echo %%p & echo. )
if %ERRORLEVEL%==1 FOR /F "usebackq delims=" %%p IN (`dir %LookFORdir% /s /b ^| findstr /i /c:"%UserFile%" `) DO ( echo %%p & echo. )

del UserFileName.txt
echo Do you want to do another search? (Y/N)

set /p YN=

if %YN%==Y goto Rsearch
if %YN%==N echo The console will close. & timeout /T 2


pause