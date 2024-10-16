@echo off

: cd C:\Users\%username%\Desktop

echo Hola, vamos a pesonalizar la manera en la que se separan las palabras o carcateres de un texto que crees.

echo.
echo.

pause
echo.

echo Primero, escribe el texto que quieras:
echo.

set /p UserText=

echo %UserText% > UserTextFile.txt

:selectOPT
echo.

echo A continuacion eliga una opcion entre las opciones de separacion disponibles:
echo.
echo Opcion 1: Separacion por guiones: A---B
echo Opcion 2: Separacion por guiones bajos: A___B
echo Opcion 3: Separacion por puntos: A...B
echo.
echo Para seleccionar una opcion, escriba el numero correspondiente a la opcion deseada.
echo.

set /p UserOPT=
echo.

if %UserOPT%==1 set sep=---
if %UserOPT%==2 set sep=___
if %UserOPT%==3 set sep=...

if not %UserOPT%==1 if not %UserOPT%==2 if not %UserOPT%==3 echo Respuesta no valida, repita & goto selectOPT


echo Opcion seleccionada %UserOPT%. Es correcta? Si no, escriba "No", y eliga la opcion deseada, si es correcta escriba "Si" y siga las instrucciones.
echo.

:sino
set /p SiNo=
echo.

if %SiNo%==No goto selectOPT

if not %SiNo%==Si if not %SiNo%==No echo Respuesta no valida, repita. & goto sino

if %SiNo%==Si echo A continuacion se va a mostrar el texto con las opciones seleccionadas aplicadas...

echo.
timeout /T 3 > nul

echo Cargando texto...
echo.

: for /f "delims=" %%a in ('type UserTextFile.txt') do 

powershell -command "(gc UserTextFile.txt) -replace ' ', '%sep%' | Out-File TextoSeparado.txt"

type TextoSeparado.txt

echo.
echo Quiere guardar el archivo? Responda "Si" o "No".
echo.

:SaveOrDel

set /p save=
echo. 

if %save%==Si del UserTextFile.txt & echo Se ha guardado el archivo. Puede encontrarlo en el mismo lugar donde ejecutaste este programa. & echo.
if %save%==No del TextoSeparado.txt & del UserTextFile.txt & echo Se ha eliminado el archivo.

if not %save%==Si if not %save%==No echo Respuesta no valida, repita. & goto SaveOrDel

cd C:\Users\WIN-PC

echo Que tal le ha parecido el programa?

set /p UserAnswer=

echo %UserAnswer% > UserAnswer.txt

findstr /i "bien excelente perfecto bueno magnífico magnifico buen interesante" UserAnswer.txt > nul

if %ERRORLEVEL%==0 echo Me alegro de de que te haya gustado y te haya sido util. Envie sus sugerencias a este correo: correoInventado@gmail.com

findstr /i "malo horroroso malísimo malisimo mal" UserAnswer.txt > nul 

if %ERRORLEVEL%==0 echo Siento que no te haya sido de ayuda. Envie sus sugerencias a este correo: correoInventado@gmail.com

echo Continue para cerrar la consola.

pause



















