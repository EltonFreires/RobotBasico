*** Settings ***
Library    SeleniumLibrary
Resource    amazon_resources.robot

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]

*** Keywords ***
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "${NOME_MENU}"
    Entrar no menu "${NOME_MENU}"

Quando pesquisar pelo produto "${NOME_PRODUTO}"
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa      

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E o texto "${TEXTO}" deve ser exibido na página
    Verificar se aparece o texto "${TEXTO}"
  
E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Wait Until Element Is Visible    locator=//span[@class='nav-a-content'][contains(.,'${NOME_CATEGORIA}')]

E um produto da linha "${NOME_PRODUTO_PESQUISA}" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "${NOME_PRODUTO_PESQUISA}"

Quando adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Adicionar o produto "${PRODUTO}" no carrinho
    
Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

E existe o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Adicionar o produto "${PRODUTO}" no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

Quando remover o produto "${PRODUTO} do carrinho
    Remover o produto "${PRODUTO}" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio

