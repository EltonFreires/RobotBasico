# 1 - Crie um arquivo de teste novo;
# 2 - Crie uma variável do tipo LISTA na seção de variáveis globais que contenha todos os meses do ano;
# 3 - Crie um teste que imprima no Console (Log To Console) cada item dessa lista (não use FOR, imprima um a um).
# 4 - Rode os testes e confira se logou tudo certinho!

# robot -d result .\Variaveis\ExercicioVariaveis.robot
*** Settings ***
Documentation    Exercicio com variaveis tipo lista

*** Variables ***
@{MESES}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro

*** Keywords ***
Imprimir meses do ano
    Log To Console     .
    Log To Console     ${MESES[0]}, ${MESES[1]}, ${MESES[2]}, ${MESES[3]}, ${MESES[4]}, ${MESES[5]}
    Log To Console     ${MESES[6]}, ${MESES[7]}, ${MESES[8]}, ${MESES[9]}, ${MESES[10]}, ${MESES[11]}  

*** Test Cases ***
Verifica meses do ano
    Imprimir meses do ano