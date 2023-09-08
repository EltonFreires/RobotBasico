*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Library  OperatingSystem
Library  json



*** Variables ***


*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}  Generate Random String  length=4  chars=[LOWER] 
    # ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@emailteste.com
    Set Test Variable    ${EMAIL_INVALIDO_TESTE}    ${palavra_aleatoria}aaa@emailteste.com

Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev   headers=${headers}

Cadastrar o usuário criado na ServeRest
    [Arguments]  ${email}  ${status_code_desejado}
    Set Test Variable    ${password_valido}    1234
    Set Test Variable    ${password_invalido}    123456
    ${body}  Create Dictionary
    ...      nome=Fulano da Silva
    ...      email=${email}
    ...      password=1234
    ...      administrador=true   
    
    Criar Sessão na ServeRest

    ${resposta}  POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
        
    # Log    ${resposta.json()} 
    # Log    ${resposta.json()["message"]}
    
    # exemplo de comparação de inteiros
    ${status_code_desejado}    Convert To Integer    ${status_code_desejado}    
    Should Be Equal    ${resposta.status_code}    ${status_code_desejado}
    
    # exemplo de condicional
    IF  ${resposta.status_code} == 201 
        Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se o usuário foi cadastrado corretamente
    Log  ${RESPOSTA}
    # exemplo verificação
    Dictionary Should Contain Item  ${RESPOSTA}  message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}  _id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

Consultar os dados do novo usuário
    ${resposta_consulta}  GET On Session  alias=ServeRest  url=/usuarios/${ID_USUARIO}  expected_status=200
   
    # Obtendo as propriedades do objeto response
    Log   ${resposta_consulta.status_code}
    Log   ${resposta_consulta.reason}
    Log   ${resposta_consulta.headers}
    Log   ${resposta_consulta.elapsed}
    Log   ${resposta_consulta.text}
    Log   ${resposta_consulta.json()}
    
    Set Test Variable     ${RESP_CONSULTA}  ${resposta_consulta.json()}

Conferir os dados retornados
    Log   ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome            Fulano da Silva
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email           ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password        1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador   true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id             ${ID_USUARIO}

Carregar json 
    Should Be Equal   1   1 
    # ${aa}    Load Json From File    apiTesting
    # Para o guia a seguir considere o JSON abaixo como exemplo:

    #     {
    #     "info":{
    #         "version":"1.0.0",
    #         "title":"Wikimedia REST API",
    #         "license":{
    #             "name":"Apache2",
    #             "url":"http://www.apache.org/licenses/LICENSE-2.0"
    #         },
    #         "alias":[
    #             "server1",
    #             "server2",
    #             "server3"
    #         ]
    #     },
    #     "secrets":[
    #         {
    #             "name":"Secret Alpha",
    #             "id":1
    #         },
    #         {
    #             "name":"Secret Beta",
    #             "id":2
    #         },
    #         {
    #             "name":"Secret Gama",
    #             "id":3
    #         }
    #     ]
    #     } 

    # 01 - Conferindo atributos do JSON (chave=valor):
    # Para conferir atributos, que são valores entre {}, use as keywords Dictionary Should ...
        # Exemplos:
        # Dictionary Should Contain Key     ${RESPOSTA.json()}            info
        # Dictionary Should Contain Item    ${RESPOSTA.json()["info"]}    version        1.0.0
        # Dictionary Should Contain Item    ${RESPOSTA.json()["info"]["license"]}    name    Apache2

    # 02 - Conferindo arrays do JSON (listas []):
    # Para conferir arrays dentro de JSONs, que são valores entre [], use as keywords List Should ..., lembrando-se que é necessário passar o índice do item na lista, ou utilizar FOR IN para percorrer a lista e passar item a item dessa lista!
        # Exemplos:
        # List Should Contain Value     ${RESPOSTA.json()["info"]["alias"][1]}   server1
        # List Should Contain Value     ${RESPOSTA.json()["info"]["alias"][2]}   server2
        # List Should Contain Value     ${RESPOSTA.json()["info"]["alias"][3]}   server3
        # List Should Contain Value     ${RESPOSTA.json()["secrets"][1]["name"]}  Secret Alpha
        
        # Dictionary Should Contain Item    ${RESPOSTA.json()["secrets"][1]}   name   Secret Alpha

    # 03 - Percorrendo listas de JSON com o FOR IN:
    # O código abaixo irá percorrer a lista de secrets do JSON de exemplo, imprimindo cada name e id dos 3 objetos da lista!
        # Exemplo:
        # FOR   ${secret}   IN   @{RESPOSTA.json()["secrets"]}
        #     Log   ${secret}  # Nessa linha irá imprimir o objeto inteiro
        #     Log   ${secret["name"]} # Nessa linha irá imprimir o valor "name" do objeto
        #     Log   ${secret["id"]} # Nessa linha irá imprimir o valor "id" do objeto
        # END

Realizar login com o usuário
    [Arguments]  ${email}    ${password}    ${status_code_desejado}
    ${body}  Create Dictionary
    ...      email=${email}
    ...      password=${password} 
    
    Criar Sessão na ServeRest

    ${resposta}  POST On Session
    ...          alias=ServeRest
    ...          url=/login
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}


Verificar resultado do login
    [Arguments]    ${msgRetornada}    
    Dictionary Should Contain Item  ${RESPOSTA}  message  ${msgRetornada}
    
Gerar email invalido
    [Arguments]    ${EMAIL_TESTE}
    ${EMAIL_TESTE}    Catenate    ${EMAIL_TESTE}    aaa



