*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]

*** Keywords ***
SuiteSetup
    Open Browser    browser=chrome
    Maximize Browser Window

SuiteTeardown
    Close Browser

TestTeardown
    Capture Page Screenshot    

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}    

Entrar no menu "${NOME_MENU}"
    Click Element    locator=//a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'${NOME_MENU}')]

Verificar se aparece o texto "${TEXTO}"
  Wait Until Element Is Visible    locator=//h1[contains(.,'${TEXTO}')]
  Wait Until Page Contains    text=${TEXTO}
    
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Wait Until Element Is Visible    locator=//span[@class='nav-a-content'][contains(.,'${NOME_CATEGORIA}')]
    
Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox  text=${NOME_PRODUTO}       

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button        

Verificar o resultado da pesquisa, listando o produto "${NOME_PRODUTO_PESQUISA}"
    Wait Until Element Is Visible     locator=//span[@class='a-color-state a-text-bold'][contains(.,'"${NOME_PRODUTO_PESQUISA}"')]

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
   Wait Until Element Is Visible    (//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')])[1]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')])[1]
    Element Text Should Be    locator=productTitle     expected=${PRODUTO}
    Wait Until Element Is Visible    locator=add-to-cart-button
    Click Element    locator=add-to-cart-button

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//img[contains(@class,'sc-product-image celwidget')]
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
    Wait Until Element Is Visible    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Click Element   locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Remover o produto "${PRODUTO}" do carrinho
    Wait Until Element Is Visible    locator=//input[contains(@value,'Excluir')]
    Click Element    locator=//input[contains(@value,'Excluir')]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

