echo off
echo ***Sempre executar como Administrador***
echo ***Desenvolvido por Marlom C. Lucas***
rem -> Instaladores
explorer "\\10.0.0.100\programas1\Base1"
explorer "\\10.0.0.100\programas3\BasesVB\Base_Visual_Basic_v3.0"
explorer "\\10.0.0.100\programas6\BasesVB6\Base_Visual_Basic_v3.0\TSV"
explorer "\\10.0.0.100\programas8\CRRedist2008_x64"
explorer "\\10.0.0.100\programas10\Publica_S"
explorer "\\10.0.0.100\programas12\Setup13"
explorer "\\10.0.0.100\programas16\Publica Oracle Smart View"

rem -> Regs
start \\10.0.0.100\programas5\ODBC\Prometeon\CONF_ODBC_Prometeon.reg
start \\10.0.0.100\programas5\ODBC\Prometeon\ODBC_PSQL01_64bits.reg
start \\10.0.0.100\programas5\ODBC\Prometeon\odbc64_Prometeon.reg

rem -> Atalhos
robocopy "\\10.0.0.100\programas\Atalhos_Desktop" "C:\Users\Public\Desktop"

rem -> Compartilha e da permissao
net share C=c: /grant:silva.silva,full /grant:santos.silva,full /grant:joao.silva,full /grant:paulo.silva,full /grant:paula.silva,full /grant:ana.silva,full

rem -> Impressoras
rundll32 printui.dll,PrintUIEntry /in /n \\server01\printer
rundll32 printui.dll,PrintUIEntry /in /n \\server02\printer_color
pause
