*** Settings ***
Documentation        Teste para verificar o Slogan da Smartbit na WebApp

Library        Browser
Resource    ../resources/base.resource

*** Test Cases ***
Deve exibir o Slogan na Landing Page
    Start session
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!

    Sleep    5