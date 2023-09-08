# robot -i adicionar_carrinho -d result .\amazon_testes.robot
# robot -i remover_carrinho -d result .\amazon_testes.robot
# robot -i teste2 -d result .\amazon_testes.robot
# robot -i menus -d result .\amazon_testes.robot

*** Settings ***
Documentation    Essa suite testa a o site da Amazon
Resource         amazon_resources.robot
# Test Setup       Abrir navegador
Test Teardown    TestTeardown

Suite Setup       SuiteSetup
Suite Teardown    SuiteTeardown

*** Test Cases ***
Caso de teste 01 - Acesso ao menu "eletrônicos"
    [Documentation]    Esse testes verifica acesso ao menu "eletrônicos" 
    ...                Teste de documentação
    [Tags]             menus 
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece o texto "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"    
    Verificar se aparece a categoria "Celulares e Comunicação"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de teste 02 - Pesquisa por produto
    [Documentation]    Esse testes verifica Pesquisa por produto
    [Tags]             busca_produtos  lista_busca 
    Acessar a home page do site Amazon.com.br 
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho    teste2
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho    teste2
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio