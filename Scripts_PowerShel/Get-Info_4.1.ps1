write-host "====== Executar com ADM | Ctrl + C = Exit ======"
while($True){
    $maquina = Read-Host 'IP/Hostname'
    if($maquina -eq 'cls'){
        cls
        write-host "====== Executar com ADM | Ctrl + C = Exit ======"
    }else{
        #"====== Pega Versão ======"
        $version = Get-WmiObject win32_product -ComputerName $maquina | where {$_.name -like 'Google Chrome'} | select version
        $version = $version.('version')
        #"==============================="
    
        #"===== Pega e Filtra o Log ====="
        $inputFile = "\\$maquina\c$\teste.log"
        $dadoslog = Get-Content $inputFile | Out-String
        $dado1 = $dadoslog.Substring($dadoslog.IndexOf('valor_procurado')+9,4) #Apos achar conta mais 9 e pega os 4 caracteres seguintes
        $dado2 = $dadoslog.Substring($dadoslog.IndexOf('valor_procurado')+6,4)
        #"==============================="

        #"=== Formata Saida em Tabela ==="
        $tabela="
        Versão=$version
        Dado1=$dado1
        Dado2=$dado2"
        ConvertFrom-StringData -StringData $tabela
        write-host "====================================="
        
        write-host "====== Impressoras ======"
        #"====== Pega Impressoras ====="
        get-WmiObject -class Win32_printer -ComputerName $maquina | select name
    }
}