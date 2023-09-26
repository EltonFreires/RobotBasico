Básico
Instalação 
    - pip install robotframework
    - pip install -U robotframework
    
    Verificações
    - robot --version
    - pip list
Libraries
    - pip install --upgrade robotframework-seleniumlibrary
    - pip install robotframework-requests
    
    -   *** Settings ***
        Load Json From File
        Library         OperatingSystem
VsCode
    - Instalar VsCode
    - Abrir como modo Administrador
    - View/Extensions    
        - Dracula Official
        - Material Icon theme
        - robotframework language server

WebDriver
    - Chromedrive tem que ser compatível com a versão do Chrome
    - fazer dowload do Chromedrive
    - Colocar os arquivos dentro da pasta mapeada nas variaveis de ambiente, e descompactar
        ex: C:\Users\Elton\AppData\Local\Programs\Python\Python311\Scripts\

Rodar testes
    - robot -d result -i ex_dateTime .\Robot_avancado\Libraries\
    - robot -d result -t "nome do teste" operating_System.robot
    - robot -d result .\Robot_avancado

Avançado
    - Migração Python 3: Desinstalando o Python 2 (Windows 10)
        1º - Abra "Painel de Controle > Programas > Programas e Recursos"
        2º - Procure o Python 2 na lista e desinstale
        3º - Abra "Painel de Controle > Sistema e Segurança > Sistema > Configurações Avançadas do Sistema"
        4º - Vá em "Variáveis de Ambiente..."
        5º - Procure pela seção "Variáveis do Sistema"
        6º - Selecione "Path" e clique em "Editar..." e exclua os diretórios do Python 2
    - Instalando Python 3
        - Na instalação marcar a opção "add Python 0.0 to Path"
        - Verificar versão "python --version"
        - Listar bibliotecas python "pip freeze"
        - Para atualizar "pip install -U robotframework"
        - Para Web, atualizar os drives
            - Chromedrive ex:
                - O Chrome está atualizado Versão 116.0.5845.180 (Versão oficial) 64 bits
                - Baixar Chromedrive
    - Banco de dados
        Para PostgreSQL, segue o passo-a-passo:
        01 - Baixe e instale o Banco de Dados (PostgreSQL) conforme o seu S.O.
            - https://www.postgresql.org/download/
            - Para Windows, pode ser a versão postgresql-12.0-1-windows-x64.exe (anexo nesta aula)
        02 - Acesse o PGAdmin para gerenciar o Banco de Dados
            - (Windows) Menu Iniciar -> pgAdmin4
            OBS.: Para ver os aplicativos e configurações instaladas (Windows)
            - C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 12
            - C:\Program Files\PostgreSQL\12\data
        03 - Instalar Library dataBaseLibrary
            - Documentation   [14/10/2019] https://franz-see.github.io/Robotframework-Database-Library/api/1.2.2/DatabaseLibrary.html
                Instale: "pip install -U robotframework-databaselibrary"
        04 - Para acessar o BD o Robot precisa conhecer o DRIVER de cada banco, então precisamos instalar esse DRIVER também (instale apenas para o BD que você utiliza!)
            Para: 
                PostgreSQL: "pip install psycopg2", "pip install -U psycopg2" - Documentação: https://pypi.org/project/psycopg2/
                SQLite 3: não precisa instalar nada!
                MySQL: "pip install pymysql"
                SQL Server: "pip install pymssql"
                Oracle: "pip install cx-Oracle"