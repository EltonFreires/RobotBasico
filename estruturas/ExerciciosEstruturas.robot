# Siga os seguintes passos:
# Declare uma variável do tipo lista com vários números
# Crie uma keyword que percorra essa lista usando o FOR
# Dentro do FOR, faça um bloco IF que imprima no Log a frase 
# ...    "Eu sou o número 5!" e "Eu sou o número 10!", ou seja, 
# ...    só pode imprimir quando o número atual da lista for 5 ou 10.
# Use o ELSE para imprimir no Log a frase "Eu não sou o número 5 e nem o 10!"
# Se tiver DÚVIDAS olhe a solução que eu deixei de exemplo ao final dessa tarefa, 
# ...    faça igual e tente entender a lógica!!! Se a dúvida persistir, me deixa uma pergunta!!!!

*** Variables ***
@{NUMS}    3    4    5    6    7    8    9    10    11

*** Keywords ***
Estrutura for
    Log To Console    \n
    FOR  ${NUM}  IN  @{NUMS}
        IF    ${NUM} == 5 or ${NUM} == 10
            Log To Console    ===> Eu sou o número ${NUM}!
        ELSE
            Log To Console    ===> Eu não sou o número 5 e nem o 10!
        END
    END    

*** Test Cases ***
Teste 01 
    Estrutura for

