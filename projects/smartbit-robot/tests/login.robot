*** Settings ***
Documentation    Cenários de testes do Login SAC

Resource        ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como Gestor de Academia
    
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Não deve logar com senha incorreta
    [Tags]    inv_pass
    Go to login page
    Submit login form      jujuba@smartbit.com    pwd123 
    Toast should be        As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logan com email não cadastrado
    [Tags]    inv_pass
    Go to login page
    Submit login form      404@smartbit.com    pwd123 
    Toast should be        As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com dados incorretos
    [Tags]        temp
    [Template]    Login with verify notice
    ${EMPTY}            ${EMPTY}        Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123          Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}        Os campos email e senha são obrigatórios.
    www.test.com.br     pwd123          Oops! O email informado é inválido
    sac&gmail.com       pwd123          Oops! O email informado é inválido
    sfsdfsfsffsdfsd     pwd123          Oops! O email informado é inválido
    465465432189786     pwd123          Oops! O email informado é inválido
    !@$%¨&*&&&&&!@!     pwd123          Oops! O email informado é inválido
    test*gmail.com      pwd123          Oops! O email informado é inválido
    yahoo.com@&*        pwd123          Oops! O email informado é inválido

*** Keywords ***
Login with verify notice
    [Arguments]        ${email}        ${password}        ${output_message}

    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be     ${output_message}
