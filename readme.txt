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

    