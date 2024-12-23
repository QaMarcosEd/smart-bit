*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource

# Executa uma ou mais keywords antes de cada teste
Test Setup    Start session
# Executa uma ou mais keywords depois de cada teste
Test Teardown   Take Screenshot 

*** Test Cases ***
# Deve iniciar o cadastro do cliente

#     ${account}    Get Fake Account

#     Submit signup form    ${account}
#     Verify welcome message
# ------------------------------------------------

Deve iniciar o cadastro do cliente
    [Tags]    smoke

    ${account}    Create Dictionary    
    ...    name=Papito Fernando    
    ...    email=papito@msn.com 
    ...    cpf=06097411871

    Delete Account By Email    ${account}[email]

    Submit signup form    ${account}
    Verify welcome message

# Campo nome deve ser obrigatório
#     [Tags]    required

#     ${account}        Create Dictionary
#     ...    name=${EMPTY}
#     ...    email=marcos@gmail.com
#     ...    cpf=39831866029

#     Submit signup form    ${account}
#     Notice should be        Por favor informe o seu nome completo

# Campo email deve ser obrigatório
#     [Tags]    required

#     ${account}        Create Dictionary
#     ...    name=Marcos Eduardo
#     ...    email=${EMPTY}
#     ...    cpf=39831866029

#     Submit signup form    ${account}
#     Notice should be        Por favor, informe o seu melhor e-mail

# Campo CPF deve ser obrigatório
#     [Tags]    invalid

#     ${account}        Create Dictionary
#     ...    name=Marcos Eduardo
#     ...    email=marcos@gmail.com
#     ...    cpf=${EMPTY}

#     Submit signup form    ${account}
#     Notice should be        Por favor, informe o seu CPF

# Campo de email com formato inválido
#     [Tags]    invalid

#     ${account}        Create Dictionary
#     ...    name=Marcos Eduardo
#     ...    email=marcos*gmail.com
#     ...    cpf=39831866029

#     Submit signup form    ${account}
#     Notice should be        Oops! O email informado é inválido

# Campo CPF com formato inválido
#     [Tags]    invalid

#     ${account}        Create Dictionary
#     ...    name=Marcos Eduardo
#     ...    email=marcos@gmail.com
#     ...    cpf=3983186602a

#     Submit signup form    ${account}
#     Notice should be        Oops! O CPF informado é inválido

# Massa de teste refatorada através de um template de teste
Tentativa de pré-cadastro
    [Template]    Attemp signup
    ${EMPTY}          marcos@gmail.com    39831866029    Por favor informe o seu nome completo
    Marcos Eduardo    ${EMPTY}            39831866029    Por favor, informe o seu melhor e-mail
    Marcos Eduardo    marcos@gmail.com    ${EMPTY}       Por favor, informe o seu CPF
    Marcos Eduardo    marcos*gmail.com    39831866029    Oops! O email informado é inválido
    Marcos Eduardo    www.google.com.br   39831866029    Oops! O email informado é inválido
    Marcos Eduardo    00000&&%$$%#@@@%    39831866029    Oops! O email informado é inválido
    Marcos Eduardo    0000045454545456    39831866029    Oops! O email informado é inválido
    Marcos Eduardo    marcos@gmail.com    3983186602a    Oops! O CPF informado é inválido
    Marcos Eduardo    marcos@gmail.com    39831866011    Oops! O CPF informado é inválido
    Marcos Eduardo    marcos@gmail.com    3983186644     Oops! O CPF informado é inválido
    Marcos Eduardo    marcos@gmail.com    3              Oops! O CPF informado é inválido
    Marcos Eduardo    marcos@gmail.com    $#%#%#%#       Oops! O CPF informado é inválido

*** Keywords ***
Attemp signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

        Submit signup form    ${account}
        Notice should be    ${output_message}