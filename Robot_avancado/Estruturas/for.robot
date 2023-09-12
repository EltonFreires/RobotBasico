*** Settings ***
Test Tags    ex_for
Library    XML

*** Variables ***
@{list_enumarete}    P  M  G  GG
${my_var}     my_value
@{my_list}    Apple    Banana    Orange
&{my_dict}    name=my_value1    password=my_value2

*** Keywords ***
Velho formato do FOR de listas
    Should Be Equal    1    1
    # :FOR    ${animal}    IN  gato  cachorro  cavalo
    # \    Log    Velho Formato, animal: ${animal}        

Novo formato do FOR de listas
    FOR    ${animal}    IN    gato  cachorro  cavalo
        Log    Novo Formato, animal: ${animal}        
    END

Cria cadastros de produtos
    FOR    ${produto}    IN    blusa  calça  bermuda
        Imprime tamanhos de produtos  ${produto}        
    END

Imprime tamanhos de produtos
    [Arguments]    ${produto}
    FOR    ${tamanho}    IN    P  M  G
        Log    Produto: ${produto} - Tam: ${tamanho}            
    END

Dicionario de traducoes
    FOR    ${index}     ${portugues}    ${ingles}    IN    
    ...    1            gato            cat
    ...    2            cao             dog
    ...    3            cavalo          horse          
    
    Log    Animal ${index}:\nPortuguês-${portugues}\nInglês-${ingles}
        
    END
        
FOR com ENUMERATE
    FOR    ${index}    ${element}    IN ENUMERATE    @{list_enumarete}
        Log    index:${index}, element: ${element}        
    END
    

Teste de exemplo
    Log    my_var: ${my_var}
    Log    my_list: ${my_list}
    Log    my_dict: ${my_dict}
    
    FOR    ${item}    IN    @{my_list}
        Log    ${item}
    END
    
    Log    ${my_dict}[name]
    Log    ${my_dict}[password]
    FOR   ${key}    ${value}    IN    &{my_dict}
        Log Many    ${key}    ${value}
    END  

### FOR mais opções IN RANGE
Tradicional
    [Documentation]    Percorre de 1 até 10
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END

Apenas quantidade de laços informada (limite superior)
    [Documentation]    Percorre de 0 até 9
    FOR    ${index}    IN RANGE    10
        Log    ${index}
    END

Aritmético
    [Documentation]    Percorre de 0 até 5
    ${var}   Set Variable    ${5}
    FOR    ${index}    IN RANGE    ${var} + 1
        Log    ${index}
    END

Intervalos específicos
    [Documentation]    Percorre de 0 até 30, pulando de 5 em 5
    FOR    ${index}    IN RANGE    0    31    5
        Log    ${index}
    END
  

*** Test Cases ***
Teste do novo formato do FOR    
    Velho formato do FOR de listas
    Novo formato do FOR de listas

Teste de FOR aninhado
    Cria cadastros de produtos

For varias variaveis
    Dicionario de traducoes

Teste FOR enumarete
    FOR com ENUMERATE

Teste variavel lista e dicionario
    Teste de exemplo

Teste mais opções IN RANGE
    Tradicional
    Apenas quantidade de laços informada (limite superior)
    Aritmético
    Intervalos específicos
