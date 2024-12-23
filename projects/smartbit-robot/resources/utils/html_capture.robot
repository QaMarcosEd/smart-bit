*** Settings ***
Documentation        Fetch Page Source

Library    Browser

*** Keywords ***
Capture HTML
    Sleep    2

    ${html}        Get Page Source
    Log    ${html}
