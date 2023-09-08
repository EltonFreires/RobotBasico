*** Settings ***
Resource  ../resources/api_testing_usuarios.resource

Test Tags    api_suite

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    [Tags]    teste1
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário já existente
    [Tags]    teste2
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um novo usuário
    [Tags]    teste3
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados

Cenário 04: Conferencia em json
    [Tags]    teste4
    Carregar json

Cenário 05: Logar com o novo usuário criado
    [Tags]    teste5
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Realizar login com o usuário    email=${EMAIL_TESTE}  password=${password_valido}  status_code_desejado=200
    Verificar resultado do login  msgRetornada=Login realizado com sucesso

Cenário 06: Insucesso login com usuário incorreto
    [Tags]    teste6
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Realizar login com o usuário  email=${EMAIL_INVALIDO_TESTE}    password=${password_valido}  status_code_desejado=401
    Verificar resultado do login  msgRetornada=Email e/ou senha inválidos

Cenário 07: Insucesso login com senha incorreto
    [Tags]    teste7
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Realizar login com o usuário  email=${EMAIL_TESTE}    password=${password_invalido}  status_code_desejado=401
    Verificar resultado do login  msgRetornada=Email e/ou senha inválidos