echo off
:START
set con=2
echo open 134.0.11.185>FTPCommands.txt

echo List of available users:
echo.
echo -------------------
echo ( 1 ) - pruebas129
echo -------------------
echo.

set /p UserChosen=Choose the user you want to login with: 
if %UserChosen%==1 echo pruebas129>>FTPCommands.txt && echo )42gXJxd>>FTPCommands.txt

:ACTION
echo -------------------
echo ( 1 ) - Download
echo ( 2 ) - Upload
echo ( 3 ) - Create and upload text file
echo -------------------

set /p action=Choose if you want to upload or download a file:
echo. 
if %action%==1 GOTO DOWNLOAD
if %action%==2 GOTO UPLOAD
if %action%==3 GOTO CREATE

:DOWNLOAD
echo.
echo List of available files: 
echo.
echo -------------------
echo ( 1 ) - Test_1.txt
echo ( 2 ) - Test_2.txt
echo ( 3 ) - Test_3.txt
echo ( 4 ) - Show all the available files
echo -------------------
echo.
set /p FileChosen=Choose one of the options to download or write the name of the file with the extension: 

if %FileChosen%==4 GOTO SHOWALL
if NOT %FileChosen%==1 if NOT %FileChosen%==2 if NOT %FileChosen%==3 echo get %FileChosen%>>FTPCommands.txt && set con=1
if NOT %con%==1 echo get Test_%FileChosen%.txt>>FTPCommands.txt


echo bye>>FTPCommands.txt

ftp -s:FTPCommands.txt -v
del FTPCommands.txt
GOTO END

:UPLOAD

set /p UserFile=Write the name or absolute path of the file:

echo put %UserFile%.txt >> FTPCommands.txt
echo bye >> FTPCommands.txt
ftp -s:FTPCommands.txt -v
del FTPCommands.txt
GOTO END


:CREATE

set /p FileName=Introduce the name of the file:

set /p Text=Introduce the text that the file will contain:


echo %Text% >> %FileName%.txt

echo.
echo The file is being displayed (press ENTER to continue):
echo.
type %FileName%.txt
pause > nul
echo.
echo put %FileName%.txt>>FTPCommands.txt
echo bye>>FTPCommands.txt
ftp -s:FTPCommands.txt -v
del FTPCommands.txt
GOTO END


:SHOWALL

echo dir >> FTPCommands.txt
echo bye >> FTPCommands.txt
ftp -s:FTPCommands.txt -v
echo open 134.0.11.185>FTPCommands.txt
echo pruebas129>>FTPCommands.txt
echo )42gXJxd>>FTPCommands.txt

GOTO ACTION

:END
set /p yesno=echo Action successful. Do you want to make another action? (S/N):

if %yesno%==S GOTO START

pause > nul