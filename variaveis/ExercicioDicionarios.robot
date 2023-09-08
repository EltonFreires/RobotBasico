# 1 - Crie um arquivo de teste novo;
# 2 - Crie uma variável do tipo DICIONÁRIO na seção de variáveis globais que contenha nela os meses do ano e, para cada mês, informe o número de dias desse mês;
# 3 - Crie um teste que imprima no Console (Log To Console) cada mês e a sua respectiva quantidade de dias.
# 4 - Rode os testes e confira se logou tudo certinho!

# robot -d result .\Variaveis\ExercicioDicionarios.robot
*** Settings ***
Documentation    Exercicio com dicionários

*** Variables ***
&{MES}    Janeiro=31    
...    Fevereiro=28    
...    Março=31    
...    Abril=30    
...    Maio=31    
...    Junho=30    
...    Julho=31    
...    Agosto=31    
...    Setembro=30    
...    Outubro=31    
...    Novembro=30    
...    Dezembro=31

*** Keywords ***
Imprimir quantidade de dias dos meses do ano
    Log To Console     .
    Log To Console     Janeiro, ${MES.Janeiro} dias
    Log To Console     Fevereiro, ${MES.Fevereiro} dias
    Log To Console     Março, ${MES.Março} dias
    Log To Console     Abril, ${MES.Abril} dias
    Log To Console     Maio, ${MES.Maio} dias
    Log To Console     Junho, ${MES.Junho} dias
    Log To Console     Julho, ${MES.Julho} dias
    Log To Console     Agosto, ${MES.Agosto} dias
    Log To Console     Setembro, ${MES.Setembro} dias
    Log To Console     Outubro, ${MES.Outubro} dias
    Log To Console     Novembro, ${MES.Novembro} dias
    Log To Console     Dezembro, ${MES.Dezembro} dias    

*** Test Cases ***
Informa quantidade de dias dos meses do ano
    Imprimir quantidade de dias dos meses do ano