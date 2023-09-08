# robot -i menus -d result .\amazon_testes_gherkin.robot
# robot -i busca_produtos -d result .\amazon_testes_gherkin.robot
# robot -i adicionar_carrinho -d result .\amazon_testes_gherkin.robot
# robot -i remover_carrinho -d result .\amazon_testes_gherkin.robot

*** Settings ***
Documentation    Essa suite testa a o site da Amazon
Resource         amazon_resources_gerkin.robot
# Test Setup       Abrir navegador
Test Teardown    TestTeardown

Suite Setup       SuiteSetup
Suite Teardown    SuiteTeardown

*** Test Cases ***
Caso de teste 01 - Acesso ao menu "eletrônicos"
    [Documentation]    Esse testes verifica acesso ao menu "eletrônicos" 
    ...                Teste de documentação
    [Tags]             menus 
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página
    E a categoria "Celulares e Comunicação" deve ser exibida na página

Caso de teste 02 - Pesquisa por produto
    [Documentation]    Esse testes verifica Pesquisa por produto
    [Tags]             busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Console Xbox Series S" no carrinho
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio

