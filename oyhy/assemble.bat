@echo off

title FUCK COMPILER
color e0

if exist "%1.obj" del "%1.obj"

C:\masm32\bin\ml.exe /c /coff /Fo "%1.obj" "%1.asm" > C:\masm32\bin\asmbl.txt

if errorlevel 0 dir "%1.*" >> C:\masm32\bin\asmbl.txt
start C:\masm32\tview.exe c:\masm32\bin\asmbl.txt

