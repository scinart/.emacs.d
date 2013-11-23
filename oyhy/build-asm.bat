@echo off
color e0
if exist "%1.obj" del "%1.obj"
if exist "%1.exe" del "%1.exe"
@echo %1
c:\masm32\bin\ml.exe /c /coff /Fo "%1.obj" "%1.asm"
if errorlevel 1 goto errasm
if not exist rsrc.obj goto nores
c:\masm32\bin\Link /OUT:"%1.exe" /SUBSYSTEM:WINDOWS /OPT:NOREF "%1.obj" rsrc.obj
if errorlevel 1 goto errlink
dir "%1.*"
goto TheEnd
:nores
c:\masm32\bin\Link /OUT:"%1.exe" /SUBSYSTEM:WINDOWS /OPT:NOREF "%1.obj"
if errorlevel 1 goto errlink
dir "%1.*"
goto TheEnd
:errlink
echo _
echo Link error
goto TheEnd
:errasm
echo _
echo Assembly Error
goto TheEnd
:TheEnd
pause
