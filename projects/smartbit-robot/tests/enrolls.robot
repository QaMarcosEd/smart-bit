*** Settings ***
Documentation        Suite de testes de adesões de planos

Resource        ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar um nova adesão

    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    
    Go to Erolls
    Go to enroll form
    Select account    Papito Fernando    06097411871

    Fill Text    css=input[area-label=select_plan]    Plano Black
    
    # Expressão regular para buscar o elemento div cuja o class contenha o texto option combinado com o texto Plano Black
    Click    css=div[class$=option] >> text=Plano Black

    Sleep    5

*** Keywords ***
Go to Erolls
    Click        css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible    5

Go to enroll form
    Click    css=a[href="/memberships/new"]

        Wait For Elements State    css=h1 >> text=Nova Matrícula
    ...    visible    5

Select account
    [Arguments]        ${name}        ${cpf}

    Fill Text    css=input[aria-label=select_account]       ${name}
    Click    css=[data-testid="${cpf}"]