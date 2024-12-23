*** Settings ***
Documentation        Ações e elemnentos do componente Toast

Library        Browser

*** Keywords ***
Toast should be
    [Arguments]        ${expected_test}

    Wait For Elements State    css=.Toastify__toast-body    
    ...        visible    5
    
    Get Text    css=.Toastify__toast-body   
    ...    equal   
    ...    ${expected_test}