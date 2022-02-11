@echo off
rem -> ***Pega Arquitetura da Maquina.*** <-
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set Arquitetura=32-bit || set Arquitetura=64-bit

rem -> ***Pega Nome da maquina para o comando regini*** <-
FOR /F "usebackq" %%i IN (`hostname`) DO SET PCNAME=%%i
set Arquitetura=%Arquitetura%

rem -> ***Cria as Pastas*** <-
mkdir c:\tasy
mkdir c:\tasy\padrao
mkdir c:\tasy\temp
rem -> ***Copia os arquivos do Tasy*** <-
robocopy #SERVIDOR ARQUIVOS AQUI# c:\tasy is tasy.bat tasyrel.bat

rem -> ***Da as Permissões nas pastar*** <-
cacls "c:\Program Files (x86)\Borland"  /e /p todos:f
cacls "c:\tasy" /e /p todos:f
cacls "c:\oracle" /e /p todos:f

rem -> ***IF ELSE da arquitetura, Registro, Permissões no Registro (estão no arquivo reg.txt) e Copia do IDAPI32 para o Borland*** <-
IF %Arquitetura% == 64-bit (
	start tasyx64.reg
	regini -m \\%PCNAME% reg64.txt
) ELSE (
    IF %Arquitetura% == 32-bit (
	start tasy.reg
	regini -m \\%PCNAME% reg32.txt
) ELSE (
    echo Erro.
)
)
pause