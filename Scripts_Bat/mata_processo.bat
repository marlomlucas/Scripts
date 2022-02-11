@echo off
@echo Processos comuns:
@echo iexplore.exe - Internet Explorer
@echo.
set /p maquina=Maquina:
set /p processo=Processo:

taskkill /s %maquina% /u #DOMINIO\USUARIO# /p /im %processo% /f /t 
tasklist /s %maquina% /fi "IMAGENAME eq %processo%"

PAUSE